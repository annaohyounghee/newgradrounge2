class RemoveFromAndToFromEducationAndExperience < ActiveRecord::Migration[5.1]
  	def self.up
	  	remove_column :experiences, :from, :string
	  	remove_column :experiences, :to, :string
	  	remove_column :educations, :from_year, :string
	  	remove_column :educations, :to_year, :string
  	end

  	def self.down
	  	add_column :experiences, :from, :string
	  	add_column :experiences, :to, :string
	  	add_column :educations, :from_year, :string
	  	add_column :educations, :to_year, :string
  	end
end
