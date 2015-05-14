module API
  class Application < ::Roda
    plugin :action
    plugin :json

    detach_container
  end

  # TODO: Move to apps/web/...
  class UsersController
    attr_accessor :app, :relation

    def initialize(app, relation)
      @app, @relation = @app, relation
    end

    def index
      relation.to_a
    end

    def show(id)
      relation.filter(:id, :eq, id.to_i).first
    end
  end

  Application.register(:users_controller) do
    UsersController.new(Application.resolve(:app), Core.relation(:users))
  end
end
