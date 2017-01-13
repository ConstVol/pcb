class First_Solution #MAKE IT BETTER!!!!

  def get_title(line)
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

    title_picks = WORDS_POPULARITY[key_word]

    title_picks.each do |title|

      if CLEAN_PUSHKIN[title].key? line_length
        CLEAN_PUSHKIN[title][line_length].each_key do |key_line|
          if key_line == words
            return answer = title
          end
        end
      end
    end
  end
end