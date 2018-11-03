class AddMissingFieldsToReachouts < ActiveRecord::Migration[5.1]
  def change
  	add_column :reachouts, :back_story, :string
  	add_column :reachouts, :reachout_type, :string
  	add_column :reachouts, :audience, :string
  	add_column :reachouts, :interest, :string
  	add_column :reachouts, :tag, :string
  	add_column :reachouts, :format, :string
  	add_column :reachouts, :duration, :string
  	add_column :reachouts, :reachout_when, :date
  	add_column :reachouts, :reachout_where, :string
  	add_column :reachouts, :compensation, :string
  	add_column :reachouts, :mescellaneous, :string
  end
end
