class Command
  attr_accessor :output

  def initialize(instructions)
    @instructions = instructions.split("\n")
    @output = []
  end

  def execute
    @rover = Rover.new(inicial_position)
    @instructions[1..@instructions.length].each do |cmds|
      next if cmds.empty?

      cmds = cmds.gsub(' ', '').split('')
      if position_cmd?(cmds)
        position(cmds)
      else
        direction(cmds)
        append_output
      end
    end
  end

  private

  def append_output
    x = @rover.position[0]
    y = @rover.position[1]
    cardinal = @rover.rotation.cardinal

    @output.push("#{x} #{y} #{cardinal}".upcase)
  end

  def direction(cmds)
    return if cmds.empty?

    cmds.each do |cmd|
      alias_cmd(cmd.downcase.to_sym)&.call
    end
  end

  def position(cmds)
    return unless cmds.length == 3

    x = cmds[0].to_i
    y = cmds[1].to_i

    @rover.to_position(x, y)
    @rover.rotation.to_cardinal(cmds[2].downcase)
  end

  def alias_cmd(cmd)
    return @alias[cmd] if @alias.present?

    @alias = {
      m: proc { @rover.forward },
      r: proc { @rover.rotation.to_right },
      l: proc { @rover.rotation.to_left }
    }

    @alias[cmd]
  end

  def position_cmd?(cmds)
    cmds.map(&:to_i).sum.positive?
  end

  def inicial_position
    @instructions.first.split.map(&:to_i)
  end
end
