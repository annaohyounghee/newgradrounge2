class AddProfileToEducations < ActiveRecord::Migration[5.1]
  def change
    add_reference :educations, :profile, foreign_key: true
  end
end
