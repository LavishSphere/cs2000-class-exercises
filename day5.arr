use context dcic2024
fun choose-hat(temp-in-F :: Number) -> String:
  doc: "Determines temperature-appropriate headgear"
  comparison = temp-in-F > 80
  if temp-in-F < 50:
    "hood"
  else if temp-in-F >= 80:
    "sun hat"
  else:
    "no hat"
  end
where:
  choose-hat(70) is "no hat"
  choose-hat(40) is "hood"
  choose-hat(79) is "no hat"
  choose-hat(80) is "sun hat"
end


fun add-glasses(outfit :: String) -> String:
  outfit + ", and glasses"
where:
  add-glasses("Dress") is "Dress, and glasses"
  add-glasses("Shirt") is "Shirt, and glasses"
end

fun choose-outfit(temp-in-F :: Number) -> String:
  outfit = choose-hat(temp-in-F)
  add-glasses(outfit)
where:
  choose-outfit(80) is "sun hat, and glasses"
  choose-outfit(79) is "no hat, and glasses"
  choose-outfit(40) is "hood, and glasses"
end

fun choose-hat-or-visor(temp-in-F :: Number, has-visor :: Boolean) -> String:
  if (temp-in-F > 95) and (has-visor == true):
    "visor"
  else:
    choose-hat(temp-in-F)
  end
where:
  choose-hat-or-visor(96, true) is "visor"
  choose-hat-or-visor(80, true) is "sun hat"
  choose-hat-or-visor(40, true) is "hood"
end
