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

class Meetup < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  validates :quantity, presence: true
  validates :price, presence: true
  mount_uploader :image, ImageUploader
  belongs_to :category
end
