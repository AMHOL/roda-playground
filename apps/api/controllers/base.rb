module API
  module Controllers
    class Base
      extend Forwardable

      attr_accessor :app
      def_delegators :app, :params, :request, :response
      def_delegators API::Application, :resolve

      def initialize(app)
        @app = app
      end
    end
  end
end
