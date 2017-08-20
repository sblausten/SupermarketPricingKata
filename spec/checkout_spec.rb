
describe 'Checkout' do
  before do
    offers = instance_double('Offer')
    @checkout = Checkout.new(offers)
    @item = double('Item', price: 0.5)
  end
  describe 'Scan' do
    it 'gets the price of the item' do
      expect(@item).to receive(:price)
      @checkout.scan(@item)
    end
    it 'calls update_items with the item' do
      expect(@checkout).to receive(:update_items).with(@item)
      @checkout.scan(@item)
    end
    it 'calls update_subtotal with the item price' do
      expect(@checkout).to receive(:update_subtotal).with(0.5)
      @checkout.scan(@item)
    end
  end
end
