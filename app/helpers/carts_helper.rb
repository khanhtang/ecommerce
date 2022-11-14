module CartsHelper
  def current_cart
    session[:cart] ||= Array.new
    session[:cart] = session[:cart].map(&:symbolize_keys)
    return session[:cart]
  end
    
  def find_product_in_cart product
    
    current_cart.find do |item|
      item[:product_id] == product.id
    end
  end

  def get_line_items_in_cart
    cart_items = []
    current_cart.each do |item|
      product = Product.find_by(id: item[:product_id])
      if product
        cart_items << {product: product, quantity: item[:quantity]}
      else
        current_cart.delete(item)
      end
    end
    cart_items
  end

  def line_total_price item
    item[:product].price * item[:quantity]
  end

  def line_total_price_1 item
    product = Product.find_by(id: item[:product_id])
    product.price * item[:quantity]
  end

  def total_of_money
    items = get_line_items_in_cart
    items.reduce(0){|a, e| a + e[:product].price * e[:quantity]}
  end
end
