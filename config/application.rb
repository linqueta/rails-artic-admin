# frozen_string_literal: true

require_relative 'boot'

require 'rails'
require 'active_model/railtie'
require 'active_job/railtie'
require 'active_record/railtie'
require 'action_controller/railtie'
require 'action_view/railtie'
require 'sprockets/railtie'

Bundler.require(*Rails.groups)

module PropertyFinder
  class Application < Rails::Application
    config.load_defaults 6.1

    config.generators.system_tests = nil
    config.generators do |g|
      g.test_framework :rspec, view_specs: false,
                               controller_specs: false,
                               helper_specs: false,
                               routing_specs: false,
                               request_specs: false
    end

    extra_paths = [Rails.root.join('lib')]
    config.autoload_paths.concat(extra_paths)
    config.eager_load_paths.concat(extra_paths)

    config.i18n.default_locale = :'pt-BR'
    config.i18n.fallbacks = [:en]
    config.time_zone = 'Brasilia'
  end
end
