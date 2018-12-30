class User < ApplicationRecord
  devise :database_authenticatable, :trackable,
         :omniauthable, omniauth_providers: %i[google]

  def self.find_for_google(auth)
    user = User.find_by(email: auth.info.email)

    if user.blank?
      user = User.create(name:     auth.info.name,
                         email:    auth.info.email,
                         provider: auth.provider,
                         uid:      auth.uid,
                         token:    auth.credentials.token,
                         password: Devise.friendly_token[0, 20],
                         meta:     auth.to_yaml)
    end
    user
  end

  def deliver_total_coupon_volume_notification
    ScheduleMailer.total_coupon_volume_notification(self).deliver
  end

  def update_volume_and_notify
    client = IijmioApi.new(self)
    current_volume = client.total_coupon_volume || 0
    if (previous_volume / 100).round != (current_volume / 100).round
      ScheduleMailer.threshold_exceed_notification(self, current_volume).deliver
    end
    update!(previous_volume: current_volume, previous_volume_updated_at: Time.current)
  end
end
