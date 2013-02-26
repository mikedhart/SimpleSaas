module SimpleSaas
  class SimpleSaas < Rails::Engine
    # Add a load path for this specific Engine
    config.autoload_paths << File.expand_path("services", __FILE__)

    initializer "simple_saas.add_middleware" do |app|
      app.middleware.use SimpleSaas::Middleware
    end

    initializer :my_engine do
      ActiveAdmin.application.load_paths.unshift Dir[File.dirname(__FILE__) + '/simple_saas/admin']
    end
  end
end