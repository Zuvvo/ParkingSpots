Rails.application.config.middleware.use OmniAuth::Builder do
  provider :slack,
           Rails.application.credentials.dig(:slack, :client_id),
           Rails.application.credentials.dig(:slack, :client_secret),
           scope: 'identity.basic',
           callback_path: '/auth/slack/callback'
end