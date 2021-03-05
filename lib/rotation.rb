class Rotation
  attr_accessor :position

  def initialize()
    @position = 0
  end

  def to_right
    @position = @position - 90
    @position = @position < 0 ? 270 : @position
  end

  def to_left
    @position = @position + 90
    @position = @position >= 360 ? 0 : @position
  end

  def to_cardinal(direction)
    case direction
    when 'n'
      @position = 0
    when 's'
      @position = 180
    when 'w'
      @position = 90
    when 'e'      
      @position = 270
    end
  end
end
