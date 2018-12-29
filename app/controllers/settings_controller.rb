class SettingsController < ApplicationController
  before_action :authenticate_user!

  def edit
    if current_user.iijmio_token.present?
      client = IijmioApi.new(current_user)
      @total_coupon_volume = client.total_coupon_volume
    end
  end
end
