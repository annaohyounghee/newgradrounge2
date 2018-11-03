class AddFromAndToToEducationAndExperience < ActiveRecord::Migration[5.1]
  	def self.up
	  	add_column :experiences, :from_date, :date
	  	add_column :experiences, :to_date, :date
	  	add_column :educations, :from_date, :integer
	  	add_column :educations, :to_date, :integer
  	end

  	def self.down
	  	remove_column :experiences, :from, :date
	  	remove_column :experiences, :to, :date
	  	remove_column :educations, :from_year, :integer
	  	remove_column :educations, :to_year, :integer
  	end
end
