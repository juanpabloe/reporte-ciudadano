module ApplicationHelper

  def omniauth_provider_path(provider)
    "/auth/#{provider.to_s}"
  end

  def data_position
    if Rails.env.development?
      position = Geocoder.search("131.178.128.39").first
    else
      position = request.location
    end
    lng = position ? position.longitude : "17.065593"
    lat = position ? position.latitude : "-96.724253"
    { "data-longitude" => lng, "data-latitude" => lat }
  end

  def timeago(time, options = {})
    options[:class] ||= "timeago"
    content_tag(:abbr, time.to_s, options.merge(:title => time.getutc.iso8601)) if time
  end

  def timeago_script_tag
    locale = I18n.locale
    return javascript_include_tag "jquery-timeago/locales/jquery.timeago.#{locale}" if locale != "en"
    ''
  end

end
