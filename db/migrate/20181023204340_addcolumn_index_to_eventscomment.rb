class AddcolumnIndexToEventscomment < ActiveRecord::Migration[5.1]
  def change
    add_column :eventcomments, :ancestry, :string
    add_index :eventcomments, :ancestry
  end
end
