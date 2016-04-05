class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end
  
  def legendary?
    self.name == "Sulfuras, Hand of Ragnaros"
  end
  
  def ticket?
   name == "Backstage passes to a TAFKAL80ETC concert"
  end
  
  def aged_brie?
    name == "Aged Brie"
  end
end