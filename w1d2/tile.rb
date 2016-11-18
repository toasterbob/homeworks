class Tile

  attr_accessor :value
  attr_reader :given

  def initialize(value)
    @value = value
    if value > 0
      @given = true
    else
      @given = false
    end
  end

  

end
