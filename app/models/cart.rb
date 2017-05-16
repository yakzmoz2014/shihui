# == Schema Information
#
# Table name: carts
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Cart < ApplicationRecord
  has_many :cart_items
  has_many :meetups, through: :cart_items, source: :meetup

  def add_meetup_to_cart(meetup)
    ci = cart_items.build
    ci.meetup = meetup
    ci.quantity = 1
    ci.save
  end
end
