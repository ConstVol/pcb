class Fourth_Solution
  def initialize
    @third =Third_Solution.new
  end

  def get_answer(line)
    lines = line.split("\n")
    first_words = @third.parse_line lines[0]
    second_words = @third.parse_line lines[1]
    third_words = @third.parse_line lines[2]

    key_word = @third.check_pop first_words

    title_picks = WORDS_POPULARITY[key_word]

    first_and_title = @third.find_word first_words, title_picks
    fist_word = first_and_title[0]

    title = []
    title.push first_and_title[1]

    second =  @third.find_word second_words, title
    second_word = second[0]

    third = @third.find_word third_words, title
    third_word = third[0]

    answer = "#{fist_word}, #{second_word}, #{third_word}"
  end
end