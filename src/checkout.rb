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

  def update_subtotal(ammount)
    @subtotal += ammount
  end

  def apply_offers
    saving = 0
    @offers.each do |offer|
      matching_item_count = 0
      offers_applicable = 0
      @items.each do |item|
        matching_item_count += 1 if offer.item == item.name
      end
      unless matching_item_count.zero?
        offers_applicable = matching_item_count / offer.quantity
      end
      saving += offers_applicable * offer.saving
    end
    update_subtotal(saving)
  end

  def update_items(item)
    @items << item
  end
end
