require 'menu'

describe Menu do  
  it 'displays a menu' do
    expect(Menu::MENU['Margherita']).to eq(9.99)
  end
end

describe 'view_menu' do
  it 'displays a menu' do
    menu = Menu.new
    expect(menu.view_menu()).to include('Margherita: £9.99')
  end
end