use context dcic2024
data NumList:
| nl-empty
| nl-link(first :: Number, rest :: NumList)
end

fun num-7s(nl :: NumList) -> Number:
  doc: "Tells you how many number 7s there are"
  cases (NumList) nl:
    | nl-empty => 0
    | nl-link(first, rest) =>
      if first == 7:
        1 + num-7s(rest)
      else:
        num-7s(rest)
      end
  end
where:
  num-7s(nl-empty) is 0
  num-7s(nl-link(0, nl-empty)) is 0
  num-7s(nl-link(7, nl-empty)) is 1
  num-7s(nl-link(0, nl-link(7, nl-empty))) is 1
  num-7s(nl-link(0, nl-link(7, nl-link(7, nl-empty)))) is 2
end

fun contains-n(nl :: NumList, n :: Number) -> Boolean:
  doc: "Tells you if the number is in the NumList"
  cases (NumList) nl:
    | nl-empty => false
    | nl-link(first, rest) =>
      if first == n:
        true
      else:
        contains-n(rest, n)
      end
  end
where:
  contains-n(nl-empty, 0) is false
  contains-n(nl-link(0, nl-empty), 0) is true
  contains-n(nl-link(7, nl-empty), 2) is false
  contains-n(nl-link(0, nl-link(7, nl-empty)), 7) is true
  contains-n(nl-link(0, nl-link(7, nl-link(7, nl-empty))), 1) is false
end

fun total-sum(nl :: NumList) -> Number:
  doc: "Adds all the numbers in the NumList"
  cases (NumList) nl:
    | nl-empty => 0
    | nl-link(first, rest) =>
      first + total-sum(rest)
  end
where:
  total-sum(nl-empty) is 0
  total-sum(nl-link(7, nl-empty)) is 7
  total-sum(nl-link(0, nl-link(7, nl-empty))) is 7
  total-sum(nl-link(1, nl-link(7, nl-link(7, nl-empty)))) is 15
end

fun remove-3(nl :: NumList) -> NumList:
  doc: "Removes all the 3s from the NumList"
  cases (NumList) nl:
    | nl-empty => nl-empty
    | nl-link(first, rest) =>
      if first == 3:
        remove-3(rest)
      else:
        rest
      end
  end
end