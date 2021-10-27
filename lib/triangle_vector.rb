# frozen_string_literal: true

class TriangleVector < Ruby2D::Triangle
  def initialize(opts={})
    if opts.key?(:point1)
      opts[x1:] = opts(:point1).x
      opts[y1:] = opts(:point1).y
    end
    if opts.key?(:point2)
      opts[x2:] = opts(:point2).x
      opts[y2:] = opts(:point2).y
    end
    if opts.key?(:point3)
      opts[x3:] = opts(:point3).x
      opts[y3:] = opts(:point3).y
    end
    super opts
  end
end
