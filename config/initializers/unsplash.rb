Unsplash.configure do |config|    
  config.application_id = Rails.application.secrets.app_id
  config.application_secret = Rails.application.secrets.app_secret
  config.application_redirect_uri = "https://your-application.com/oauth/callback"
end
