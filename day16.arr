use context dcic2024
import lists as L

fun my-doubles-map(num-list :: List<Number>) -> List<Number>:
  doc: "builds a list of numbers twice the size of numbers in the original list"
  L.map(
    lam(num :: Number) -> Number: 2 * num end,
    num-list)
where:
  my-doubles-map([list: 1, 2, 3]) is [list: 2, 4, 6]
  my-doubles-map([list: ]) is [list: ]
end

fun my-string-lens(str-list :: List<String>) -> List<Number> block:
  var list-A = [list:]
  for each(s from str-list):
    n = string-length(s)
    list-A := L.append(list-A, [list: n])
  end
  list-A
end

fun my-string-lens-map(str-list :: List<String>) -> List<Number>:
  doc: "replaces the strings in the list to the length of it"
  L.map(string-length, str-list)
end

fun my-pos-nums(num-list :: List<Number>) -> List<Number> block:
  var numbers-list = [list: ]
  for each(n from num-list):
    when n > 0:
      numbers-list := L.append(numbers-list, [list: n])
    end
  end
  numbers-list
end

fun my-pos-nums-filter(num-list :: List<Number>) -> List<Number>:
  L.filter(lam(n :: Number) -> Boolean: n > 0 end, num-list)
end

#| fun my-alternating(l :: List) -> List:
  var a = ""
  var b = ""
   end |#