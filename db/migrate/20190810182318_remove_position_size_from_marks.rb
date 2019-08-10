class RemovePositionSizeFromMarks < ActiveRecord::Migration[5.1]
  def change
    remove_column :marks, :position_size
  end
end
