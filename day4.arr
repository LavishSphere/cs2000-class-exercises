use context dcic2024
fun welcome(name :: String) -> String:
  doc: "Returns a greeting addressed to the given person"
  "Welcome to class, " + name
end

fun three-layer-cake(top :: String, middle :: String, bottom :: String) -> Image:
  doc: "Returns a three-layer cake that consists of three equally sized rectangular layers"
  l = 100
  width = 30
  rect1 = rectangle(l, width, "solid", top)
  rect2 = rectangle(l, width, "solid", middle)
  rect3 = rectangle(l, width, "solid", bottom)
  
  rectcomb1 = above(rect1, rect2)
  rectcomb = above(rectcomb1, rect3)
  rectcomb
end

fun tshirt-cost(shirts :: Number, message :: String) -> Number:
  doc: "Returns the cost of t-shirt(s) while also accounting for the message cost"
    costofshirt = shirts * 5
    costofmessage = string-length(message) *  0.1
    finalcost = costofshirt + costofmessage
    finalcost
where:
  tshirt-cost(5, "joe") is 25.3
  tshirt-cost(4, "Collins") is 20.7
end

fun sq(value :: Number) -> Number:
  doc: "Given a number returns the result of multiplying the number by itself"
  spy:
    newvar: value * value
  end
  value * value
where:
  sq(5) is 25
  sq(4) is 16
end
