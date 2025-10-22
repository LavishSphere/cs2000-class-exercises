use context dcic2024
t = table: x-coord :: Number, y-coord :: Number
  row: 1, 2
  row: 3, 4
end
transform-column(t, "x-coord", lam(n :: Number) -> Number: n - 1 end)

prices = table: price :: Number
      row: 50
      row: 120
      row: 80
      row: 40
      row: 50
      row: 80
      row: 80
    end
freq-bar-chart(prices, "price")

fun calc-tax(tab :: Table) -> Table:
  doc: "Adds a 10.25% tax for Oakland to the prices"
  build-column(tab, "tax", lam(r :: Row) -> Number:
      r["price"] * 0.1025
    end)
end

items = table: item :: String
    row: "Sword of Dawn"         
    row: "Healing Potion"        
    row: "Dragon Shield"
    row: "Magic Staff"
    row: "Elixir of Strength"
    row: "Cloak of Invisibility"
    row: "Ring of Fire"
    row: "Boots of Swiftness"
    row: "Amulet of Protection"
    row: "Orb of Wisdom"
  end

fun obfuscate-table(tab :: Table) -> Table:
  doc: "obfuscates table with X replacing number of characters"
  transform-column(tab, "item", lam(s :: String) -> String:
  num = string-length(s)
  string-repeat("X", num)
  end )
where:
  test-table = table: item :: String
    row: "Phone"
    row: "PC"
    row: "TV"
    row: "Earbud"
    row: "Tablet"
  end
  obfuscate-table(test-table) is
  table: item
    row: "XXXXX"
    row: "XX"
    row: "XX"
    row: "XXXXXX"
    row: "XXXXXX"
  end
end