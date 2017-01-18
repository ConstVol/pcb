class Second_Solution

  def get_word(line)
    answer = ''
    words = line.gsub(/[^\s[a-zA-Zа-яА-Я]]/, '').split(' ')
    line_length = words.length.to_s

    key_word = ''
    first_length = 999
    second_length = 0
    title_picks = []

    words.each do |word|
      if WORDS_POPULARITY.key? word
        second_length = WORDS_POPULARITY[word].length
        if second_length < first_length
          key_word = word
          first_length = second_length
        end
      end
    end

    if WORDS_POPULARITY.key? key_word
      title_picks = WORDS_POPULARITY[key_word]

      title_picks.each do |title|
        if CLEAN_PUSHKIN[title].key? line_length
          CLEAN_PUSHKIN[title][line_length].each_key do |key_line|
            intersection = key_line & words
            if intersection.length < line_length.to_i && intersection.length == line_length.to_i - 1
              missing_word = key_line - intersection
              answer = missing_word[0]

              return answer
            end
          end
        end
      end
    end
    answer
  end
end