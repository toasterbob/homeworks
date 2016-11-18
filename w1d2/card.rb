class Card
  attr_accessor :face_value, :up

  def initialize(face_value)
    @face_value = face_value
    @up = false
  end

  def hide
    self.up = false
  end

  def reveal
    self.up = true
  end

  def to_s
    if up
      @face_value.to_s
    else
      "*"
    end
  end

  def ==(second_card)
    self.to_s == second_card.to_s
  end

end
