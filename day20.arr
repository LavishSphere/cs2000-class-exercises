use context dcic2024

fun list-length(l :: List) -> Number:
  doc: "Finds length of the list"
  cases (List) l:
    | empty => 0
    | link(f, r) => 1 + list-length(r)
  end
where:
  list-length(empty) is 0
  list-length([list: 1, 23]) is 2
end

fun add-till-zero(l :: List<Number>) -> Number:
  doc: "Add numbers in the list until 0"
  cases (List) l:
    | empty      => 0 
    | link(f, r) => 
      if f == 0:
        0
      else:
        f + add-till-zero(r)
      end
    end
where:
  add-till-zero([list: 7, 3, 0, 5]) is 
    [list: 7, 3, 0, 5].first + add-till-zero([list: 7, 3, 0, 5].rest)
  add-till-zero([list:    3, 0, 5]) is     
    [list: 3, 0, 5].first + add-till-zero([list: 3, 0, 5].rest)
  add-till-zero([list:       0, 5]) is 0
  add-till-zero([list:])            is 0
end

fun add-till-zero-each(l :: List<Number>) -> Number block:
  doc: "Adds numbers in the list until 0"
  var num = 0
  var b = false
  for each(n from l):
    if (b == true):
      num
    else if (n == 0):
      b := true
    else:
      num := num + n
    end
  end
  num
where:
  add-till-zero-each([list: 7, 3, 0, 5]) is 10
  add-till-zero-each([list:    3, 0, 5]) is 3
  add-till-zero([list:       0, 5]) is 0
  add-till-zero([list:])            is 0
end
LEN-LIMIT = 5

fun strings-less-than(l :: List<String>) -> List<String>:
  cases (List) l:
    | empty => empty
    | link(f, r) =>
      if string-length(f) < LEN-LIMIT:
        [list: f] + strings-less-than(r)
      else:
        strings-less-than(r)
      end
  end
where:
  strings-less-than([list: "James", "John"]) is [list: "John"]
  strings-less-than([list: "Dan", "James", "Donny"]) is [list: "Dan"]
end

fun strings-less-than-each(l :: List<String>) -> List<String> block:
  var newlist = empty
  for each(n from l):
    if string-length(n) < 5:
      newlist := newlist + [list: n]
    else:
      newlist
    end
  end
  newlist
where:
  strings-less-than([list: "James", "John"]) is [list: "John"]
  strings-less-than([list: "Dan", "James", "Donny"]) is [list: "Dan"]
end

fun find-error-suffix(l :: List<String>) -> List<String>:
  cases (List) l:
    | empty => empty
    | link(f, r) =>
      if f == "error":
        [list: f] + r
      else:
        find-error-suffix(r)
      end
  end
where:
  find-error-suffix([list: "Collins", "Russell", "error", "John"]) is [list: "error", "John"]
  find-error-suffix(empty) is empty
end

fun find-error-suffix-each(l :: List<String>) -> List<String> block:
  var newlist = empty
  var b = false
  for each(n from l):
    if (n == "error") block:
      b := true
      newlist := newlist + [list: n]
    else if (b == true):
      newlist := newlist + [list: n]
    else:
      newlist
    end
  end
  newlist
where:
  find-error-suffix([list: "Collins", "Russell", "error", "John"]) is [list: "error", "John"]
  find-error-suffix(empty) is empty
end