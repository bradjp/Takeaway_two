class Menu

  MENU = { 'Margherita' => 9.99, 'Chips' => 1.99, 'Mozzarella sticks' => 3.99,
          'Hawaiian' => 11.99, 'Garlic bread' => 3.99 }

  def view_menu
    format_menu()
  end

  private

  def format_menu
    MENU.map { |dish, price| "#{dish}: £#{price}" }.join("\n")
  end

end
