module API
  class Application < ::Roda
    plugin :action
    plugin :json

    detach_container
  end

  # TODO: Move to apps/web/...
  class UsersController
    attr_accessor :relation

    def initialize(relation)
      @relation = relation
    end

    def index
      relation.to_a
    end

    def show(id)
      relation.filter(:id, :eq, id.to_i).first
    end
  end

  Application.register(:users_controller, -> { UsersController.new(Core.relation(:users)) })
end
