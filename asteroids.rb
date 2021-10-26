# frozen_string_literal: true

# Required Gems
require 'ruby2d'
require 'vector2d'

# Require internal files
require_relative 'lib/asteroid'

# Setting up the window
set({ title: 'Asteroids',
      width: 1024,
      height: 768,
      background: 'black' })

asteroids = []
15.times do
  position = Vector2D.new(rand(Window.width), rand(Window.height))
  asteroids.push(Asteroid.new(position))
end

show
