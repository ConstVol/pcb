class Third_Solution
  def get_answer(line)
    lines = line.split("\n")
    first_words = parse_line lines[0]
    second_words = parse_line lines[1]

    key_word = check_pop first_words

    title_picks = WORDS_POPULARITY[key_word]

    first_and_title = find_word first_words, title_picks
    fist_word = first_and_title[0]
    title = []
    title.push first_and_title[1]


    second =  find_word second_words, title
    second_word = second[0]

    answer = "#{fist_word}, #{second_word}"
  end

  def parse_line(line)
    words = line.gsub(/[^\s[a-zA-Zа-яА-Я]]/, '').split(' ')
  end

  def check_pop(words)
    key_word = ''
    first_length = 999
    second_length = 0
    words.each do |word|
      if WORDS_POPULARITY.key? word
        second_length = WORDS_POPULARITY[word].length
        if second_length < first_length
          key_word = word
          first_length = second_length
        end
      end
    end
    key_word
  end

  def find_word(words, title_picks)
    answer = []
    line_length = words.length.to_s

    title_picks.each do |title|
      if CLEAN_PUSHKIN[title].key? line_length
        CLEAN_PUSHKIN[title][line_length].each_key do |key_line|
          intersection = key_line & words
          if intersection.length < line_length.to_i && intersection.length == line_length.to_i - 1
            needed_title = title
            missing_word = key_line - intersection
            answer.push(missing_word[0], needed_title)
            return answer
          end
        end
      end
    end

  end
end