import pytest
from day27 import *

def test_sum_list_empty() -> None:
    """ tests sum_list for empty """
    assert sum_list([]) == 0

def test_sum_list_nonempty() -> None:
    """ tests sum_list for non-empty list """
    assert sum_list([1, 2, 3]) == 6

def test_product_list_empty() -> None:
    """tests product_list for empty"""
    assert product_list([]) == 1

def test_product_list_nonempty() -> None:
    """tests product_list for non-empty list"""
    assert product_list([1, 2, 3]) == 6

def test_count_occurrences_empty() -> None:
    """tests count_occurrences for empty"""
    assert count_occurrences([], "Hey") == 0

def test_count_occurrences_nonempty() -> None:
    """tests count_occurrences for non-empty list"""
    assert count_occurrences(["John", "Jacob", "John", "Dune", "Eli"], "John") == 2

def test_filter_by_prefix_empty() -> None:
    """tests filter_by_prefix for empty"""
    assert filter_by_prefix([], "Hey") == []

def test_filter_by_prefix_nonempty() -> None:
    """tests filter_by_prefix for non-empty list"""
    assert filter_by_prefix(["Ash", "Smith", "An", "And", "Tim", "Kim"], "A") == ["Ash", "An", "And"]

def test_reverse_list_empty() -> None:
    """tests reverse_list for empty list"""
    assert reverse_list([]) == []

def test_reverse_list_nonempty() -> None:
    """tests reverse_list for non-empty list"""
    assert reverse_list(["Ash", "Smith", "An", "And"]) == ["And", "An", "Smith", "Ash"]

def test_all_with_letter_empty() -> None:
    """tests all_with_letter for empty"""
    assert all_with_letter([], "A") == []

def test_all_with_letter_nonempty() -> None:
    """tests all_with_letter for non-empty list"""
    assert all_with_letter(["Ash", "Smith", "An"], "A") == ["Ash", "An"]
