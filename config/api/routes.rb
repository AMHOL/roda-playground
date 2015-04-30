module API
  Application.route do |r|
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
