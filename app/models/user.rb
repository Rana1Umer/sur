class User < ApplicationRecord
	has_many :surveys
	mount_uploader :avatar, AvatarUploader

    devise :database_authenticatable, :registerable, 
    :recoverable, :rememberable, :validatable, :confirmable,
    :omniauthable, omniauth_providers: %i[facebook]

    def full_name
    	first_name + last_name
    end

    def admin?
    	self.role == "admin"
    end

    # def self.sign_in_form_omniauth(auth)
    #     find_by(provider: auth['provider'], uid: auth['uid']) || create_user_from_omniauth(auth)
    # end

    # def self.create_user_from_omniauth(auth)
    #     create(
    #         provider: auth['provider'],
    #         uid: auth[uid],
    #         name: auth['info']['name']
    #     )
    # end


    def self.from_omniauth(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.email = auth.info.email
        user.password = Devise.friendly_token[0, 20]
        user.name = auth.info.name   # assuming the user model has a name
        # If you are using confirmable and the provider(s) you use validate emails, 
        # uncomment the line below to skip the confirmation emails.
        # user.skip_confirmation!
      end
    end

    def self.new_with_session(params, session)
        super.tap do |user|
          if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
            user.email = data["email"] if user.email.blank?
          end
        end
    end



end
