class Item < ApplicationRecord
	belongs_to :user
  belongs_to :assignee, class_name: 'User', optional: true

	def completed?
		!completed_at.blank?
	end
end
