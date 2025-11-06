from day25 import all_even, capitalize_all, Book, long_books, filter_by_author

ints = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

ints_squared = list(map(lambda f: f * f, ints))

fruits = ["apple", "banana", "cherry", "date"]

b = [Book("Crime and Punishment", "Russell", 400), Book("Cat in the Hat", "Dr. Seuss", 50),
    Book("39 Clues", "N/A", 350)]

def test_all_even_ints() -> None:
    """ tests all_even for ints """
    assert all_even(ints) == [2, 4, 6, 8, 10]

def test_all_even_ints_squared() -> None:
    """ tests all_even for ints_squared """
    assert all_even(ints_squared) == [4, 16, 36, 64, 100]

def test_capitalize_all_fruits() -> None:
    """ tests capitalize_all for fruits """
    assert capitalize_all(fruits) == ["APPLE", "BANANA", "CHERRY", "DATE"]

def test_long_books_b() -> None:
    """ tests long_books for b """
    assert long_books(b) == [Book("Crime and Punishment", "Russell", 400), 
    Book("39 Clues", "N/A", 350)]

def test_filter_by_author_b_russell() -> None:
    """ tests filter_by_author for b with Russell """
    assert filter_by_author(b, "Russell") == [Book("Crime and Punishment", "Russell", 400)]
