class ChangeFromYearAndToYearBeIntegerInEducations < ActiveRecord::Migration[5.1]
  def change
  	change_column :educations, :from_year, :string
  	change_column :educations, :to_year, :string
  end
end
