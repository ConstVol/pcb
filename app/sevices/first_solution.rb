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

    if WORDS_POPULARITY.key? key_word
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
    answer
  end

  def get_title_v3(line)
    answer = ''
    line = line.gsub(/\d+/, '')
    line = line.gsub('........................................................', '')
    line = line.gsub(/\u00a0/, ' ').split.join(' ')
    array_of_words = line.split(' ')
    num_of_words = array_of_words.length
    array_of_chars = array_of_words.join.chars
    line_length = array_of_chars.length
    if FIRST_TASK_HASH.key? line_length
      if FIRST_TASK_HASH[line_length].key? num_of_words
        if FIRST_TASK_HASH[line_length][num_of_words][line]
          answer = FIRST_TASK_HASH[line_length][num_of_words][line]
        end
      end
    end
    answer = answer.gsub(/\d+/, '')
    answer
  end
end