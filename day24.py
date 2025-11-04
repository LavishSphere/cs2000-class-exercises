def greet(name: str) -> str:
    """ produces Hello, name! """
    return "Hello, " + name + "!"


def test_greet_ash() -> None:
    """ tests greet for Ash """
    assert greet("Ash") == "Hello, Ash!"

def test_greet_alice() -> None:
    """ tests greet for Alice """
    assert greet("Alice") == "Hello, Alice!"


def descript(name: str, age: int) -> str:
    """ gives a description with name and age """
    return name + " is " + str(age) + " years old."

def test_descript_ash() -> None:
    """ tests descript for Ash """
    assert descript("Ash", 18) == "Ash is 18 years old."

def test_descript_alice() -> None:
    """ tests descript for Alice """
    assert descript("Alice", 20) == "Alice is 20 years old."


def shipping_cost(weight: int) -> int:
    """ if weight <= 1, cost is $5; if weight <= 5, cost is $10; otherwise, $20 """
    if weight <= 1:
        return 5
    elif weight <= 5:
        return 10
    else:
        return 20

def test_shipping_cost_1() -> None:
    """ tests shipping_cost for 1 """
    assert shipping_cost(1) == 5

def test_shipping_cost_10() -> None:
    """ tests shipping_cost for 10 """
    assert shipping_cost(10) == 20