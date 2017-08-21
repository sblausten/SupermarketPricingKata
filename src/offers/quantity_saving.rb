# Logic for any offers like 3 for 2 or anything where
# the quantity of items is the key

# Requires implementing class to have interface for
# saving [negative float], item_name [sym] and quantity [int]

module QuantitySaving
  def calculate_saving(items)
    offer_saving = 0
    offer_count = count_offers_applicable(items)
    offer_saving + offer_count * saving
  end

  private

  def count_offers_applicable(items)
    offers_applicable = 0
    eligable_items = count_items_eligable(items)
    offers_applicable = eligable_items / quantity unless eligable_items.zero?
    offers_applicable
  end

  def count_items_eligable(items)
    matching_item_count = 0
    items.each do |item|
      matching_item_count += 1 if item_eligable?(item)
    end
    matching_item_count
  end

  def item_eligable?(item)
    item_name == item.name
  end
end
