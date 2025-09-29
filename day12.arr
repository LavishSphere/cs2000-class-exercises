use context dcic2024
include data-source

weather-data =
  table: date, temperature, precipitation
    row: "2025-01-01", 62, 0.1
    row: "2025-01-02", "45", 3
    row: "2025-01-03", 28, 0.2
    row: "2025-01-04", 55, -1
    row: "2025-01-05", 90, 0
  end

fun normalize-temp(v) -> Number:
  doc: "converts strings/numbers to make sure it is number"
  if is-string(v):
    string-to-number(v).or-else(0)
  else:
    v
  end
where:
  normalize-temp("11") is 11
  normalize-temp(81) is 81
end

fixed-data = transform-column(weather-data, "temperature", normalize-temp)

fun bucket-temp(t :: Number) -> String:
  doc: "sorts the temperatures into categories cold, mild, or hot"
  if t < 40:
    "cold"
  else if t < 60:
    "mild"
  else: 
    "hot"
  end
where:
  bucket-temp(-10) is "cold"
  bucket-temp(0) is "cold"
  bucket-temp(39.9) is "cold"
  bucket-temp(40) is "mild"
  bucket-temp(58) is "mild"
  bucket-temp(60) is "hot"
  bucket-temp(100) is "hot"
end

with-buckets = build-column(fixed-data, "temp-category", lam(r :: Row) -> String: bucket-temp(r["temperature"]) end)

freq-bar-chart(with-buckets, "temp-category")



fun bucket-precip(p :: Number) -> String:
  doc: "sorts the precipitation into categories dry, drizzly, or wet"
  if p == 0:
    "dry"
  else if p < 1:
    "drizzly"
  else: 
    "wet"
  end
where:
  bucket-precip(-2) is "drizzly"
  bucket-precip(0) is "dry"
  bucket-precip(-0.7) is "drizzly"
  bucket-precip(0.5) is "drizzly"
  bucket-precip(5) is "wet"
end
with-precip-buckets = build-column(weather-data, "precip-category", lam(r :: Row) -> String: bucket-precip(r["precipitation"]) end)

freq-bar-chart(with-precip-buckets, "precip-category")