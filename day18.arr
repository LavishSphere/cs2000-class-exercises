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
  b.title + " by " + b.author + " with " + num-to-string(b.pages) + " pages"
end

fun is-long-book(b :: BookRecord) -> Boolean:
  b.pages > 350
end

fun podcast-summary(p :: PodcastRecord) -> String:
  p.title + " by " + p.creator + " - " + num-to-string(p.length-in-min) + " minutes"
end

fun row-to-recipe(r :: Row) -> RecipeRecord:
  recipe(r["title"], r["servings"], r["prep-time"])
end

build-column(recipes, "recipe", row-to-recipe)