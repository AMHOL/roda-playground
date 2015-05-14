module API
  Application.route do |r|
    # This kind of thing is why lazy evaluation on resolution is key
    Application.register(:app, self)

    r.on 'users' do
      r.is do
        r.get(&Application.action(:users_controller, :index))
      end

      r.is :id do |id|
        r.get(&Application.action(:users_controller, :show).bind_arguments(id))
      end
    end
  end
end
