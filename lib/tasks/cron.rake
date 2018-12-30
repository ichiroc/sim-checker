namespace :cron do
  task deliver_total_coupon_volume_notification: :environment do
    User.where.not(iijmio_token: nil).find_each do |user|
      puts user.name
      puts user.email
      user.deliver_total_coupon_volume_notification.deliver
    end
  end
end
