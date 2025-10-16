use context dcic2024
include csv
include data-source

recipes = load-table:
  title :: String,
  servings :: Number,
  prep-time :: Number
  source: csv-table-url("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/support/5-recipes.csv", default-options)
  sanitize servings using num-sanitizer
  sanitize prep-time using num-sanitizer
end

data BookRecord:
  | book(title :: String, author :: String, pages :: Number)
end

data PodcastRecord:
  | podcast(title :: String, creator :: String, length-in-min :: Number)
end

data RecipeRecord:
  | recipe(title :: String, servings :: Number, prep-time :: Number)
end


the-dispossessed = book("The Dispossessed", "Ursula K. Le Guin", 387)
to-the-lighthouse = book("To the Lighthouse", "Virginia Woolf", 209)
brave-new-world = book("Brave New World", "Aldous Huxley", 268)

ramsey-show = podcast("The Ramsey Show", "Dave Ramsey", 60)
joe-rogan-experience = podcast("The Joe Rogan Experience", "Joe Rogan", 45)

fun book-summary(b :: BookRecord) -> String:
  doc: "makes a string summary info for book"
  b.title + " by " + b.author + " with " + num-to-string(b.pages) + " pages"
where:
  book-summary(the-dispossessed) is "The Dispossessed by Ursula K. Le Guin with 387 pages"
  book-summary(to-the-lighthouse) is "To the Lighthouse by Virginia Woolf with 209 pages"
end

fun is-long-book(b :: BookRecord) -> Boolean:
  doc: "checks if book is longer than 350 pages"
  b.pages > 350
where:
  is-long-book(the-dispossessed) is true
  is-long-book(to-the-lighthouse) is false
end

fun podcast-summary(p :: PodcastRecord) -> String:
  doc: "makes a string summary for podcast"
  p.title + " by " + p.creator + " - " + num-to-string(p.length-in-min) + " minutes"
where:
  podcast-summary(ramsey-show) is "The Ramsey Show by Dave Ramsey - 60 minutes"
  podcast-summary(joe-rogan-experience) is "The Joe Rogan Experience by Joe Rogan - 45 minutes"
end

fun row-to-recipe(r :: Row) -> RecipeRecord:
  doc: "Creates a recipe"
  recipe(r["title"], r["servings"], r["prep-time"])
where:
  row-to-recipe(recipes.row-n(0)) is recipe("Classic Pancakes", 4, 15)
  row-to-recipe(recipes.row-n(1)) is recipe("Banana Oatmeal Muffins", 12, 20)
end

build-column(recipes, "recipe", row-to-recipe)