
describe 'Checkout' do
  before do
    offers = instance_double('Offer')
    @checkout = Checkout.new(offers)
    @item = double('Item')
    allow(@item).to receive(:price).and_return(0.5)
  end
  describe 'Scan' do
    it 'gets the price of the item' do
      expect(@item).to receive(:price)
      @checkout.scan(@item)
    end
    it 'calls updateSubtotal with the item price' do
      expect(@checkout).to receive(:update_subtotal).with(0.5)
      @checkout.scan(@item)
    end
  end
end
