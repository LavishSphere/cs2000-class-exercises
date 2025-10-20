use context dcic2024
data PaymentMethod:
  | cash
  | credit(card-number :: String, expiry :: String)
  | checking(bank-account :: String, routing :: String, check-number :: Number)
end

data Vehicle:
  | bike
  | car(make :: String, year :: Number)
  | truck(make :: String, year :: Number, capacity :: Number)
end

data Grade:
  | letter(l :: String)
  | percent(p :: Number)
  | pass-fail(b :: Boolean)
end

data WeatherReport:
  | sunny(temperature :: Number)
  | rainy(temperature :: Number, precipitation-amount :: Number)
  | snowy(temperature :: Number, precipitation :: Number, wind-speed :: Number)
end

payment-1 = cash
payment-2 = credit("1111-2222-3333-4444", "09/26")
payment-3 = checking("987654321", "111", 55)

vehicle-1 = bike
vehicle-2 = car("Honda", 2024)
vehicle-3 = truck("Ford", 2020, 10000)

grade-1 = letter("B")
grade-2 = percent(72)
grade-3 = pass-fail(true)

fun display-payment(p :: PaymentMethod) -> String:
  cases (PaymentMethod) p:
    | cash => "Paid in cash"
    | credit(cn, exp) => "Paid by credit card expiring on " + exp
    | checking(acc, rout, num) => "Paid by check from account " + acc
  end
end

fun vehicle-age(v :: Vehicle, n :: Number) -> Number:
  cases (Vehicle) v:
    | car(m, y) => n - y
    | truck(m, y, c) => n - y
    | bike => 0
  end
where:
  vehicle-age(vehicle-1, 2025) is 0
  vehicle-age(vehicle-2, 2025) is 1
  vehicle-age(vehicle-3, 2025) is 5
end

fun grade-to-gpa(g :: Grade) -> Number:
  cases (Grade) g:
    | letter(s) =>
      if s == "A": 4 
      else if s == "B": 3 
      else if s == "C": 2 
      else if s == "D": 1 
      else: 0
      end
    | percent(n) =>
      if n >= 90: 4
      else if n >= 80: 3
      else if n >= 70: 2
      else if n >= 60: 1
      else: 0
      end
    | pass-fail(b) =>
      if b == true: 4
      else: 0
      end
  end
where:
  grade-to-gpa(grade-1) is 3
  grade-to-gpa(grade-2) is 2
  grade-to-gpa(grade-3) is 4
end

fun payment-summary(p :: PaymentMethod) -> String:
  cases (PaymentMethod) p:
    | cash => "Cash payment"
    | credit(c, e) => "Card ending in " + string-substring(c, 15, 19)
    | checking(a, r, n) => "Check #" + num-to-string(n)
  end
where:
  payment-summary(payment-1) is "Cash payment"
  payment-summary(payment-2) is "Card ending in 4444"
  payment-summary(payment-3) is "Check #55"
end

fun is-severe(w :: WeatherReport) -> Boolean:
  cases (WeatherReport) w:
    | sunny(t) => t > 95
    | rainy(t, p) => p > 2
    | snowy(t, p, ws) => ws > 30
  end
end