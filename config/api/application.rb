module API
  class Application < ::Application
    plugin :json

    register(:users_controller) do
      Controllers::Users.new(resolve(:app), Core.relation(:users))
    end
  end
end
