class User < ApplicationRecord
	has_many :surveys
	mount_uploader :avatar, AvatarUploader
    before_create :set_user_role

    devise :database_authenticatable, :registerable, 
    :recoverable, :rememberable, :validatable, :confirmable,
    :omniauthable, :omniauth_providers => [:facebook]

    def full_name
    	first_name + last_name
    end

    def admin?
    	self.role == "admin"
    end

    def set_user_role
        self.role = "visitor"
    end


    def self.new_with_session(params, session)
        super.tap do |user|
            if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
                user.email = data["email"] if user.email.blank?
            end
        end
    end

    def self.from_omniauth(auth)
        where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
            user.email = auth.info.email
            user.password = Devise.friendly_token[0,20]
            user.first_name = auth.info.first_name
            user.last_name = auth.info.last_name
            user.avatar = auth.info.image
        end
    end
end
