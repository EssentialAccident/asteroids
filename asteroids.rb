# frozen_string_literal: true

# Required Gems
require 'ruby2d'
require 'vector2d'

# Require internal files
require_relative 'lib/asteroid'
require_relative 'lib/line_vector'

# Constants for the game
MAX_VELOCITY = 7.0
WINDOW_WIDTH = 1024
WINDOW_HEIGHT = 768

# Setting up the window
set({ title: 'Asteroids',
      width: WINDOW_WIDTH,
      height: WINDOW_HEIGHT,
      background: 'black' })

# Setting up the game

# Setting up asteroids
asteroids = []
15.times do
  position = Vector2D.new(rand(Window.width), rand(Window.height))
  asteroids.push(Asteroid.new(position))
end

update do
  asteroids.map(&:update)
end

show
