Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins ['http://localhost:5173', 'http://localhost:3000']
    resource(
      '*',
      headers: :any,
      credentials: true,
      methods: [:get, :patch, :put, :delete, :post, :options, :show],
      expose: %w[Authorization]
    )
  end
end
