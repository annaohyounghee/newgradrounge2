class ChangeTaglistToEvent < ActiveRecord::Migration[5.1]
  def change
    remove_column:events, :e_tag_list, :string
    add_column:events, :e_taglist, :string
  end
end
