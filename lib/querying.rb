def select_books_titles_and_years_in_first_series_order_by_year
  "SELECT Books.title, Books.year FROM Books WHERE series_id = 1";
end

def select_name_and_motto_of_char_with_longest_motto
  "SELECT Characters.name, Characters.motto FROM Characters ORDER BY Characters.motto ASC LIMIT 1";
end


def select_value_and_count_of_most_prolific_species
  "SELECT Characters.species, COUNT(Characters.species) FROM Characters  GROUP BY Characters.species 
HAVING COUNT(Characters.species)=(SELECT MAX(prolif) FROM (SELECT Characters.species, COUNT(Characters.species) mycount FROM Characters GROUP BY Characters.species));";
end

def select_name_and_series_subgenres_of_authors
  "SELECT Authors.name, Subgenres.name FROM Authors LEFT OUTER JOIN Subgenres ON Authors.subgenre_id  "
end

def select_series_title_with_most_human_characters
  "Write your SQL query here"
end

def select_character_names_and_number_of_books_they_are_in
  "Write your SQL query here"
end
