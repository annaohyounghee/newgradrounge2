class CreateExperiences < ActiveRecord::Migration[5.1]
  def change
    create_table :experiences do |t|
      t.string :title
      t.string :company
      t.string :location
      t.date :from
      t.date :to
      t.text :description

      t.timestamps
    end
  end
end
