module API
  class Application < ::Application
    plugin :json

    register(:users_controller) do
      UsersController.new(resolve(:app), Core.relation(:users))
    end
  end

  # TODO: Move to apps/api/...
  class UsersController
    attr_accessor :app, :relation

    def initialize(app, relation)
      @app, @relation = app, relation
    end

    def index
      relation.to_a
    end

    def show(id)
      relation.filter(:id, :eq, id.to_i).first
    end
  end
end
