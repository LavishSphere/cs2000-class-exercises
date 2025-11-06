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

def greet(name: str) -> str:
    """ produces Hello, name! """
    return "Hello, " + name + "!"

def descript(name: str, age: int) -> str:
    """ gives a description with name and age """
    return name + " is " + str(age) + " years old."

def shipping_cost(weight: int) -> int:
    """ if weight <= 1, cost is $5; if weight <= 5, cost is $10; otherwise, $20 """
    if weight <= 1:
        return 5
    elif weight <= 5:
        return 10
    else:
        return 20

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
