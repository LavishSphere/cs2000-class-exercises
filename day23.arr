use context dcic2024
data BST:
  | empty-leaf
  | node(key :: Number, val :: String, left :: BST, right :: BST)
end

BST0 = empty-leaf
BST1 = node(1, "hello", BST0, BST0)
BST2 = node(5, "bye", BST1, BST0)
BST3 = node(6, "bye", BST2, node(10, "cs2000", BST0, BST0))

fun height(bst :: BST) -> Number:
  doc: "finds height of BST"
  cases (BST) bst:
    | empty-leaf => 0
    | node(a, b, c, d) => 1 + num-max(height(c), height(d))
  end
where:
  height(BST0) is 0
  height(BST1) is 1
  height(BST2) is 2
  height(BST3) is 3
end

fun add-one-to-keys(bst :: BST) -> BST:
  doc: "creates a new tree with keys one larger than the original"
  cases (BST) bst:
    | empty-leaf => empty-leaf
    | node(a, b, c, d) => node(a + 1, b, add-one-to-keys(c), add-one-to-keys(d))
  end
where:
  add-one-to-keys(BST0) is empty-leaf
  add-one-to-keys(BST1) is node(2, "hello", BST0, BST0)
  add-one-to-keys(BST2) is node(6, "bye", node(2, "hello", BST0, BST0), BST0)
end

# Class exercise 1
##
## The main goal of a BST is to be able to look up values at a given key. 
## Design a function retrieve that takes a BST, a Number, and returns an
## Option<String> -- if the given number exists as a key in the tree, your 
## function should return some(v) where v is the string value that is on 
## the node with the key. If the given number doesn't exist, your function
## should return none.

fun retrieve(bst :: BST, goal-num :: Number) -> Option<String>:
  doc: "finds the value associated with num in bst or returns none"
  cases (BST) bst:
    | empty-leaf => none
    | node(a, b, c, d) =>
      if a == goal-num:
        some(b)
      else if retrieve(c, goal-num) <> none:
        retrieve(c, goal-num)
      else if retrieve(d, goal-num) <> none:
        retrieve(d, goal-num)
      else:
        none
      end
  end
where:
  retrieve(BST3, 6) is some("bye") # base case
  retrieve(BST3, 1) is some("hello") # left recursion
  retrieve(BST3, 10) is some("cs2000") # right recursion
  retrieve(BST3, 3) is none # number not in tree
end
  
## Class exercise 2
##
## In order for BSTs to have the performance characteristics that define
## them, they have to be balanced....Design a function is-balanced that
## should take a BST and return a boolean that indicates if the tree is
## balanced: this means that at every level, the height of the left and
## right subtrees differs by at most 1.

fun is-balanced(bst :: BST) -> Boolean:
  doc: "finds whether a BST is balanced"
  cases (BST) bst:
    | empty-leaf => true
    | node(a, b, c, d) =>
      if (height(c) == height(d)) or ((height(c) - 1) == height(d)) or ((height(d) - 1) == height(c)):
        true
      else:
        false
      end
  end
where:
  is-balanced(BST3) is true
  # This tree only has left nodes and is unbalanced
  is-balanced(node(1, "root", node(2, "left1", node(3, "left2", empty-leaf, empty-leaf), empty-leaf), empty-leaf)) is false
end
  
## Class exercise 3
##
## Design a data definition Arith that allows you to represent:
## * numbers, 
## * addition of two arithmetic expressions
## * multiplication of two arithmetic expressions
## * division of two arithmetic expressions
## * subtraction of two arithmetic expressions
##
## This should be a binary tree with one leaf constructor (for 
## numbers) and four node constructors (for the four types of 
## binary operations).

data Arith:
  | num(n :: Number)
  | addition(a :: Arith, b :: Arith)
  | multiplication(a :: Arith, b :: Arith)
  | division(a :: Arith, b :: Arith)
  | subtraction(a :: Arith, b :: Arith)
end


## Class exercise 4
## 
## Define constants using your Arith to represent the following expressions:

## 1 + 2

## 1 * (3 / 4)

## (7 - 3) * (2 + (5 / 2))

CONST1 = addition(num(1), num(2))
CONST2 = multiplication(num(1), division(num(3), num(4)))
CONST3 = multiplication(subtraction(num(7), num(3)), addition(num(2), division(num(5), num(2))))

## Class exercise 5
##
## Design a function eval that takes an Arith and returns the single number
## to which it evaluates.

fun eval(arith :: Arith) -> Number:
  doc: "evaluates an arithmetic expression"
  cases (Arith) arith:
    | num(n) => n
    | addition(a, b) => eval(a) + eval(b)
    | multiplication(a, b) => eval(a) * eval(b)
    | division(a, b) => eval(a) / eval(b)
    | subtraction(a, b) => eval(a) - eval(b)
  end
where:
  eval(CONST1) is 3
  eval(CONST2) is 0.75
  eval(CONST3) is 18
end