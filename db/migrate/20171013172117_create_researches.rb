class CreateResearches < ActiveRecord::Migration[5.1]
  def change
    create_table :researches do |t|
      t.text :description

      t.timestamps
    end
  end
end
