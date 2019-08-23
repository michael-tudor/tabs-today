class ChangeWorkspacesPositionsAndSizes < ActiveRecord::Migration[5.1]
  def change
    change_column :workspaces, :positions_and_sizes, :text
  end
end
