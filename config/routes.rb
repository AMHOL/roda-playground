Application.route do |r|
  r.on 'api' do
    r.run API::Application
  end

  r.run Web::Application
end
