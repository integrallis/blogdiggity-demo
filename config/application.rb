require File.expand_path('../boot', __FILE__)

require 'rails/all'

if defined?(Bundler)
  # If you precompile assets before deploying to production, use this line
  Bundler.require(*Rails.groups(:assets => %w(development test)))
  # If you want your assets lazily compiled in production, use this line
  # Bundler.require(:default, :assets, Rails.env)
end

module BlogdiggityOrg
  class Application < Rails::Application

    # Configure the default encoding used in templates for Ruby 1.9.
    config.encoding = "utf-8"

    # Configure sensitive parameters which will be filtered from the log file.
    config.filter_parameters += [:password]

    # Enable escaping HTML in JSON.
    config.active_support.escape_html_entities_in_json = true

    config.active_record.whitelist_attributes = true

    # Version of your assets, change this if you want to expire all your assets
    config.assets.version = '1.0'
    
    # Configure Logger for Unicorn
    config.logger = Logger.new(STDOUT)
    
    # Enable & Configure the asset pipeline for Heroku + Unicorn
    config.assets.enabled = true

    # Needs to be false on Heroku
    config.assets.initialize_on_precompile = false
    
    # Can be set to invalidate the whole cache
    config.assets.version = "1.1"

    # Serving static assets and setting cache headers 
    # which will be used by cloudfront as well
    config.serve_static_assets = true
    config.static_cache_control = "public, max-age=31536000"
    
    config.assets.debug = true
    config.assets.compress = false
    
    config.serve_static_assets = true

    # Compress JavaScripts and CSS
    config.assets.compress = true

    # Setting compressor currently doesn't work
    config.assets.css_compressor = :yui
    config.assets.js_compressor = :uglifier

    # Generate digests for assets URLs
    config.assets.digest = true
  end
end
