Rails.application.configure do
  if !Rails.env.development? || ENV["LOGRAGE_IN_DEVELOPMENT"] == "true"
    config.lograge.enabled = true
    config.lograge.formatter = Lograge::Formatters::Json.new
    config.lograge.custom_options = lambda do |event|
      {
        user_id: event.payload[:user_id],
        params:  event.payload[:params]&.except("controller", "action", "format")
      }.compact
    end
  end
end
