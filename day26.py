y = 100
def outer() -> int:
    """ the outer function """
    global y
    y = 200
    def inner() -> int:
        global y
        y = y + 50
        return y
    return inner()
print(outer())

x = 10
def foo() -> int:
    """ a function """
    global x
    x = x + 1
    return x
print(foo())
