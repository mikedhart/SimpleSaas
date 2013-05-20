module SimpleSaas
  class SimpleSaas < Rails::Engine
    # Add a load path for this specific Engine
    config.autoload_paths << File.expand_path("services", __FILE__)

    initializer "simple_saas.add_middleware" do |app|
      app.middleware.use SimpleSaas::Middleware
    end
  end
end

DEFAULT_CURRENCY = "GBP"
