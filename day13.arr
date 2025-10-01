use context dcic2024
import math as M
import statistics as S

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