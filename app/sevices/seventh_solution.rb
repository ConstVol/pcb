class Seventh_Solution
  def get_answer(line)
    words = line.split(' ')
    num_of_words = words.length
    g_line = words.join
    anagram_of_line = g_line.chars.sort
    lines = get_lines(anagram_of_line, num_of_words)
  end
  def get_lines(anagram, num_of_words)
    length = anagram.length
    num_of_words = num_of_words.to_s
    ANAGRAMS_OF_LINES[length][num_of_words][anagram]
  end
end