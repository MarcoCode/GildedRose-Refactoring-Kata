class ItemChecker
  def legendary?(item)
    item.name == "Sulfuras, Hand of Ragnaros"
  end
  
  def ticket?(item)
    item.name == "Backstage passes to a TAFKAL80ETC concert"
  end
  
  def aged_brie?(item)
    item.name == "Aged Brie"
  end
end