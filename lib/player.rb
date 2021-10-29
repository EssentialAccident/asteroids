# frozen_string_literal: true

# I manages the player
class Player
  ANGLE = 120 * Math::PI / 180
  ANGLE_VELOCITY = 3 * Math::PI / 180
  MAX_ACCELERATION = 1
  def initialize
    @center = Vector2D.new(WINDOW_WIDTH / 2, WINDOW_HEIGHT / 2)
    @angle = 0
    @radius = 15
    @triangle = make_triangle
    @velocity = Vector2D.zero
    @acceleration = Vector2D.zero
  end

  def update
    @triangle = make_triangle
    @velocity = @velocity.add_vector(@acceleration)
    @center = @center.add_vector(@velocity.limit(MAX_VELOCITY))
    wrap_window
    @acceleration = Vector2D.zero
  end

  def accelerate
    @acceleration = Vector2D.from_radians(@angle)
  end

  def turn(direction)
    case direction
    when :left
      @angle -= ANGLE_VELOCITY
    when :right
      @angle += ANGLE_VELOCITY
    end
    @angle = @angle % (2 * Math::PI)
  end

  private

  def make_triangle
    @triangle&.remove
    points = calculate_points
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

  def calculate_points
    points = []
    3.times do |count|
      if count == 0
        points.push(
          Vector2D.new(
            @center.x + ((@radius + 10) * Math.cos((ANGLE * count) + @angle)),
            @center.y + ((@radius + 10) * Math.sin((ANGLE * count) + @angle))
          )
        )
      else
        points.push(
          Vector2D.new(
            @center.x + (@radius * Math.cos((ANGLE * count) + @angle)),
            @center.y + (@radius * Math.sin((ANGLE * count) + @angle))
          )
        )

      end
    end
    points
  end

  def wrap_window
    @center = Vector2D.new(
      @center.x % WINDOW_WIDTH,
      @center.y % WINDOW_HEIGHT
    )
  end
end
