# frozen_string_literal: true

# Required Gems
require 'ruby2d'
require 'vector2d'

# Require internal files
require_relative 'lib/asteroid'
require_relative 'lib/line_vector'

# Constants for the game
MAX_VELOCITY = 5.0
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

5.times do
  asteroids.push(Asteroid.new)
end

update do
  asteroids.map(&:update)
end

show
