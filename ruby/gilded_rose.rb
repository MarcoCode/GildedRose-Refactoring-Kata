require_relative "item.rb"
require_relative "item_checker.rb"

class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      if !ItemChecker.new.aged_brie?(item) && !ItemChecker.new.ticket?(item)
        lower_quality(item)
      else
        check_quality(item)
        check_sell_in(item) if ItemChecker.new.ticket?(item)
      end
      item.sell_in -= 1 unless ItemChecker.new.legendary?(item)
      gets_better_with_time(item) if item.sell_in < 0
    end
  end
  
  private
  def check_quality(item)
    item.quality += 1 if item.quality < 50
  end
  def lower_quality(item)
    item.quality -= 1 if (!ItemChecker.new.legendary?(item) && item.quality > 0)
  end
  def increase_quality(item)
   check_quality(item)
  end
  def check_sell_in(item)
    increase_quality(item) if item.sell_in < 11
    increase_quality(item) if item.sell_in < 6
  end
  def check_if_ticket(item)
    !ItemChecker.new.ticket?(item) ? lower_quality(item) : item.quality = 0
  end
  def gets_better_with_time(item)
    !ItemChecker.new.aged_brie?(item) ? check_if_ticket(item) : increase_quality(item)
  end
end