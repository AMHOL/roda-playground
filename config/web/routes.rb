module Web
  Application.route do |r|
    r.on 'users' do
      r.is do
        r.get do
          Core.relation(:users).to_a
        end
      end
    end
  end
end
