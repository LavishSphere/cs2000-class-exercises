use context dcic2024
import lists as L

fun my-sum(num-list :: List<Number>) -> Number block:
  var total = 0
  for each(n from num-list):
    total := total + n
  end
  total
where:
  my-sum([list: 0, 1, 2, 3]) is 6
end

fun product(num-list :: List<Number>) -> Number block:
  var products = 1
  for each(n from num-list):
    products := products * n
  end
  products
where:
  product([list: 2, 3, 4]) is 24
  product([list: 2, 5, 7]) is 70
  product([list: 1, 3, 5]) is 15
end

fun sum-even-numbers(num-list :: List<Number>) -> Number block:
  var total = 0
  for each(n from num-list):
    when num-modulo(n, 2) == 0:
    total := total + n
    end
  end
  total
where:
  sum-even-numbers([list: 1, 2, 3]) is 2
  sum-even-numbers([list: 2, 3, 4]) is 6
  sum-even-numbers([list: 2, 4, 6]) is 12
end

fun my-length(l :: List) -> Number block:
  var len = 0
  for each(n from l):
    len := len + 1
  end
  len
where:
  my-length([list: "John", "Susan", "James"]) is 3
  my-length([list: 1, 2]) is 2
  my-length([list: 3, 4, 5, 6]) is 4
end

fun any-negative(list-num :: List<Number>) -> Boolean block:
  var negatives = false
  for each(n from list-num):
    when n < 0:
      negatives := true
    end
  end
    negatives
where:
  any-negative([list: 1, 2, 3]) is false
  any-negative([list: -2, -5, -8]) is true
  any-negative([list: 2, -4, 0]) is true
end

fun all-short-words(l :: List) -> Boolean block:
  var short-words = true
  for each(n from l):
    when string-length(n) > 4:
      short-words := false
    end
  end
  short-words
where:
  all-short-words([list: "john", "cathy", "Miller"]) is false
  all-short-words([list: "Jonathon", "Grace", "Will"]) is false
  all-short-words([list: "Mike", "John", "Will"]) is true
end

fun reverse-list(l :: List) -> List block:
  var items = [list:]
  for each(n from l):
    items := L.push(items, n)
  end
  items
where:
  reverse-list([list: "James", "Jay"]) is [list: "Jay", "James"]
  reverse-list([list: "Ellen", "Alvaro", "Russell"]) is [list: "Russell", "Alvaro", "Ellen"]
  reverse-list([list: "Konrad"]) is [list: "Konrad"]
end

fun concat-all(list-string :: List<String>) -> String block:
  var strings = ""
  for each(n from list-string):
    strings := strings + n
  end
  strings
where:
  concat-all([list: "John", "Miller"]) is "JohnMiller"
  concat-all([list: "Grace", "Baran", "Thomas"]) is "GraceBaranThomas"
  concat-all([list: "Will", "Grace", "James", "Josh"]) is "WillGraceJamesJosh"
end