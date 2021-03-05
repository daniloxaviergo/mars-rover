class Rover
  attr_accessor :position, :rotation

  def initialize(position = [10, 10], plateau = [20, 20])
    @position = position
    @plateau = Plateau.new(plateau)
    @rotation = Rotation.new
  end

  def to_position(axis_x, axis_y)
    return @position if axis_x.negative? || axis_y.negative?

    @position[0] = axis_x > @plateau.limit_x ? @plateau.limit_x : axis_x
    @position[1] = axis_y > @plateau.limit_y ? @plateau.limit_y : axis_y

    @position
  end

  def forward
    axis, operation = @rotation.forward_cardinal

    x = @position[0]
    y = @position[1]
    if axis == 'x'
      x = operation == '+' ? x + 1 : x - 1
    else
      y = operation == '+' ? y + 1 : y - 1
    end

    to_position(x, y)
  end
end
