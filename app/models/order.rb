class Order < ActiveRecord::Base

  has_many :line_items, dependent: :destroy
  has_one :payment_type

  validates :name, :email, :address, presence: true
  validates :pay_type_id, presence: true

  after_update :send_ship_email, :if => :ship_date_changed? || :no_ship_date

  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
  end

  def no_ship_date
    self.ship_date.nil?
  end

  def send_ship_email
    OrderNotifier.shipped(self).deliver_now
  end
end
