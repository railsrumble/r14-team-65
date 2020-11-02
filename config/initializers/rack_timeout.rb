Rails.application.config.middleware.insert_before Rack::Runtime, Rack::Timeout, service_timeout: (ENV["TIMEOUT_IN_SECONDS"] || 5).to_i
