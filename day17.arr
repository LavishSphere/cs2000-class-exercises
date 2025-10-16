use context dcic2024

var score = 10

fun bonus-points(amt :: Number) -> Number block:
  score := score + amt
  penalty-check()
where:
  bonus-points(2) is 13
  bonus-points(4) is 14
  bonus-points(1) is 15
end
fun penalty-check() -> Number block:
  when score > 15:
    score := score - 3
  end
  score
end

bonus-points(2)
bonus-points(4) 
bonus-points(1)