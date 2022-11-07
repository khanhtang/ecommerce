class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :product

  before_save :set_total_price
  after_create :change_product_quantity

  def unit_price
    if persisted?
      self[:price]
    else
      product.price
    end
  end

  def total_price
    unit_price * quantity
  end

  private

  def set_total_price
    self[:price] = total_price
  end

  def change_product_quantity
    product.update(residual: product.residual - quantity)
  end
end
