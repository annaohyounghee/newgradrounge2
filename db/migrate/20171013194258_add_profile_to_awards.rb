class AddProfileToAwards < ActiveRecord::Migration[5.1]
  def change
    add_reference :awards, :profile, foreign_key: true
  end
end
