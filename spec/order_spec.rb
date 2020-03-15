require 'order'

describe Order do
  describe '#add_item' do
    it 'adds an item to the order' do
      order = Order.new
      order.add_item('Margherita', 1)
      expect(order.basket).to eq({'Margherita' => 1})
    end
    it 'adds more than one of an item to the order' do
      order = Order.new
      order.add_item('Margherita', 2)
      expect(order.basket).to eq({'Margherita' => 2})
    end
    it 'adds an item to the order and updates the amounts' do
      order = Order.new
      order.add_item('Margherita', 1)
      order.add_item('Margherita', 1)
      expect(order.basket).to eq({'Margherita' => 2})
    end
  end
end