# == Schema Information
#
# Table name: meetup_lists
#
#  id           :integer          not null, primary key
#  order_id     :integer
#  meetup_name  :string
#  meetup_price :integer
#  quantity     :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'test_helper'

class MeetupListTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
