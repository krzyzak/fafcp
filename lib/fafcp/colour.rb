module Fafcp
  class Colour
    def initialize(colour)
      @colour = colour
    end

    def self.from_hex(hex)
      new(hex[1, 6])
    end

    def self.from_int(num)
      new(num.to_i(16).to_s)
    end

    def to_s
      "##{@colour.to_s}"
    end

    def red
      @colour[0, 2].to_i(16)
    end

    def green
      @colour[2, 2].to_i(16)
    end

    def blue
      @colour[4, 2].to_i(16)
    end
  end
end