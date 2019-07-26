class AddUserToMarks < ActiveRecord::Migration[5.1]
  def change
    add_reference :marks, :user, foreign_key: true
  end
end
