require_relative 'menu'

class Order

  attr_reader :menu, :basket

  def initialize
    @menu = Menu.new
    @basket = {}
  end

  def add_item(item, amount)
    if @basket.has_key?(item)
      'no'
    else
      @basket[item] = amount
    end    
  end

end