# frozen_string_literal: true

# Adds vector functionlaity to the line class from Ruby2d
class LineVector < Ruby2D::Line
  def initialize(opts = {})
    if opts.key?(:point1)
      opts[:x1] = opts[:point1].x
      opts[:y1] = opts[:point1].y
    end
    if opts.key?(:point2)
      opts[:x2] = opts[:point2].x
      opts[:y2] = opts[:point2].y
    end
    super opts
  end

  def add_vector(vector)
    @x1 += vector.x
    @y1 += vector.y
    @x2 += vector.x
    @y2 += vector.y
  end

  # Getter for point1
  def point1
    Vector2D.new(@x1, @y1)
  end

  # Getter for point2
  def point2
    Vector2D.new(@x2, @y2)
  end

  # Setter for point1
  def point1=(point)
    @x1 = point.x
    @y1 = point.y
  end

  # Setter for point2
  def point2=(point)
    @x2 = point.x
    @y2 = point.y
  end
end
