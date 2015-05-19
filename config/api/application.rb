module API
  class Application < ::Application
    plugin :json

    register(:users_controller) do
      Controllers::Users.new(
        Application.instance.resolve(:app),
        Core.relation(:users),
        Core.command(:users)
      )
    end
  end
end
