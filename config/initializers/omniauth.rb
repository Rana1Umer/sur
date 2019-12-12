Rails.application.config.middleware.use OmniAuth::Builder do
    provider :developer unless Rails.env.production?
    provider :facebook, ENV['FACEBOOK_APP_ID'], ENV['FACEBOOK_APP_SECRET'],
    		client_options: {
               	site: 'https://graph.facebook.com/v5.0',
               	authorize_url: "https://www.facebook.com/v5.0/dialog/oauth"
            }
    # provider :google_oauth2, ENV['GOOGLE_CLIENT_ID'], ENV['GOOGLE_CLIENT_SECRET']

end
