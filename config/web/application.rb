module Web
  class Application < ::Roda
    plugin :json

    # TODO: Move to mixin
    class << self
      def register(type, key, instance)
        container[type][key] = instance
      end

      def get(type, key)
        instance = container[type][key]
        instance.respond_to?(:call) ? instance.call : instance
      end

      def action(controller, action)
        Action.new(get(:controller, controller).method(action))
      end

      private

      def container
        @container ||= Hash.new do |hash, key|
          hash[key] = {}
        end
      end
    end

    class Action
      def initialize(action)
        @action = action.to_proc
      end

      def bind_arguments(*args)
        method = @action
        action = proc { method.call(*args) }
        @action = action
      end

      def to_proc
        @action
      end
    end
  end
end
