require_relative 'menu'

class Order

  attr_reader :menu, :basket

  def initialize
    @menu = Menu.new
    @basket = {}
  end

  def add_item(item, amount)
    update_basket(item, amount)  
  end

  def remove_item(item, amount)
    if @basket.has_key?(item)
      process_item_removal(item, amount)
    end
  end

  private
  
  def update_basket(item, amount)
    if @basket.has_key?(item)
      @basket[item] += amount
    else
      @basket[item] = amount
    end
  end

  def process_item_removal(item, amount)
    @basket[item] <= amount ? @basket.delete(item) : @basket[item] -= amount
  end

end