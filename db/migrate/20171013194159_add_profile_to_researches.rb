class AddProfileToResearches < ActiveRecord::Migration[5.1]
  def change
    add_reference :researches, :profile, foreign_key: true
  end
end
