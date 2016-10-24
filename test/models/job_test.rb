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

require 'test_helper'

class JobTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
