module API
  module Controllers
    class Users < Base
      attr_accessor :relation, :command_registry

      def initialize(app, relation, command_registry)
        super(app)
        @relation , @command_registry = relation, command_registry
      end

      def index
        relation.to_a
      end

      def show(id)
        user = relation.filter(:id, :eq, id).first
        if user.nil?
          response.status = 404
        else
          user
        end
      end

      def create
        command_registry.create.call(params)
      end
    end
  end
end
