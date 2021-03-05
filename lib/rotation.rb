class Rotation
  attr_accessor :position

  def initialize
    @position = 0
  end

  def to_right
    @position -= 90
    @position = @position.negative? ? 270 : @position
  end

  def to_left
    @position += 90
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

  def forward_cardinal
    forward = {
      n: ['y', '+'],
      s: ['y', '-'],
      e: ['x', '+'],
      w: ['x', '-']
    }

    forward[cardinal]
  end

  def cardinal
    cardinal = { '0' => :n, '90' => :w, '180' => :s, '270' => :e }
    cardinal[@position.to_s]
  end
end
