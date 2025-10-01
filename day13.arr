use context dcic2024
import math as M
import statistics as S
include csv

cafe-data =
  table: day :: String, drinks-sold :: Number
    row: "Mon", 45
    row: "Tue", 30
    row: "Wed", 55
    row: "Thu", 40
    row: "Fri", 60
  end

sales = cafe-data.get-column("drinks-sold")
M.max(sales)
S.mean(sales)
M.sum(sales)

sample-list = [list: 10, 20, 30]
empty-list = [list: ]

days = cafe-data.get-column("day")
M.min(days)

quiz-scores =
  table: student :: String, quiz1 :: Number, quiz2 :: Number, quiz3 :: Number
    row: "Alice", 85, 92, 78
    row: "Bob", 90, 88, 95
    row: "Charlie", 78, 85, 82
    row: "Diana", 95, 90, 88
  end

quiz1 = quiz-scores.get-column("quiz1")
quiz2 = quiz-scores.get-column("quiz2")
quiz3 = quiz-scores.get-column("quiz3")

S.mean(quiz1)
S.mean(quiz2)
S.mean(quiz3)

listA = [list: 12, 8, 15, 22, 5, 18]

minA = M.min(listA)
minA
maxA = M.max(listA)
maxA
M.sum(listA)

maxA - minA

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

NewBostonPD = transform-column(BostonPD, "Regular", string-to-number-unsafe)

RegularColumn = NewBostonPD.get-column("Regular")
.mean(RegularColumn)


