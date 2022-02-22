module ParkingSlots
  
  class ParkingComplex 

    attr_reader :grid

    def initialize(width=16, height=12)
      @width = width
      @height = height
    end

    def generate(parking_slots)
      @grid = create_parking_grid(@height, @width)
      populate_parking_slots(parking_slots)
    end
    
    def create_parking_grid(height, width)
      Array.new(height) { Array.new(width) }
    end

    def populate_parking_slots(parking_slots)
      parking_slots.each do |slot|
        @grid[slot.y][slot.x] = slot
      end

      @grid
    end
  end

end
