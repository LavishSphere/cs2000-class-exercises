use context dcic2024
include csv

items = table: item :: String, x-coordinate :: Number, y-coordinate :: Number
    row: "Sword of Dawn",           23,  -87
    row: "Healing Potion",         -45,   12
    row: "Dragon Shield",           78,  -56
    row: "Magic Staff",             -9,   64
    row: "Elixir of Strength",      51,  -33
    row: "Cloak of Invisibility",  -66,    5
    row: "Ring of Fire",            38,  -92
    row: "Boots of Swiftness",     -17,   49
    row: "Amulet of Protection",    82,  -74
    row: "Orb of Wisdom",          -29,  -21
  end

fun calc-distance(r :: Row) -> Number:
  doc: "Does distance to origin from fields 'x-coordinate' and 'y-coordinate'"
  num-sqrt(num-sqr(r["x-coordinate"]) + num-sqr(r["y-coordinate"]))
where:
  calc-distance(items.row-n(0)) is-roughly num-sqrt(num-sqr(23) + num-sqr(-87))
  calc-distance(items.row-n(3)) is-roughly num-sqrt(num-sqr(-9) + num-sqr(64))
end

items-with-dist = build-column(items, "distance", calc-distance)

fun subtract-1(n :: Number) -> Number:
  doc: "subtracts 1 from input"
  n - 1
where:
  subtract-1(10) is 9
  subtract-1(0) is -1
  subtract-1(-3.5) is -4.5
end

moved-items = transform-column(items, "x-coordinate", subtract-1)

fun scale-10(n :: Number) -> Number:
  doc: "takes 10% away from input"
  n * 0.9
where:
  scale-10(1000) is 900
  scale-10(0) is 0
  scale-10(-100) is -90
end
  
newtab1 = transform-column(items, "x-coordinate", scale-10)
newtab = transform-column(newtab1, "y-coordinate", scale-10)

items-with-exact-dist = transform-column(items-with-dist, "distance", num-to-rational)

items-sorted-by-exact-dist = order-by(items-with-exact-dist, "distance", true)

items-sorted-by-exact-dist.row-n(0)["item"]

fun obfuscate-string(s :: String) -> String:
  doc: "obfuscates strings with X replacing number of characters"
  num = string-length(s)
  string-repeat("X", num)
where:
  obfuscate-string("Sword of Dawn") is "XXXXXXXXXXXXX"
  obfuscate-string("Healing Potion") is "XXXXXXXXXXXXXX"
  obfuscate-string("Dragon Shield") is "XXXXXXXXXXXXX"
end

items-obfuscated = transform-column(items, "item", obfuscate-string)

BostonPD = load-table:
  Name :: String,
  Department_Name :: String,
  Title :: String,
  Regular :: Number,
  Retro :: Number,
  Other :: Number,
  Overtime :: Number,
  Injured :: Number,
  Detail :: Number,
  Quinn_Education :: Number,
  Total-Gross :: Number,
  Postal :: Number
  source: csv-table-url("https://data.boston.gov/dataset/418983dc-7cae-42bb-88e4-d56f5adcf869/resource/579a4be3-9ca7-4183-bc95-7d67ee715b6d/download/employee_earnings_report_2024.csv", default-options)
end

fun string-to-number-unsafe(s :: String) -> Number:
  doc: "Converts the given string to a number, returning 0 if not well formatted"
  string-to-number(string-replace(s, ",", "")).or-else(0)
where:
  string-to-number-unsafe("1234") is 1234
  string-to-number-unsafe("-1.3") is -1.3
  string-to-number-unsafe("hello") is 0
end