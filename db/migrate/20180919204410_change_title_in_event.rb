class ChangeTitleInEvent < ActiveRecord::Migration[5.1]
  def change
    rename_column :events, :e_title, :title
  end
end
