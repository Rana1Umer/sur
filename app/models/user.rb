class User < ApplicationRecord
	has_many :surveys
    devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

    def full_name
    	first_name + last_name
    end
end
