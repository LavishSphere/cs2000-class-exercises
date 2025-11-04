from dataclasses import dataclass

@dataclass
class Fruit:
    name: str
    color: str

fruits = ["apple", "banana", "cherry", "date"]
fruits_with_a = list(filter(lambda f: "a" in f, fruits))
fruits_upper = list(map(lambda f: f.upper(), fruits))

ints = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

ints_squared = list(map(lambda f: f * f, ints))

def all_even(nums: list) -> list:
    """ returns a new list with only even numbers """
    return list(filter(lambda f: f % 2 == 0, nums))

def test_all_even_ints() -> None:
    """ tests all_even for ints """
    assert all_even(ints) == [2, 4, 6, 8, 10]

def test_all_even_ints_squared() -> None:
    """ tests all_even for ints_squared """
    assert all_even(ints_squared) == [4, 16, 36, 64, 100]
