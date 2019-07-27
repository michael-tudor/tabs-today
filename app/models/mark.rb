class Mark < ApplicationRecord
  belongs_to :user

  def x
    hash_of_position_size[:x]
  end

  def y
    hash_of_position_size[:y]
  end

  def width
    hash_of_position_size[:width]
  end

  def height
    hash_of_position_size[:height]
  end

  private

  def hash_of_position_size
    if position_size.present?
      array = position_size.split(',')
      if array.length == 4
        {
          x: array[0],
          y: array[1],
          width: array[2],
          height: array[3]
        }
      end
    else
      Hash.new(0)
    end
  end
end
