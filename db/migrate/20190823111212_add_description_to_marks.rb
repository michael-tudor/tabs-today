class AddDescriptionToMarks < ActiveRecord::Migration[5.1]
  def change
    add_column :marks, :description, :text
  end
end
