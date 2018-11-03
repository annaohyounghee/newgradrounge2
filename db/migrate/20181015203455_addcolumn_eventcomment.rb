class AddcolumnEventcomment < ActiveRecord::Migration[5.1]
  def change
    add_column :eventcomments, :user_id, :integer
  end
end
