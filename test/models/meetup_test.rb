# == Schema Information
#
# Table name: meetups
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  quantity    :integer
#  price       :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  image       :string
#  category_id :integer
#

require 'test_helper'

class MeetupTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
