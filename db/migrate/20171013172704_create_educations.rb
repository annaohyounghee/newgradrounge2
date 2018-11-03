class CreateEducations < ActiveRecord::Migration[5.1]
  def change
    create_table :educations do |t|
      t.string :school
      t.string :degree
      t.string :field_of_study
      t.string :grade
      t.text :description
      t.date :from_year
      t.date :to_year

      t.timestamps
    end
  end
end
