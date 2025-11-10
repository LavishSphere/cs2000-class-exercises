use context dcic2024
fun product-list(numlist :: List<Number>) -> Number block:
  doc: "Returns the product of all numbers in the list."
  var products = 1
  for each(n from numlist):
    products := products * n
  end
  products
where:
  product-list(empty) is 1
  product-list([list: 1, 2, 3]) is 6
end

fun product-list-recursion(numlist :: List<Number>) -> Number:
  doc: "Returns the product of all numbers in the list using recursion"
  cases (List<Number>) numlist:
    | empty => 1
    | link(f, r) => f * product-list-recursion(r)
  end
where:
  product-list-recursion(empty) is 1
  product-list-recursion([list: 1, 2, 3]) is 6
end
