class Workspace < ApplicationRecord
  belongs_to :user

  def positions_and_sizes_to_h
    self.positions_and_sizes.present? ? JSON.parse(self.positions_and_sizes) : {}
  end
end
