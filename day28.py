from dataclasses import dataclass

@dataclass
class LibraryBook:
    id: int
    title: str
    copies: int

book1 = LibraryBook(101, "The Curious Incident", 5)
book2 = book1
book1.copies = book1.copies - 1
# book2.copies is now 4, because book2 is an alias for book1

book3 = LibraryBook(101, "The Curious Incident", 5)
print(book1 == book3)  # True if contents are the same
print(book1 is book3)  # False, different objects
print(book1 is book2)  # True, same object (alias)

list1 = [1, 2, 3]
list2 = list1
list1.append(4)
print(list2)
list1 = [1, 2, 3]
list2 = [1, 2, 3]
list3 = list1
print(list1 == list2)
print(list1 is list2)
print(list1 is list3)

def add_item(my_list, item):
    my_list.append(item)
    return my_list

original = [1, 2]
result1 = add_item(original, 3)
result2 = add_item(original, 4)
print(original)
print(result1)
print(result2)

list1 = [10, 20, 30]
list2 = list1
list1[1] = 99
print(list1)
print(list2)

def make_list():
    new_list = [1, 2, 3]
    new_list.append(4)
    return new_list

result1 = make_list()
result2 = make_list()
print(result1 is result2)

def make_counter():
    count = 0
    count = count + 1
    return count

result1 = make_counter()
result2 = make_counter()
print(result1 == result2)