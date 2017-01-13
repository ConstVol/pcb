class Fifth_Solution
  def initialize
    @third =Third_Solution.new
  end

  def get_answer(line)
    answer = ''
    words = @third.parse_line line
    needed_line = []

    key_words = []
    key_words = check_pop words
    p key_words
    first_key = key_words[0]
    second_key = key_words[1]

    title_picks = WORDS_POPULARITY[first_key]

    word_and_line = []
    word_and_line = find_word_and_line words, title_picks

    if word_and_line == []

      title_picks = WORDS_POPULARITY[second_key]

      word_and_line = find_word_and_line words, title_picks
      word = word_and_line[0]
      needed_line = word_and_line[1]

      replaced = words - needed_line
      replaced_word = replaced[0]

      answer = "#{word}, #{replaced_word}"

      return answer

    else
      word = word_and_line[0]
      needed_line = word_and_line[1]

      replaced = words - needed_line
      replaced_word = replaced[0]

      answer = "#{word}, #{replaced_word}"

      return answer

    end
  end

  def check_pop(words)
    key_words = []
    first_key = ''
    second_key = ''

    first_length = 999
    second_length = 999
    word_length = 0

    words.each do |word|
      if WORDS_POPULARITY.key? word
        word_length = WORDS_POPULARITY[word].length
        if word_length < first_length
          first_key = word
          first_length = word_length
        elsif word_length < second_length
          second_key = word
          second_length = word_length
        end
      end
    end
    key_words.push(first_key, second_key)
    key_words
  end

  def find_word_and_line(words, title_picks)
    answer = []
    line_length = words.length.to_s
    title_picks.each do |title|
      if CLEAN_PUSHKIN[title].key? line_length
        CLEAN_PUSHKIN[title][line_length].each_key do |key_line|
          intersection = key_line & words
          if intersection.length < line_length.to_i && intersection.length == line_length.to_i - 1
            needed_line = key_line
            missing_word = key_line - intersection
            answer.push(missing_word[0], needed_line)
            return answer
          end
        end
      end
    end
    answer
  end
end