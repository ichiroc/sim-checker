namespace :cron do
  task deliver_total_coupon_volume_notification: :environment do
    User.where.not(iijmio_token: nil).find_each do |user|
      user.deliver_total_coupon_volume_notification.deliver
    end
  end

  task check_total_coupon_volume: :environment do
    User.where.not(iijmio_token: nil).find_each do |user|
      user.update_volume_and_notify
    end
  end
end
