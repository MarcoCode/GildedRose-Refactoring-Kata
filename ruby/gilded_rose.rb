require_relative "item.rb"
class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      if !item.aged_brie? && !item.ticket?
        lower_quality(item)
      else
        if item.quality < 50
          item.quality += 1
          if item.ticket?
            check_sell_in(item)
          end
        end
      end
      unless item.legendary?
        item.sell_in -= 1
      end
      if item.sell_in < 0
        if !item.aged_brie?
          if !item.ticket?
            lower_quality(item)
          else
            item.quality = 0
          end
        else
           increase_quality(item)
        end
      end
    end
  end
  
  private
  def lower_quality(item)
    item.quality -= 1 if (!item.legendary? && item.quality > 0)
  end
  
  def increase_quality(item)
    item.quality += 1 if item.quality < 50
  end
  
  def check_sell_in(item)
    increase_quality(item) if item.sell_in < 11
    increase_quality(item)if item.sell_in < 6
  end
end