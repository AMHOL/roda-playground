module API
  module Controllers
    class Base
      extend Forwardable

      attr_accessor :app
      def_delegators :app, :params, :request, :response

      def initialize(app)
        @app = app
      end
    end
  end
end
