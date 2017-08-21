describe 'Checkout' do
  before do
    Struct.new('Item', :name, :price)
    @beans = Struct::Item.new(:beans, 0.7)
    @coke = Struct::Item.new(:coke, 0.5)
    @offers = []
  end
  describe 'Total with no offer' do
    it 'calculates correct total from three items scanned' do
      checkout = Checkout.new(@offers)
      checkout.scan(@coke)
      checkout.scan(@coke)
      checkout.scan(@beans)
      expect(checkout.get_total).to eq(1.7)
    end
    it 'calculates correct total from two items scanned' do
      checkout = Checkout.new(@offers)
      checkout.scan(@coke)
      checkout.scan(@beans)
      expect(checkout.get_total).to eq(1.2)
    end
  end
  describe 'Total with offer' do
    it 'calculates correct total using 3 for 2 offer' do
      offer_attributes = { name: '3 for 2', item_name: :coke, quantity: 3, saving: -0.5 }
      @offers << Offer.new(offer_attributes)
      checkout = Checkout.new(@offers)
      checkout.scan(@coke)
      checkout.scan(@coke)
      checkout.scan(@beans)
      checkout.scan(@coke)
      expect(checkout.get_total).to eq(1.7)
    end
  end
  describe 'Total with multiple offers' do
    it 'calculates correct total using 3 for 2 offer' do
      offer_attributes_1 = { name: '3 for 2', item_name: :coke, quantity: 3, saving: -0.5 }
      offer_attributes_2 = { name: '2 for 1', item_name: :beans, quantity: 2, saving: -0.7 }
      @offers << Offer.new(offer_attributes_1) << Offer.new(offer_attributes_2)
      checkout = Checkout.new(@offers)
      checkout.scan(@coke)
      checkout.scan(@coke)
      checkout.scan(@beans)
      checkout.scan(@coke)
      checkout.scan(@beans)
      checkout.scan(@beans)
      expect(checkout.get_total).to eq(2.4)
    end
  end
  describe 'Total with multiple offers but none applicable' do
    it 'calculates correct total using 3 for 2 offer' do
      offer_attributes_1 = { name: '3 for 2', item_name: :coke, quantity: 3, saving: -0.5 }
      offer_attributes_2 = { name: '2 for 1', item_name: :beans, quantity: 2, saving: -0.7 }
      @offers << Offer.new(offer_attributes_1) << Offer.new(offer_attributes_2)
      checkout = Checkout.new(@offers)
      checkout.scan(@coke)
      checkout.scan(@coke)
      checkout.scan(@beans)
      expect(checkout.get_total).to eq(1.7)
    end
  end
end
