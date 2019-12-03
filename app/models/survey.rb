class Survey < ApplicationRecord
	before_create :set_status_pending
	before_save :check_status
	belongs_to :user


	STATUSES = {
		'pending'     => 'pending',
		'completed'   => 'completed',
		'expired'      => 'expired'
	}

	def self.valid_statuses
		STATUSES.keys
	end

	def set_status_pending
		self.status = "pending"
	end

	def check_status
		if Date.today < self.due_date
			if self.name.present? && self.gender.present? && self.province.present? && self.interest.present? && self.biography.present?
				self.status = 'completed'
			else
				self.status = 'pending'
			end
		else
			self.status = 'expired'
		end
	end

	# validates :status, inclusion: { in: valid_statuses },
	# presence: true

	def extended_status
		STATUSES[status]
	end
end


