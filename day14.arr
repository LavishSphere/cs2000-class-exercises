use context dcic2024
import lists as L
include csv

discount-codes = [list: "NEWYEAR", "student", "NONE", "student", "VIP", "none"]

unique-codes = L.distinct(discount-codes)

fun is-real-code(code :: String) -> Boolean:
  not(string-to-lower(code) == "none")
end

real-codes = L.filter(is-real-code, unique-codes)

first-code = real-codes.get(0)

lower-codes = L.map(string-to-lower, real-codes)

upper-codes = L.map(string-to-upper, real-codes)

responses = [list: "yes", "NO", "maybe", "Yes", "no", "Maybe"]

lower-responses = L.map(string-to-lower, responses)

unique-responses = L.distinct(lower-responses)

definite-responses = L.filter(lam(s :: String) -> Boolean: not(s == "maybe")  end, unique-responses)

products =
table: name :: String, price :: Number
  row: "laptop", 999.99
  row: "mouse", 25.50
  row: "keyboard", 75.00
  row: "monitor", 299.99
end

price = products.get-column("price")

prices-under-100 = L.filter(lam(n :: Number) -> Boolean: n < 100 end, price)

discounted-prices = L.map(lam(n :: Number) -> Number: n * 0.9  end, prices-under-100)

fruits = [list: "apple", "banana", "cherry", "date", "elderberry"]

fruit-3 = fruits.get(2)

L.filter()
