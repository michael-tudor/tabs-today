class Workspace < ApplicationRecord
  belongs_to :user

  def positions_and_sizes_to_h
    JSON.parse(positions_and_sizes)
  end
end
