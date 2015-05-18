module API
  module Controllers
    class Users < Base
      attr_accessor :relation

      def initialize(app, relation)
        super(app)
        @relation = relation
      end

      def index
        relation.to_a
      end

      def show(id)
        relation.filter(:id, :eq, id.to_i).first
      end
    end
  end
end
