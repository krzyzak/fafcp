module Fafcp
  class Picker
    attr_writer :colours
    def initialize(number_of_colours_to_pick, colours = {})
      @number_of_colours_to_pick = number_of_colours_to_pick
      @colours = colours#.map{|colour| Colour.from_hex(colour)}
    end

    def pick
      palette = {}
      @colours.combination(@number_of_colours_to_pick).each do |colours|
        diff = 0
        colours.combination(2).each do |first, second|
          diff += difference(first, second)
        end
        palette.merge!({diff => colours})
      end
      palette.max_by{|key, value| key.to_s.to_i}[1]
    end

    def difference(first, second)
      mean_r = (first.red - second.red) / 2
      delta_r = first.red - second.red
      delta_g = first.green - second.green
      delta_b = first.blue - second.blue

      diff = (2 + mean_r/256) * delta_r**2 + 4 * delta_g**2 + (2 + (255 - mean_r)/256) * delta_b**2
      Math.sqrt(diff)
    end
  end
end