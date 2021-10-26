# Adds vector functionlaity to the line class from Ruby2d

class LineVector < Ruby2D::Line
  def initialize(opts = {})
    if opts.has_key?(:point1)
      opts[:x1] = opts[:point1].x
      opts[:y1] = opts[:point1].y
    end
    if opts.has_key?(:point2)
      opts[:x2] = opts[:point2].x
      opts[:y2] = opts[:point2].y
    end
    super opts
  end
end
