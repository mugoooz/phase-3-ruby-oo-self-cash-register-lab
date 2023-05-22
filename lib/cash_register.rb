class CashRegister
    attr_reader :total, :discount, :items

    def initialize(discount=0)
        @total = 0
        @discount = discount
        @items = []
    end

    def add_item(title, price, quantity = 1)
        self.total += price * quantity
        quantity.times { items << title }
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
        last_item_price = items_prices.pop
        self.total -= last_item_price
    end
    
    def total=(value)
        @total = value
    end

    def items_prices
        items.map { |item| item_prices[item] }
    end

    def items_prices
        {
            "apple" => 0.5,
            "banana" => 0.25,
            "orange" => 0.75
        }
    end

    

end
