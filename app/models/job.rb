# == Schema Information
#
# Table name: jobs
#
#  id               :integer          not null, primary key
#  title            :string
#  description      :text
#  wage_lower_bound :integer
#  wage_upper_bound :integer
#  contact_email    :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  is_hidden        :boolean
#

class Job < ApplicationRecord

	validates :title, presence: true

	validates :wage_lower_bound, presence: true
	validates :wage_upper_bound, presence: true

	# validates :is_hidden, presence: true

	validates :wage_lower_bound, numericality: true
	validates :wage_upper_bound, numericality: true

	validates :wage_lower_bound, numericality: { greater_than: 0}

	def hide
		self.is_hidden = true
		save

	end

	def publish
		self.is_hidden = false
		save
	end

end
