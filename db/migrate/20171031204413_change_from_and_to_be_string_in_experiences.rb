class ChangeFromAndToBeStringInExperiences < ActiveRecord::Migration[5.1]
  def change
  	change_column :experiences, :from, :string
  	change_column :experiences, :to, :string
  end
end
