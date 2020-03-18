require 'order'
require 'timecop'

describe Order do

  subject(:double) { described_class.new }

  describe '#add_item' do
    it 'adds an item to the order' do
      subject.add_item('Margherita', 1)
      expect(subject.basket).to eq({ 'Margherita' => 1 })
    end
    it 'adds more than one of an item to the order' do
      subject.add_item('Margherita', 2)
      expect(subject.basket).to eq({ 'Margherita' => 2 })
    end
    it 'adds an item to the order and updates the amounts' do
      2.times { subject.add_item('Margherita', 1) }
      expect(subject.basket).to eq({ 'Margherita' => 2 })
    end
    it 'will not add an item that is not on the menu' do
      subject.add_item('Frittata', 1)
      expect(subject.basket).not_to include({ 'Frittata' => 1 })
    end
  end
  describe '#remove_item' do
    it 'removes items from the basket' do
      subject.add_item('Margherita', 2)
      subject.remove_item('Margherita', 1)
      expect(subject.basket).to eq({ 'Margherita' => 1 })
    end
    it 'removes items from the basket entirely if amount is zero' do
      subject.add_item('Margherita', 1)
      subject.remove_item('Margherita', 1)
      expect(subject.basket).not_to include({ 'Margherita' => 0 })
    end
  end
  describe '#show_order' do
    it 'Displays the current order and total' do
      subject.add_item('Margherita', 1)
      subject.add_item('Chips', 1)
      subject.add_item('Mozzarella sticks', 2)
      expect(subject.show_order()).to eq("Your order\nMargherita: 1\nChips: 1\nMozzarella sticks: 2\nTotal: £19.96\n")
    end
  end
  describe '#delivery_time' do
    it 'returns a time 35 minutes in the future' do
      future_time = (Time.now + (60 * 35)).strftime('%H:%M')
      expect(subject.delivery_time).to eq(future_time)
    end
  end  
end
