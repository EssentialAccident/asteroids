# frozen_string_literal: true

# Creates the rocks to be the enemies in the game
class Asteroid
  MIN_OUTLINE_DIVISIONS = 5
  MAX_OUTLINE_DIVISIONS = 15
  MAX_DIVIATION = 20

  # @radius The radius of the asteroid
  # @position The position for the center of the asteroid
  # @outline Array that contains the lines of the asteroid
  def initialize(position, radius = 50)
    @radius = radius
    @position = position
    @outline = outline(rand(MIN_OUTLINE_DIVISIONS..MAX_OUTLINE_DIVISIONS))
  end

  def outline(divisions)
    angle_tick = (2 * Math::PI) / divisions
    points = define_points(divisions, angle_tick)
    # Draws the sides of the asteroid
    define_lines(points)
  end

  def update; end

  def draw; end

  private

  # Defines the points of the sides of the asteroid
  def define_points(divisions, angle_tick)
    points = []
    divisions.times do |i|
      x_diviation = rand(-MAX_DIVIATION..MAX_DIVIATION)
      y_diviation = rand(-MAX_DIVIATION..MAX_DIVIATION)
      points.push(
        Vector2D.new(
          @position.x + x_diviation + (@radius * Math.cos(angle_tick * i)),
          @position.y + y_diviation + (@radius * Math.sin(angle_tick * i))
        )
      )
    end
    points
  end

  # Defines the lines for the asteroid
  def define_lines(points)
    lines = []
    points.each_with_index do |point, index|
      if index + 1 == points.count
        x2 = points[0].x
        y2 = points[0].y
      else
        x2 = points[index + 1].x
        y2 = points[index + 1].y
      end
      lines.push(
        Line.new({ x1: point.x, y1: point.y,
                   x2: x2, y2: y2,
                   width: 1,
                   color: 'white' })
      )
    end
    lines
  end
end
