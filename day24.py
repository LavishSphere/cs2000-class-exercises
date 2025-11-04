import pytest

def add_shipping(order_amt: float) -> float:
    """ adds 4 for orders <= 10 (but non-zero), 8 for orders < 30, 12 for larger orders """
    if order_amt == 0:
        return 0
    elif order_amt <= 10:
        return order_amt + 4
    elif order_amt < 30:
        return order_amt + 8
    else:
        return order_amt + 12


def gadget_cost(num_gadgets: int, label: str) -> float:
    """ computes cost, at $0.50 per gadget plus $0.05 per character in label """
    return num_gadgets * (0.50 + (len(label) * 0.05))

def test_gadget_cost_small() -> None:
    """ test gadget_cost for small """
    assert gadget_cost(1, "hi") == pytest.approx(0.6)

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


def grade_letter(score: int) -> str:
    """ converts score into letter grade """
    if score >= 90:
        return "A"
    elif 80 <= score < 90:
        return "B"
    elif 70 <= score < 80:
        return "C"
    elif 60 <= score < 70:
        return "D"
    else:
        return "F"

def test_grade_letter_65() -> None:
    """ tests grade_letter for 65 """
    assert grade_letter(65) == "D"

def test_grade_letter_90() -> None:
    """ tests grade_letter for 90 """
    assert grade_letter(90) == "A"
