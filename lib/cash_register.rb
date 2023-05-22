class CashRegister
    attr_reader :total, :discount, :items, :last_transaction
  
    def initialize(discount = 0)
      @total = 0
      @discount = discount
      @items = []
      @last_transaction = {}
    end
  
    def add_item(title, price, quantity = 1)
      self.total += price * quantity
      quantity.times { items << title }
      self.last_transaction = { title: title, price: price, quantity: quantity }
    end
  
    def apply_discount
      if discount > 0
        self.total -= (total * (discount / 100.0)).to_i
        "After the discount, the total comes to $#{total}."
      else
        "There is no discount to apply."
      end
    end
  
    def void_last_transaction
      return unless last_transaction
  
      last_item_price = last_transaction[:price] * last_transaction[:quantity]
      self.total -= last_item_price
      items.delete(last_transaction[:title])
      self.last_transaction = nil if items.empty?
    end
  
   
  
    attr_writer :total, :last_transaction
  end
  