# frozen_string_literal: true

def stock_picker(prices)
  min_price = prices[0]
  max_profit = 0
  temp_buy_day = 0
  buy_day = 0
  sell_day = 0

  prices.each_with_index do |value, idx|
    if value < min_price
      min_price = value
      temp_buy_day = idx
    end

    next unless value - min_price > max_profit

    max_profit = value - min_price
    sell_day = idx
    buy_day = temp_buy_day
  end

  [buy_day, sell_day]
end

puts stock_picker([17, 3, 6, 9, 15, 8, 6, 1, 10])
# puts stock_picker([17,3,6,9,15,8,6,1,10,20])
