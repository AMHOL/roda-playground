module API
  Application.route do |r|
    r.on 'users' do
      r.is do
        r.get(&Application.action(:users, :index))
      end

      r.is :id do |id|
        r.get(&Application.action(:users, :show).bind_arguments(id))
      end
    end
  end
end
