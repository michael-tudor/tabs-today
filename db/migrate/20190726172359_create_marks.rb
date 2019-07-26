class CreateMarks < ActiveRecord::Migration[5.1]
  def change
    create_table :marks do |t|
      t.string :title
      t.string :position_size # => 'x,y,width,heigth'
      t.string :type # => 'Text' || 'List' || 'Link' || 'File'
      t.string :window_status # => 'hidden' || 'open'
      t.string :style

      t.timestamps
    end
  end
end
