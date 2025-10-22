use context dcic2024
include csv

orders = table: time :: String, amount :: Number
  row: "08:00", 10.50
  row: "09:30", 5.75
  row: "10:15", 8.00
  row: "11:00", 3.95
  row: "14:00", 4.95
  row: "16:45", 7.95
end

high-value-orders = table: time :: String, amount :: Number
  row: "08:00", 10.50
  row: "10:15", 8.00
end

fun is-high-value(r :: Row) -> Boolean:
  doc: "Returns whether the amount column is >= 5"
  r["amount"] >= 5.0
where:
  is-high-value(orders.row-n(2)) is true
  is-high-value(orders.row-n(3)) is false
end

new-high-orders = filter-with(orders, is-high-value)

fun is-morning(r :: Row) -> Boolean:
  r["time"] < "12:00"
where:
  is-morning(orders.row-n(0)) is true
  is-morning(orders.row-n(4)) is false
end

orders-time-filtered = order-by(orders, "time", false)

morning-orders = filter-with(orders-time-filtered, is-morning)

morning-orders.row-n(0)["amount"]

photos = load-table:
  Location :: String,
  Subject :: String,
  Date :: String
  source: csv-table-url("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/support/7-photos.csv", default-options)
end

fun is-forest(r :: Row) -> Boolean:
  r["Subject"] == "Forest"
where:
  is-forest(photos.row-n(12)) is true
  is-forest(photos.row-n(0)) is false
end

forest-photos = filter-with(photos, is-forest)

forest-photos-time-filtered = order-by(forest-photos, "Date", false)

forest-photos-time-filtered.row-n(0)["Location"]