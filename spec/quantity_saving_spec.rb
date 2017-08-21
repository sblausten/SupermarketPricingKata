describe QuantitySaving do
  describe 'calculate_saving' do
    it 'returns saving applicable to items when extending Offer' do
      args = { name: '3 for 2', item_name: :coke, quantity: 3, saving: -0.5 }
      offer = Offer.new(args).extend(QuantitySaving)
      coke = double('Item', name: :coke)
      items = [coke, coke, coke, coke]
      expect(offer.calculate_saving(items)).to eq(-0.5)
    end
    it 'returns total saving applicable to items when extending Offer' do
      args = { name: '3 for 2', item_name: :coke, quantity: 3, saving: -0.5 }
      offer = Offer.new(args).extend(QuantitySaving)
      coke = double('Item', name: :coke)
      items = []
      10.times { items << coke }
      expect(offer.calculate_saving(items)).to eq(-1.5)
    end
  end
end
