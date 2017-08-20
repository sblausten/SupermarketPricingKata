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
    saving = 0
    @offers.each do |offer|
      offer_count = count_offers_applicable(offer)
      saving += offer_count* offer.saving
    end
    saving
  end

  def count_items_eligable(offer)
    matching_item_count = 0
    @items.each do |item|
      matching_item_count += 1 if item_eligable?(item: item, offer: offer)
    end
    matching_item_count
  end

  def item_eligable?(args)
    args[:offer].item_name == args[:item].name
  end

  def count_offers_applicable(offer)
    offers_applicable = 0
    eligable_items = count_items_eligable(offer)
    unless eligable_items.zero?
      offers_applicable = eligable_items / offer.quantity
    end
    offers_applicable
  end
end
