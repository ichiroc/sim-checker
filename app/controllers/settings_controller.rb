class SettingsController < ApplicationController
  before_action :authenticate_user!

  def edit
    if current_user.iijmio_token.present?
      @packet = IijmioApi.new(current_user).packet.body
    end
  end
end
