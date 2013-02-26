module SimpleSaas
  class Engine < ::Rails::Engine
    isolate_namespace SimpleSaas

    initializer :simple_saas do
      ActiveAdmin.application.load_paths.unshift Dir[File.dirname(__FILE__) + '/simple_saas/admin']
    end
  end
end
