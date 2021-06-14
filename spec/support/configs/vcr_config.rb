# frozen_string_literal: true

module VcrConfig
  class << self
    def configure(config, envs)
      allow_cassettes(envs)
      VCR.extend(CassetteCleaner)
      config.after(:suite) { VcrConfig.check_unused_cassettes(config) } if all_files?(config)
    end

    def all_files?(config)
      (Dir[Rails.root.join('spec/**/*_spec.rb')] - config.files_to_run).empty?
    end

    def allow_cassettes(envs)
      VCR.configure do |config|
        config.allow_http_connections_when_no_cassette = false
        config.cassette_library_dir = 'spec/cassettes'
        config.hook_into :webmock
        config.ignore_localhost = true
        config.configure_rspec_metadata!

        envs.each { |f| config.filter_sensitive_data("ENV[#{f}]") { ENV[f] } }
      end
    end

    def check_unused_cassettes(config)
      return unless env?('CHECK_UNUSED_CASSETTES') && unused_cassettes.any?
      return if config.formatter_loader.reporter.failed_examples.any?

      if env?('DELETE_UNUSED_CASSETTES')
        puts '', '--- These cassettes are unused and were deleted ---'
        unused_cassettes.each { puts " - #{_1}" }
        unused_cassettes.each { File.delete(_1) }
      else
        puts '', '--- These cassettes are unused ---'
        unused_cassettes.each { puts " - #{_1}" }
      end

      raise 'Check unused cassetes'
    end

    private

    def unused_cassettes
      @unused_cassettes ||=
        Dir.glob('spec/cassettes/**/*.yml')
           .map { File.expand_path(_1) } - UsedCassettes.all
    end

    def env?(env)
      ENV[env] == 'true'
    end
  end

  module CassetteCleaner
    def insert_cassette(name, options = {})
      current_cassette = VCR::Cassette.new(name, options).file
      if configuration.default_cassette_options[:record] == :all
        File.delete(current_cassette) if File.exist?(current_cassette)
      else
        UsedCassettes.add(current_cassette)
      end
      super
    end
  end

  class UsedCassettes
    class << self
      def add(item)
        @list ||= []
        @list << item
      end

      def all
        @list || []
      end
    end
  end
end
