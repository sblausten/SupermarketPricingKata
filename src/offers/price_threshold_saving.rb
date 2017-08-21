# Reduces basket cost by 10% when basket subtotal is over £50
# before other offers applied

# Expects Offer applied to to respond to #threshold with num
# and #saving with negative num
module PriceThresholdSaving
  def calculate_saving(items)
    subtotal = sum_items(items)
    subtotal >= threshold ? -(subtotal * saving) : 0
  end

  private

  def sum_items(items)
    items.inject(0) { |sum, item| sum + item.price }
  end
end
