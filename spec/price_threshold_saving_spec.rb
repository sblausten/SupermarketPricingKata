
describe PriceThresholdSaving do
  describe 'calculate_saving' do
    it 'returns correct saving for single item in basket when sutotal over 50' do
      offer = double('Offer', threshold: 50, saving: 0.1).extend(PriceThresholdSaving)
      items = [double('Item', price: 70)]
      expect(offer.calculate_saving(items)).to eq(-7)
    end
    it 'returns correct saving for multiple items in basket when sutotal over 50' do
      offer = double('Offer', threshold: 50, saving: 0.2).extend(PriceThresholdSaving)
      items = [double('Item', price: 40), double('Item', price: 40)]
      expect(offer.calculate_saving(items)).to eq(-16)
    end
    it 'returns no saving for multiple items in basket when not >= threshold' do
      offer = double('Offer', threshold: 50, saving: 0.2).extend(PriceThresholdSaving)
      items = [double('Item', price: 20), double('Item', price: 20)]
      expect(offer.calculate_saving(items)).to eq(0)
    end
    it 'returns saving for multiple items in basket when they exactly meet threshold' do
      offer = double('Offer', threshold: 50, saving: 0.2).extend(PriceThresholdSaving)
      items = [double('Item', price: 20), double('Item', price: 30)]
      expect(offer.calculate_saving(items)).to eq(-10)
    end
  end
end
