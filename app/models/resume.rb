# == Schema Information
#
# Table name: resumes
#
#  id         :integer          not null, primary key
#  attachment :string
#  user_id    :integer
#  job_id     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Resume < ApplicationRecord
	mount_uploader :attachment, AttachmentUploader
	validates :job_id, presence: true
	validates :user_id, presence: true
	validates :attachment, presence: true
end
