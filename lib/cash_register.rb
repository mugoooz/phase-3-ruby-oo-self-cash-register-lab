class CashRegister
    attr_reader :total, :discount, :items

    def initialize(discount=0)
        @total = 0
        @discount = discount
        @items = []
    end

end
