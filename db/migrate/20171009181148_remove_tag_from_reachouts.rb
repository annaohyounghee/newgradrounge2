class RemoveTagFromReachouts < ActiveRecord::Migration[5.1]
  def change
    remove_column :reachouts, :tag, :string
  end
end
