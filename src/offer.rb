
class Offer
  attr_reader :name, :item, :quantity, :saving

  def initialize(hash)
    @name = hash[:name]
    @item = hash[:item]
    @quantity = hash[:quantity]
    @saving = hash[:saving]
  end
end
