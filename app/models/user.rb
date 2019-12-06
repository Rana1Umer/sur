class User < ApplicationRecord
	has_many :surveys
	mount_uploader :avatar, AvatarUploader

    devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

    def full_name
    	first_name + last_name
    end

    def admin?
    	self.role == "admin"
    end
end
