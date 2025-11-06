import pytest
from day24 import gadget_cost, greet, descript, shipping_cost, grade_letter

def test_gadget_cost_small() -> None:
    """ test gadget_cost for small """
    assert gadget_cost(1, "hi") == pytest.approx(0.6)

def test_greet_ash() -> None:
    """ tests greet for Ash """
    assert greet("Ash") == "Hello, Ash!"

def test_greet_alice() -> None:
    """ tests greet for Alice """
    assert greet("Alice") == "Hello, Alice!"

def test_descript_ash() -> None:
    """ tests descript for Ash """
    assert descript("Ash", 18) == "Ash is 18 years old."

def test_descript_alice() -> None:
    """ tests descript for Alice """
    assert descript("Alice", 20) == "Alice is 20 years old."

def test_shipping_cost_1() -> None:
    """ tests shipping_cost for 1 """
    assert shipping_cost(1) == 5

def test_shipping_cost_10() -> None:
    """ tests shipping_cost for 10 """
    assert shipping_cost(10) == 20

def test_grade_letter_65() -> None:
    """ tests grade_letter for 65 """
    assert grade_letter(65) == "D"

def test_grade_letter_90() -> None:
    """ tests grade_letter for 90 """
    assert grade_letter(90) == "A"
