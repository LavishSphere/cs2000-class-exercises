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
  doc: "Tells you if the number is in the list"
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