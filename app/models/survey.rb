class Survey < ApplicationRecord
	before_create :set_due_date

	# belongs_to :user
	# enum status: {pending: 0, completed: 1, incompleted: 2}

	def set_due_date
		self.due_date =  Date.today + 5.days
	end

	STATUSES = {
		'pending'     => 'pending',
		'completed'   => 'completed',
		'incompleted' => 'incompleted'
	}

	def self.valid_statuses
		STATUSES.keys
	end

	validates :status, inclusion: { in: valid_statuses },
	presence: true

	def extended_status
		STATUSES[status]
	end
end