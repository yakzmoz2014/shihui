class CreateMeetupLists < ActiveRecord::Migration[5.0]
  def change
    create_table :meetup_lists do |t|
      t.integer :order_id
      t.string :meetup_name
      t.integer :meetup_price
      t.integer :quantity
      t.timestamps
    end
  end
end
