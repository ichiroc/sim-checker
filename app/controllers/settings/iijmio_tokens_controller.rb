class Settings::IijmioTokensController < ApplicationController
  def show; end

  def create
    current_user.iijmio_token = params['access_token']
    current_user.iijmio_token_created_at = Time.current
    if current_user.iijmio_token.present? && current_user.save
      redirect_to edit_setting_path, notice: 'アクセストークンを保存しました'
    else
      redirect_to edit_setting_path, alert: 'アクセストークンを保存できませんでした'
    end
  end
end
