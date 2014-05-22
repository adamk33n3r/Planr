Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '261303974498-hj1pp9l26mcdpi4r4pef0mmasa4ktjgk.apps.googleusercontent.com', 'aJl2Dd60YdxYjyKJ_dnNsn44', {
    access_type: 'offline',
    name: "google",
    scope: 'https://www.googleapis.com/auth/userinfo.email https://www.googleapis.com/auth/calendar'
    }
end