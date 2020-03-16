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
    process_item_removal(item, amount) if @basket.has_key?(item)
  end

  def show_order
    total = get_order_total()
    "Your order\n" + @basket.map { |item, amount| "#{item}: #{amount}"}.join("\n") + "\nTotal: £#{total}"
  end

  private

  def get_order_total()
    total = 0
    @basket.map do |item, amount|
      total += Menu::MENU[item] * amount 
    end
    total
  end

  def update_basket(item, amount)
    return if Menu::MENU[item].nil?

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
