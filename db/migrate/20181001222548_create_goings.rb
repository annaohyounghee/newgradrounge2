class CreateGoings < ActiveRecord::Migration[5.1]
  def change
    create_table :goings do |t|
      t.integer :user
      t.integer :event

      t.timestamps
    end
  end
end
