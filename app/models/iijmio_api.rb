class IijmioApi
  def initialize(user)
    @user = user
  end

  def packet
    faraday = Faraday.new(url: 'https://api.iijmio.jp')
    faraday.get do |req|
      req.url '/mobile/d/v2/log/packet/'
      req.headers['X-IIJmio-Developer'] = ENV['IIJMIO_DEVELOPER_ID']
      req.headers['X-IIJmio-Authorization'] = @user.iijmio_token
    end
  end

  def headers
    {
      'X-IIJmio-Developer' => ENV['IJMIO_DEVELOPER_ID'],
      'X-IIJmio-Authorization' => @user.iijmio_token
    }
  end
end
