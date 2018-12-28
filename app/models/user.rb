class User < ApplicationRecord
  devise :database_authenticatable, :trackable,
         :omniauthable, omniauth_providers: %i[google]

  def self.find_for_google(auth)
    user = User.find_by(email: auth.info.email)

    if user.blank?
      user = User.create(name:     auth.info.name,
                         provider: auth.provider,
                         uid:      auth.uid,
                         token:    auth.credentials.token,
                         password: Devise.friendly_token[0, 20],
                         meta:     auth.to_yaml)
    end
    user
  end
end
