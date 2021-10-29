# frozen_string_literal: true

# Required Gems
require 'ruby2d'
require 'vector2d'

# Require internal files
require_relative 'lib/line_vector'
require_relative 'lib/triangle_vector'
require_relative 'lib/asteroid'
require_relative 'lib/player'

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
7.times do
  asteroids.push(
    Asteroid.new
  )
end

# Setting up player
player = Player.new

# Events
on :key_held do |event|
  case event.key
  when 'left', 'a'
    player.turn(:left)
  when 'right', 'd'
    player.turn(:right)
  when 'up', 'w'
    player.accelerate
  end
end

on :key_down do |event|
  case event.key
  when 'escape'
    Window.close
  end
end

# Game Loop
update do
  asteroids.map(&:update)
  player.update
end

show
