class Checkout
  def initialize(_offers)
    @subtotal = 0
  end

  def scan(item)
    update_subtotal(item.price)
  end

  def get_total
    subtotal
  end

  private

  attr_reader :subtotal

  def update_subtotal(itemPrice)
    @subtotal += itemPrice
  end
end
