class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :position
      t.string :faculty
      t.string :department

      t.timestamps
    end
  end
end
