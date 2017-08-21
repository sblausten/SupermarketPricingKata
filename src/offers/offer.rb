require './src/offers/quantity_saving.rb'

class Offer
  attr_reader :name, :item_name, :quantity, :threshold, :saving

  def initialize(hash)
    @name = hash.fetch(:name, 'Offer')
    @item_name = hash[:item_name]
    @quantity = hash[:quantity]
    @threshold = hash[:threshold]
    @saving = hash[:saving]
  end
end
