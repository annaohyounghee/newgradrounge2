class CreateEventcomments < ActiveRecord::Migration[5.1]
  def change
    create_table :eventcomments do |t|
      t.text :content
      t.references :event, foreign_key: true

      t.timestamps
    end
  end
end
