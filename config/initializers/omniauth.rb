Rails.application.config.middleware.use OmniAuth::Builder do
  provider :slack, Rails.application.credentials.dig(:slack, :api_key), Rails.application.credentials.dig(:slack, :api_secret), scope: 'identity.basic'
end