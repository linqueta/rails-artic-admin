# frozen_string_literal: true

require 'simplecov'
require 'simplecov-console'

module SimpleCovConfig
  def self.configure
    SimpleCov.formatter = SimpleCov::Formatter::Console
    SimpleCov.minimum_coverage 100
    SimpleCov.start 'rails' do
      add_filter { |source_file| cover?(source_file.lines) }
      add_filter '/app/admin/'
      add_filter '/spec/'
      add_filter '/app/mailers/'
      add_filter '/app/helpers/'
    end
  end

  def self.cover?(lines)
    !lines.detect { |line| line.src.match?(/(def |attributes)/) }
  end
end
