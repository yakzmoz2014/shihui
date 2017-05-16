# == Schema Information
#
# Table name: orders
#
#  id               :integer          not null, primary key
#  total            :integer          default("0")
#  user_id          :integer
#  billing_name     :string
#  billing_address  :string
#  shipping_name    :string
#  shipping_address :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  token            :string
#  is_paid          :boolean          default("f")
#  payment_method   :string
#  aasm_state       :string           default("order_placed")
#
# Indexes
#
#  index_orders_on_aasm_state  (aasm_state)
#

class Order < ApplicationRecord
  include AASM
  before_create :generate_token

  def generate_token
    self.token = SecureRandom.uuid
  end


  belongs_to :user
  has_many :meetup_lists

  validates :billing_name, presence: true
  validates :billing_address, presence: true
  validates :shipping_name, presence: true
  validates :shipping_address, presence: true

  def set_payment_with!(method)
    self.update_columns(payment_method: method)
  end

  def pay!
    self.update_columns(is_paid: true)
  end

# 订单状态机制
  aasm do
    state :order_placed, initial: true
    state :paid
    state :shipping
    state :shipped
    state :order_cancelled
    state :good_returned

    event :make_payment , after_commit: :pay! do
      transitions from: :order_placed, to: :paid
    end

    event :ship do
      transitions from: :paid,           to: :shipped
    end

    event :deliver do
      transitions from: :shipping,       to: :good_returned
    end

    event :return_good do
      transitions from: :shipped,         to: :good_returned
    end

    event :cancel_order do
      transitions from: [:order_placed, :paid], to: :order_cancelled
    end
  end
end
