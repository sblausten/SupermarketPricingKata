describe 'Checkout' do
  before do
    Struct.new('Item', :name, :price)
    @beans = Struct::Item.new('beans', 0.7)
    @coke = Struct::Item.new('coke', 0.5)
    @offers = instance_double('Offer')
  end

  it 'calculates correct total from items scanned' do
    checkout = Checkout.new(@offers)
    checkout.scan(@coke)
    checkout.scan(@coke)
    checkout.scan(@beans)
    expect(checkout.get_total).to eq(1.7)
  end
  it 'calculates correct total from items scanned' do
    checkout = Checkout.new(@offers)
    checkout.scan(@coke)
    checkout.scan(@beans)
    expect(checkout.get_total).to eq(1.2)
  end
end
