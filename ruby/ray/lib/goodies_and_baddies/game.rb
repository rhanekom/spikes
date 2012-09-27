
require "rubygems"

# The part that activates bundler in your app:
require "bundler/setup"


# require your gems as usual
require "ray"

# Step 1: Render Ray's "Hello World" example
# Step 2: Render a red 20x20 square to the screen
# Step 3: Get the red square to follow the mouse pointer
# Step 4: Move the square to the left using the left arrow
# Step 5: Allow all arrow keys to move the square
# Step 6: Make the square move a bit faster
# Step 7: Display 20 randomly placed 10x10 white squares
# Step 8: Keep the red square from leaving the screen
# Step 9: Remove white squares when they get covered up
# Step 10: Display "You win" when all white squares are gone.
# Step 11: Add five randomly placed 15x15 blue squares
# Step 12: Display "You Lose" on collision with a blue square
# Step 13: Make the blue squares follow the red square


Ray.game "Goodies and baddies" do
  register { add_hook :quit, method(:exit!) }

  scene :hello do
    PLAYER_SIZE = 20
    GOODIE_SIZE = 10
    BADDIE_SIZE = 15

    @player = Ray::Polygon.rectangle([0, 0, PLAYER_SIZE, PLAYER_SIZE], Ray::Color.red)
    @player.pos = [200, 200]

    max_x = window.size.width - 40
    max_y = window.size.width - 40

    @goodies = 20.times.map do
      x = (rand(max_x) - GOODIE_SIZE * 2) + GOODIE_SIZE
      y = (rand(max_y) - GOODIE_SIZE * 2) + GOODIE_SIZE

      g = Ray::Polygon.rectangle([0, 0, GOODIE_SIZE, GOODIE_SIZE], Ray::Color.white)
      g.pos = [x, y]
      g
    end

    @baddies = 5.times.map do
      x = (rand(max_x) - BADDIE_SIZE * 2) + BADDIE_SIZE
      y = (rand(max_y) - BADDIE_SIZE * 2) + BADDIE_SIZE
      g = Ray::Polygon.rectangle([0,0,BADDIE_SIZE,BADDIE_SIZE], Ray::Color.blue)
      g.pos += [x,y]
      g
    end

    always do
      if @player.pos.x > 0
        @player.pos += [-2, 0] if holding?(:left)
      end

      if @player.pos.x + PLAYER_SIZE < window.size.width
        @player.pos += [2, 0] if holding?(:right)
      end

      if @player.pos.y > 0
        @player.pos += [0, -2] if holding?(:up)
      end

      if @player.pos.y + PLAYER_SIZE < window.size.height
        @player.pos += [0, 2] if holding?(:down)
      end

      @goodies.reject! do |e|
        [e.pos.x, e.pos.y, GOODIE_SIZE, GOODIE_SIZE].to_rect.inside?([@player.pos.x, @player.pos.y, PLAYER_SIZE, PLAYER_SIZE])
      end

      @you_lose = @baddies.any? do |e|
        [e.pos.x, e.pos.y, BADDIE_SIZE, BADDIE_SIZE].to_rect.collide?([@player.pos.x, @player.pos.y, PLAYER_SIZE, PLAYER_SIZE])
      end

      @baddies.each do |e|
      if e.pos.x < @player.pos.x
        e.pos += [rand*2.5,0]
      else
        e.pos -= [rand*2.5,0]
      end

      if e.pos.y < @player.pos.y
        e.pos += [0, rand*2.5]
      else
        e.pos -= [0, rand*2.5]
      end
    end
    end

    render do |win|
      # win.draw text(@goodies.length.to_s, :at => [100,100], :size => 60)

      if @you_lose
        win.draw text("YOU LOSE", :at => [100,100], :size => 60)
      elsif @goodies.empty?
        win.draw text("YOU WIN", :at => [100,100], :size => 60)
      else
        @goodies.each { |g| win.draw g}
        @baddies.each { |g| win.draw g}
        win.draw @player
      end
    end
  end

  scenes << :hello
end

