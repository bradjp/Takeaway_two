require 'order'

describe Order do

  subject(:double) { described_class.new }

  describe '#add_item' do
    it 'adds an item to the order' do
      subject.add_item('Margherita', 1)
      expect(subject.basket).to eq({'Margherita' => 1})
    end
    it 'adds more than one of an item to the order' do
      subject.add_item('Margherita', 2)
      expect(subject.basket).to eq({'Margherita' => 2})
    end
    it 'adds an item to the order and updates the amounts' do
      2.times { subject.add_item('Margherita', 1) }
      expect(subject.basket).to eq({'Margherita' => 2})
    end
  end
  describe '#remove_item' do
    it 'removes items from the basket' do
      
    end
  end
end