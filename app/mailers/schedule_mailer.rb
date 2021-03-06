class ScheduleMailer < ApplicationMailer
  def total_coupon_volume_notification(user)
    api = IijmioApi.new(user)
    @total_coupon_volume = api.total_coupon_volume
    @user = user
    mail(to: user.email, subject: "[SIM-CHECKER] クーポン残量通知 - #{@total_coupon_volume}MB")
  end

  def threshold_exceed_notification(user, current_volume)
    @user = user
    @current_volume = current_volume
    mail(to: user.email, subject: "[SIM-CHECKER] 残量 #{current_volume}MB")
  end

  def error_notification(user, error)
    @error = error
    mail(to: user.email, subject: '[SIM-CHECKER] エラー通知 #{error.message}')
  end
end
