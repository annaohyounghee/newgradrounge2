class CreateSaves < ActiveRecord::Migration[5.1]
  def change
    create_table :saves do |t|
      t.integer :user
      t.integer :reachout

      t.timestamps
    end
  end
end
