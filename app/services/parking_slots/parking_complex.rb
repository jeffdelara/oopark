module ParkingSlots
  
  class ParkingComplex 
    def initialize(width=16, height=12)
      @width = width
      @height = height
    end

    def generate(parking_slots)
      @grid = create_parking_grid(@height, @width)
      parking_area = populate_parking_slots(ParkingSlot.all)
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
