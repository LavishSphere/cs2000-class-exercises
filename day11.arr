use context dcic2024
include csv
  
voter-data = 
  load-table: VoterID,FirstName,LastName,DOB,Party,Address,City,State,Zip,Phone,Email,LastVoted 
    source: csv-table-file("voters.csv", default-options)
end

filter-with(voter-data, lam(r :: Row) -> Boolean: r["Party"] == "Republican" end)

fun blank-to-indep(s :: String) -> String:
  if s == "":
    "Independent"
    else:
    s
  end
where:
  blank-to-indep("") is "Independent"
  blank-to-indep("Democrat") is "Democrat"
end

voters-with-indep = transform-column(voter-data, "Party", blank-to-indep)

fun uppercase-state(s :: String) -> String:
  string-to-upper(s)
where:
  uppercase-state("ma") is "MA"
  uppercase-state("NV") is "NV"
end

voters-with-uppercase-states = transform-column(voters-with-indep, "State", uppercase-state)

fun normalize-phone(s :: String) -> String:
  s1 = string-replace(s, "(", "")
  s2 = string-replace(s1, ")", "")
  s3 = string-replace(s2, " ", "")
  s4 = string-replace(s3, ".", "")
  string-replace(s4, "-", "")
where:
  normalize-phone("(111) 111-1111") is "1111111111"
  normalize-phone(" 222.222.2222") is "2222222222"
end

voters-with-normal-numbers = transform-column(voters-with-uppercase-states, "Phone", normalize-phone)

fun normalize-DOB(s :: String) -> String:
  s1 = string-replace(s, "/", "-")
  if (string-char-at(s1, 3) == "-") and (string-char-at(s1, 4) > 12):
    s1
    else:
    s1
  end
end