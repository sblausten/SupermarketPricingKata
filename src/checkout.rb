class Checkout
  def initialize(offers)
    @subtotal = 0
    @offers = offers
    @items = []
  end

  def scan(item)
    update_items(item)
    update_subtotal(item.price)
  end

  def get_total
    apply_offers
    subtotal.round(2)
  end

  private

  attr_reader :subtotal
  def update_items(item)
    @items << item
  end

  def update_subtotal(ammount)
    @subtotal += ammount
  end

  def apply_offers
    update_subtotal(calculate_saving)
  end

  def calculate_saving
    @offers.inject(0) { |sum, offer| sum + offer.calculate_saving(@items) }
  end
end
