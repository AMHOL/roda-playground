module API
  Application.route do |r|
    instance.register(:app, self, call: false)

    r.on 'users' do
      r.is do
        r.get(&action(:users_controller, :index))
        r.post(&action(:users_controller, :create))
      end

      r.is :id do |id|
        r.get(&action(:users_controller, :show).bind_arguments(id))
      end
    end
  end
end
