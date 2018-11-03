class CreateShares < ActiveRecord::Migration[5.1]
  def change
    create_table :shares do |t|
      t.integer :user
      t.integer :event

      t.timestamps
    end
  end
end
