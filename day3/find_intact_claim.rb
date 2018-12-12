require 'set'

class Fabric
    def initialize()
        @grid = {}
        @grid.default = Set.new
        @no_overlap_claims = Set.new
    end

    def add_claim(claim_number, top_right_x, top_right_y, width, height)
        if !overlaps(top_right_x, top_right_y, width, height)
            @no_overlap_claims.add(claim_number)
        end
        width.times do |i|
            height.times do |j|
                @grid[[(top_right_x + i), (top_right_y + j)]].each do |claims|
                    @no_overlap_claims.delete(claims)
                end
                @grid[[(top_right_x + i), (top_right_y + j)]].add(claim_number)
            end
        end
    end

    def overlaps(top_right_x, top_right_y, width, height)
        no_overlap = true
        width.times do |i|
            height.times do |j|
                if no_overlap && @grid[[(top_right_x + i), (top_right_y + j)]].size > 0
                    no_overlap = false
                end
            end
        end
        !no_overlap
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

    def get_no_overlap()
        @no_overlap_claims.inspect
    end
end

CLAIM_REGEX = /#(\d+) @ (\d+),(\d+): (\d+)x(\d+)/

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
puts "overlap = "
fabric.get_no_overlap

