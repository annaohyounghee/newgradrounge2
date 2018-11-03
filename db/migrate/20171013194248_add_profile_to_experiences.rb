class AddProfileToExperiences < ActiveRecord::Migration[5.1]
  def change
    add_reference :experiences, :profile, foreign_key: true
  end
end
