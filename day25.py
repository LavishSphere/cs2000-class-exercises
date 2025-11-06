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

def capitalize_all(words: list) -> list:
    """ returns a new list with letters capitalized """
    return list(map(lambda f: f.upper(), words))

a = list(map(len, ["hello", "world", "python"]))

@dataclass
class Book:
    title: str
    author: str
    pages: int

def long_books(books: list) -> list:
    """ Makes new list with only books > 300 pages """
    return list(filter(lambda f: f.pages > 300, books))

b = [Book("Crime and Punishment", "Russell", 400), Book("Cat in the Hat", "Dr. Seuss", 50),
    Book("39 Clues", "N/A", 350)]

def filter_by_author(books: list, author: str) -> list:
    """Filters books to show only the author given"""
    return list(filter(lambda f: f.author == author, books))
