class AddintextoEventscomment < ActiveRecord::Migration[5.1]
  def change
    add_index :eventcomments, :eventcommentable_type
    add_index :eventcomments, :eventcommentable_id 
    add_index :eventcomments, :user_id 

   
  end
end
