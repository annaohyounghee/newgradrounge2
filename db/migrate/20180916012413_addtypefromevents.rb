class Addtypefromevents < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :e_type, :string
    add_column :events, :e_audience, :string
    add_column :events, :e_interest, :string
    add_column :events, :e_tag_list, :string
  end
end
