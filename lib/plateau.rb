class Plateau
  def initialize(area = [20, 20])
    @area = area
  end

  def limit_x
    @area[0]
  end

  def limit_y
    @area[1]
  end
end
