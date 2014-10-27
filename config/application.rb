require File.expand_path('../boot', __FILE__)

require 'rails/all'
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Reboot
  class Application < Rails::Application
  config.generators do |g|
    g.test_framework :rspec, fixture: true
    g.fixture_replacement :factory_girl, dir: 'spec/factories'
    g.assets false
    g.helper false
    g.view_specs false
    g.helper_specs false
  end
  config.assets.precompile.shift
  config.assets.precompile.push(Proc.new do |path|
    File.extname(path).in? [
      '.html', '.erb', '.haml',                 # Templates
      '.png',  '.gif', '.jpg', '.jpeg', '.svg', # Images
      '.eot',  '.otf', '.svc', '.woff', '.ttf', # Fonts
    ]
  end)
  config.time_zone = 'Eastern Time (US & Canada)'
  config.react.addons = true
  config.middleware.use Rack::Cors do
    allow do
      origins '*'
      resource %r{/*},
      headers: :any,
      methods: [:get, :put, :patch, :post, :delete],
      expose: '*'
    end
  end
  config.assets.raise_production_errors = true
  config.action_dispatch.perform_deep_munge = false
  config.i18n.default_locale = 'en'
  config.autoload_paths += %W(#{config.root}/lib)
  config.assets.precompile += %w( application )
  end
end
