require './src/offers/quantity_saving.rb'

class Offer
  include QuantitySaving
  attr_reader :name, :item_name, :quantity, :saving

  def initialize(hash)
    @name = hash.fetch(:name, 'Offer')
    @item_name = hash[:item_name]
    @quantity = hash[:quantity]
    @saving = hash[:saving]
  end
end