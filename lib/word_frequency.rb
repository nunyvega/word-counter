def most_common_words(file_name, stop_words_file_name, number_of_word)
  unique_words_hash = {}
  final_hash = {}

  text = open_text(file_name)

  text_array = clean_text(text)
  # abrir archivos y meterlos en un array parte 2
  filtered_words = open_filter_words(stop_words_file_name)
  # volver las palabras filtradas un array y luego un hash
  filtered_words_hash = string_to_hash(filtered_words)
  # volver las palabras del texto q no sean filtrables un hash
  loopie(unique_words_hash, filtered_words_hash, text_array)
  # acomodarlas x tamanio (las vuelve un array)
  unique_words_sorted = unique_words_hash.sort_by { |_, value| -value }
  # crear el hash con la cantidad de valores q pida el input
  number_of_word.times { |loop| final_hash[unique_words_sorted[loop][0].to_s] = unique_words_sorted[loop][1] }
  # devolver el hash
  return final_hash.sort.to_h
end

def loopie(unique_words_hash, filtered_words_hash, text_array)
  text_array.each do |word|
    unless filtered_words_hash[word.downcase.to_sym]
      if unique_words_hash[word.downcase.to_sym]
        unique_words_hash[word.downcase.to_sym] += 1
      else
        unique_words_hash[word.downcase.to_sym] = 1
      end
    end
  end
end

def clean_text(text)
  clean_text = text.gsub(/[[:punct:]]/, ' ')
  text_array0 = clean_text.split
  text_array = text_array0.select { |i| i[/[:a-zA-Z:]+/] }
  return text_array
end

def string_to_hash(filtered_words)
  filtered_words_hash = {}
  filtered_words_array = filtered_words.split
  filtered_words_array.each do |filtered_word|
    filtered_words_hash[filtered_word.downcase.to_sym] = ""
  end
  return filtered_words_hash
end

def open_text(file_name)
  text = ""
  File.open(file_name, "r").each_line { |line| text << line }
  return text
end

def open_filter_words(stop_words_file_name)
  filtered_words = ""
  File.open(stop_words_file_name, "r").each_line { |line| filtered_words << line }
  return filtered_words
end
