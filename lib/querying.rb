def select_books_titles_and_years_in_first_series_order_by_year
  "SELECT Books.title, Books.year FROM Books WHERE series_id = 1";
end

def select_name_and_motto_of_char_with_longest_motto
  "SELECT Characters.name, Characters.motto FROM Characters ORDER BY Characters.motto ASC LIMIT 1";
end


def select_value_and_count_of_most_prolific_species
  "SELECT Characters.species, COUNT(Characters.species) AS c
  FROM Characters GROUP BY Characters.species 
  HAVING COUNT(Characters.species)=(
  SELECT MAX(c)
  FROM (
  SELECT Characters.species, COUNT(Characters.species) c
  FROM Characters
  GROUP BY Characters.species)
  )";
end

def select_name_and_series_subgenres_of_authors
  "SELECT show.name, sub.name FROM Authors AS show
  LEFT OUTER JOIN Series AS s ON show.id = s.author_id
  JOIN Subgenres AS sub ON sub.id = s.subgenre_id ORDER BY show.name";
end

def select_series_title_with_most_human_characters
  "SELECT ser.title FROM Series AS ser LEFT OUTER JOIN Characters AS char ON ser.author_id = char.author_id WHERE char.species = 'human' LIMIT 1";
end

def select_character_names_and_number_of_books_they_are_in
  "SELECT Characters.name, COUNT(bks.title) AS bkCnt
  FROM Characters
  LEFT OUTER JOIN Series AS ser ON ser.author_id = Characters.author_id 
  JOIN Books AS bks ON bks.series_id = ser.id GROUP BY Characters.name 
  binding.pry
  HAVING COUNT(bks.title) = (
  SELECT MAX(bkCnt)
  FROM (
  SELECT Characters.name, COUNT(bks.title) bkCnt
  FROM Characters
  GROUP BY Characters.name)
  )";
end
