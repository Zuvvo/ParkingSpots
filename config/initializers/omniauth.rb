Rails.application.config.middleware.use OmniAuth::Builder do
  provider :slack,
           Rails.application.credentials.dig(:slack, :client_id),
           Rails.application.credentials.dig(:slack, :client_secret),
           scope: 'team:read,users:read,identify',
           callback_path: '/auth/slack/callback',
           redirect_uri: '#{ENV["REQUEST_DOMAIN"]}/auth/slack/callback'
end