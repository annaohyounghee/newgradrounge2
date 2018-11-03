class RemoveReachoutidFromComments < ActiveRecord::Migration[5.1]
  def change
    remove_column :comments, :reachout_id, :string
  end
end
