class AddtypetoEventcomment < ActiveRecord::Migration[5.1]
  def change
    add_column :eventcomments, :eventcommentable_type, :string
    add_column :eventcomments, :eventcommentable_id, :integer
  end
end
