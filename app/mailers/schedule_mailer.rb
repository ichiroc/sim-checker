class ScheduleMailer < ApplicationMailer

  def total_coupon_volume_notification(user)
    api = IijmioApi.new(user)
    @total_coupon_volume = api.total_coupon_volume
    @user = user
    mail(to: user.email, subject: "[SIM-CHECKER] クーポン残量通知 - #{@total_coupon_volume}MB")
  end
end