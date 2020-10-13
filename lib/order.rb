require_relative 'menu'
require 'twilio-ruby'
require 'dotenv/load'

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

  def display_menu
    @menu.view_menu
  end

  def show_order
    total = order_total
    "Your order\n" + 
    @basket.map do |item, amount| 
      "#{item}: #{amount}"
    end
    .join("\n") + "\nTotal: £#{total}\n"
  end
  
  def place_order
    puts show_order + "Has now been placed; you will be texted with a delivery time."
    text_order
    'Enjoy!'
  end
  
  def delivery_time
    (Time.now + (60 * 35)).strftime("%H:%M") 
  end
  
  private

  def text_order

    client = Twilio::REST::Client.new(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN'])
  
    client.messages.create(
    from: ENV['TWILIO_NUMBER'],
    to: ENV['TWILIO_CUSTOMER'],
    body: "Your order has been placed! See you before #{delivery_time}" 
    )
  end
  
  def order_total
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
