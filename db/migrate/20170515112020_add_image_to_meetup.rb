class AddImageToMeetup < ActiveRecord::Migration[5.0]
  def change
    add_column :meetups, :image, :string
  end
end
