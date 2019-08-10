class CreateWorkspaces < ActiveRecord::Migration[5.1]
  def change
    create_table :workspaces do |t|
      t.integer :parent_id
      t.string :name
      t.string :position_and_sizes # => {}

      t.timestamps
    end

    add_reference :workspaces, :user, foreign_key: true
  end
end
