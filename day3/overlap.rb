
class Fabric
    def initialize()
        @grid = {}
        @grid.default = 0
    end

    def add_claim(top_right_x, top_right_y, width, height)
        width.times do |i|
            height.times do |j|
                @grid[[(top_right_x + i), (top_right_y + j)]] += 1
            end
        end
    end

    def get_overlap(layers = 0)
        count = 0
        @grid.each do |key, value|
            if value > layers
                count += 1
            end
        end
        count
    end
end

CLAIM_REGEX = /#\d+ @ (\d+),(\d+): (\d+)x(\d+)/

def parse_line(line)
    line.match(CLAIM_REGEX) do |groups|
        groups.captures.map(&:to_i)
    end
end

fabric = Fabric.new

File.open("input", "r") do |f|
    f.each_line do |line|
        args = parse_line(line)
        fabric.add_claim(*args)
    end
end
puts "overlap = #{fabric.get_overlap(1)}"

