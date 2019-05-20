
class CashRegister
  attr_accessor :total, :discount, :last_transaction

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
  end

  def add_item(item, price, quantity = 1)
    item_desc = {}
    item_desc[:name] = item
    item_desc[:price] = price
    item_desc[:quantity] = quantity

    @items << item_desc

    @total += price * quantity
    @last_transaction = @total # set a value to last_transaction from total for void_last_transaction setup
  end

  def apply_discount
    if @discount == 0
      return "There is no discount to apply."
    end
    @total -= @total * @discount / 100
    return "After the discount, the total comes to $#{@total}."
  end

  def items
    item_lists = []
    @items.each do |item_desc|
      for q in 1..item_desc[:quantity]
        item_lists << item_desc[:name]
      end
    end
    item_lists
  end

  def void_last_transaction
    @total -= @last_transaction # decrease one item of the total item transaction
  end

end
