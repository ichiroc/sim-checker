module SettingsHelper
  def iijmio_authorization_url
    "https://api.iijmio.jp/mobile/d/v1/authorization/?response_type=token&client_id=#{ENV['IIJMIO_DEVELOPER_ID']}&state=auth&redirect_uri=#{ENV['IIJMIO_REDIRECT_URL']}"
  end
end
