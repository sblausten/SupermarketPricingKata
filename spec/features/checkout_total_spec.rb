describe 'Checkout' do
  before do
    @beans = double('Item', name: :beans, price: 0.7)
    @coke = double('Item', name: :coke, price: 0.5)
    @offers = []
  end
  describe 'Total with no offer' do
    it 'calculates correct total from three items scanned' do
      checkout = Checkout.new(@offers)
      2.times { checkout.scan(@coke) }
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
      @offers << Offer.new(offer_attributes).extend(QuantitySaving)
      checkout = Checkout.new(@offers)
      3.times { checkout.scan(@coke) }
      checkout.scan(@beans)
      expect(checkout.get_total).to eq(1.7)
    end
  end
  describe 'Total with multiple offers' do
    it 'calculates correct total using 3 for 2 offer' do
      offer_attributes_1 = { name: '3 for 2', item_name: :coke, quantity: 3, saving: -0.5 }
      offer_attributes_2 = { name: '2 for 1', item_name: :beans, quantity: 2, saving: -0.7 }
      @offers << Offer.new(offer_attributes_1).extend(QuantitySaving) << Offer.new(offer_attributes_2).extend(QuantitySaving)
      checkout = Checkout.new(@offers)
      3.times { checkout.scan(@coke) }
      3.times { checkout.scan(@beans) }
      expect(checkout.get_total).to eq(2.4)
    end
  end
  describe 'Total with multiple offers but none applicable' do
    it 'calculates correct total using 3 for 2 offer' do
      offer_attributes_1 = { name: '3 for 2', item_name: :coke, quantity: 3, saving: -0.5 }
      offer_attributes_2 = { name: '2 for 1', item_name: :beans, quantity: 2, saving: -0.7 }
      @offers << Offer.new(offer_attributes_1).extend(QuantitySaving) << Offer.new(offer_attributes_2).extend(QuantitySaving)
      checkout = Checkout.new(@offers)
      2.times { checkout.scan(@coke) }
      checkout.scan(@beans)
      expect(checkout.get_total).to eq(1.7)
    end
  end
  describe 'Total with empty basket' do
    it 'calculates correct total with offers available' do
      offer_attributes_1 = { name: '3 for 2', item_name: :coke, quantity: 3, saving: -0.5 }
      offer_attributes_2 = { name: '2 for 1', item_name: :beans, quantity: 2, saving: -0.7 }
      @offers << Offer.new(offer_attributes_1).extend(QuantitySaving) << Offer.new(offer_attributes_2).extend(QuantitySaving)
      checkout = Checkout.new(@offers)
      expect(checkout.get_total).to eq(0)
    end
    it 'calculates correct total with no offers available' do
      checkout = Checkout.new(@offers)
      expect(checkout.get_total).to eq(0)
    end
  end
end
