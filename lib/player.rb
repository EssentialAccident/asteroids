# frozen_string_literal: true

# I manages the player
class Player
  ANGLE = 120 * Math::PI / 180
  def initialize
    @center = Vector2D.new(WINDOW_WIDTH / 2, WINDOW_HEIGHT / 2)
    @angle = 0
    @radius = 15
    points = calculate_points
    @triangle =
      TriangleVector.new(
        {
          point1: points[0],
          point2: points[1],
          point3: points[2],
          color: 'silver',
          opacity: 0.5
        }
      )
  end

  private

  def calculate_points
    points = []
    3.times do |count|
      points.push(
        Vector2D.new(
          @center.x + (@radius * Math.cos(ANGLE * count)),
          @center.y + (@radius * Math.sin(ANGLE * count))
        )
      )
    end
    points
  end
end
