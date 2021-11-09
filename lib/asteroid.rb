# frozen_string_literal: true

# Creates the rocks to be the enemies in the game
class Asteroid
  MIN_OUTLINE_DIVISIONS = 5
  MAX_OUTLINE_DIVISIONS = 10
  MAX_DIVIATION = 20

  # @radius The radius of the asteroid
  # @position The position for the center of the asteroid
  # @outline Array that contains the lines of the asteroid
  def initialize(radius = 50)
    @radius = radius
    @outline = outline(rand(MIN_OUTLINE_DIVISIONS...MAX_OUTLINE_DIVISIONS))
    @velocity = Vector2D.new(
      rand(-MAX_VELOCITY...MAX_VELOCITY),
      rand(-MAX_VELOCITY...MAX_VELOCITY)
    )
    @center = origin_direction
    @outline.each do |line|
      line.add_vector(@center)
    end
  end

  def outline(divisions)
    angle_tick = (2 * Math::PI) / divisions
    points = define_points(divisions, angle_tick)
    # Draws the sides of the asteroid
    define_lines(points)
  end

  def update
    @center.add_vector(@velocity)
    @outline.each do |line|
      line.add_vector(@velocity)
      if (line.x1 < 0 && line.x2 < 0) ||
         (line.x1 > WINDOW_WIDTH && line.x2 > WINDOW_WIDTH)
        line.x1 = line.x1 % WINDOW_WIDTH
        line.x2 = line.x2 % WINDOW_WIDTH
      end
      next unless (line.y1 < 0 && line.y2 < 0) ||
                  (line.y1 > WINDOW_HEIGHT && line.y2 > WINDOW_HEIGHT)

      line.y1 = line.y1 % WINDOW_HEIGHT
      line.y2 = line.y2 % WINDOW_HEIGHT
    end
  end

  def remove
    @outline.map(&:remove)
  end

  private

  # Defines the points of the sides of the asteroid
  def define_points(divisions, angle_tick)
    position = Vector2D.new(WINDOW_WIDTH / 2, WINDOW_HEIGHT / 2)
    points = []
    divisions.times do |i|
      x_diviation = rand(-MAX_DIVIATION..MAX_DIVIATION)
      y_diviation = rand(-MAX_DIVIATION..MAX_DIVIATION)
      points.push(
        Vector2D.new(
          position.x + x_diviation + (@radius * Math.cos(angle_tick * i)),
          position.y + y_diviation + (@radius * Math.sin(angle_tick * i))
        )
      )
    end
    points
  end

  # Defines the lines for the asteroid
  def define_lines(points)
    lines = []
    points.each_with_index do |point, index|
      point2 = if index + 1 == points.count
                 points[0]
               else
                 points[index + 1]
               end
      lines.push(
        LineVector.new({ point1: point,
                         point2: point2,
                         width: 1,
                         color: 'white' })
      )
    end
    lines
  end

  # It stablishes with direction the asteroid will show up on the screen
  def origin_direction
    direction = %i[top bottom right left]
    case direction.sample
    when :top
      Vector2D.new(rand(WINDOW_WIDTH), WINDOW_HEIGHT + 1000)
    when :bottom
      Vector2D.new(rand(WINDOW_WIDTH), -1000)
    when :left
      Vector2D.new(-1000, rand(WINDOW_HEIGHT))
    when :right
      Vector2D.new(WINDOW_WIDTH + 1000, rand(WINDOW_HEIGHT))
    end
  end
end
