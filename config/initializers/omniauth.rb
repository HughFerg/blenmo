Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV["GOOGLE_CLIENT_ID"], ENV["GOOGLE_CLIENT_SECRET"], name: "google", image_aspect_ratio: "square", origin_param: 'next'
end

#OmniAuth.config.on_failure = ErrorsController.action(:bad_domain)
