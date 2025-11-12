use context dcic2024
data LibraryBook:
  library-book(id :: Number, title :: String, ref copies :: Number)
end
book1 = library-book(101, "The Curious Incident", 5)
book2 = book1
book1!{copies: book1!copies - 1}
# book2!copies is now 4, because book2 is an alias for book1

book3 = library-book(101, "The Curious Incident", 5)
print(book1 == book3)  # false, since they are different objects and number of copies is mutable
print(book1 == book1)  # true, same object

data Box: box(ref value :: Number) end
box1 = box(10)
box2 = box1
box1!{value: 20}
box2!value

data Counter: counter(ref count :: Number) end
fun increment(c):
  c!{count: c!count + 1}
end

c1 = counter(0)
c2 = c1
increment(c1)
c2!count