class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.integer :e_num
      t.string :e_writer
      t.string :e_title
      t.datetime :e_time
      t.text :e_address
      t.string :e_postal
      t.text :e_detail
      t.datetime :e_writetime

      t.timestamps
    end
  end
end
