class AddUserToReachouts < ActiveRecord::Migration[5.1]
  def change
    add_reference :reachouts, :user, foreign_key: true
  end
end
