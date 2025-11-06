use context dcic2024
var x = 10
fun f() block:
  x := x + 5
  x
end
f()

var a = 10
fun inc() block:
  a := a + 1
  a
end
inc()
a