describe GildedRose do

  describe "#update_quality" do
    before do
      @items = [Item.new("foo", 1, 3),
                Item.new("Aged Brie", 1, 0),
                Item.new("Sulfuras, Hand of Ragnaros", 0, 80), 
                Item.new("Backstage passes to a TAFKAL80ETC concert", 11, 0)]
      GildedRose.new(@items).update_quality()
    end
    it "does not change the name" do
      expect(@items[0].name).to eq "foo"
    end
    
    it "does degrade the item quality by 1" do
      expect(@items[0].quality).to eq 2
    end
    
    it "does degrade the item sell in date by 1" do
      expect(@items[0].sell_in).to eq 0
    end
    
    it "Can have a negative sell in date" do
       GildedRose.new(@items).update_quality()
       expect(@items[0].sell_in).to eq -1
    end
    
    it "Items cannot have negative quality" do
       2.times do 
         GildedRose.new(@items).update_quality()
       end
       expect(@items[0].quality).to eq 0
    end
    
    it "Degrades quality by 2 after sell in date" do
      GildedRose.new(@items).update_quality()
      expect(@items[0].quality).to eq 0
    end
    
    it "Increases quality the for Aged Brie Item" do
      expect(@items[1].quality).to eq 1
    end
    
    it "Increases quality the for Aged Brie Item by 2 after sell in date" do
      GildedRose.new(@items).update_quality()
      expect(@items[1].quality).to eq 3
    end
    
    it "Does not increase the quality of an item above 50" do
      100.times do
        GildedRose.new(@items).update_quality()
      end
      expect(@items[1].quality).to eq 50
    end
    
    it "Does not changes the properties of the Legendary Item" do
      expect(@items[2].quality).to eq 80
      expect(@items[2].sell_in).to eq 0
    end
    
    it "Increses quality of Backstage pass by 1 as sell in date is greater than 10" do
      expect(@items[3].sell_in).to eq 10
      expect(@items[3].quality).to eq 1
    end
    
    it "Increses quality of Backstage pass by 2 as sell in date is between 10 and 6" do
      GildedRose.new(@items).update_quality()
      expect(@items[3].sell_in).to eq 9
      expect(@items[3].quality).to eq 3
      GildedRose.new(@items).update_quality()
      expect(@items[3].sell_in).to eq 8
      expect(@items[3].quality).to eq 5
      2.times do
        GildedRose.new(@items).update_quality()
      end
      expect(@items[3].sell_in).to eq 6
      expect(@items[3].quality).to eq 9
    end
    
    it "Increses quality of Backstage pass by 3 as sell in date is between 5 and 1" do
      5.times do
        GildedRose.new(@items).update_quality()
      end
      expect(@items[3].sell_in).to eq 5
      expect(@items[3].quality).to eq 11
      GildedRose.new(@items).update_quality()
      expect(@items[3].quality).to eq 14
    end
    
    it "Sets quality of Backstage pass to 0 when sell in date is negative" do
      11.times do
        GildedRose.new(@items).update_quality()
      end
      expect(@items[3].sell_in).to eq -1
      expect(@items[3].quality).to eq 0
    end
  end
end
