def sum_list(num_list: list[float]) -> float:
    """Returns the sum of all numbers in the list."""
    run_total = 0.0
    for num in num_list:
        run_total = run_total + num
    return run_total

def product_list(num_list: list[float]) -> float:
    """Returns the product of all numbers in the list."""
    total = 1.0
    for num in num_list:
        total = total * num
    return total

def count_occurrences(items: list[str], target: str) -> int:
    """Returns how many times the string appears in the list."""
    counts = 0
    for item in items:
        if item == target:
            counts += 1
    return counts

def filter_by_prefix(words: list[str], prefix: str) -> list[str]:
    """ Returns only the list of words that start with the prefix """
    output = []
    for s in words:
        if s.startswith(prefix):
            output += [s]
    return output

def reverse_list(lst: list) -> list:
    """Returns a list in reverse order"""
    output = []
    for s in lst:
        output = [s] + output
    return output

def all_with_letter(words: list[str], letter: str[str]) -> list[str]:
    """Returns a new list with all words that contained the letter"""
    output = []
    for word in words:
        if letter in word:
            output += [word]
    return output
