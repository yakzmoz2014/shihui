class AddCategoryIdToMeetup < ActiveRecord::Migration[5.0]
  def change
    add_column :meetups, :category_id, :integer
  end
end
