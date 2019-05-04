require 'faraday_middleware'

class IijmioApi
  def initialize(user)
    @user = user
  end

  def packet
    fetch('/mobile/d/v2/log/packet/')
  end

  def total_coupon_volume
    fetch_coupon.body
      .dig('couponInfo', 0, 'coupon')
      .map { |coupon| coupon['volume'] }
      .sum
  rescue StandardError => e
    ScheduleMailer.error_notification(@user, e).deliver_now
    @user.update!(iijmio_token: nil)
  end

  private

  def fetch_coupon
    fetch('/mobile/d/v2/coupon/')
  end

  def fetch(path)
    client.get do |req|
      req.url path
      req.headers['X-IIJmio-Developer'] = ENV['IIJMIO_DEVELOPER_ID']
      req.headers['X-IIJmio-Authorization'] = @user.iijmio_token
    end
  end

  def client
    Faraday.new(url: 'https://api.iijmio.jp') do |conn|
      conn.request :json
      conn.response :json, :content_type => /\bjson$/
      conn.adapter Faraday.default_adapter
    end
  end

  def headers
    {
      'X-IIJmio-Developer' => ENV['IJMIO_DEVELOPER_ID'],
      'X-IIJmio-Authorization' => @user.iijmio_token
    }
  end
end
