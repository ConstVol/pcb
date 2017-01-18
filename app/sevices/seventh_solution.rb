class Seventh_Solution
  def get_answer(line)
    words = line.split(' ')
    num_of_words = words.length
    g_line = words.join
    anagram_of_line = g_line.chars.sort
    lines = get_lines(anagram_of_line, num_of_words)
  end
  def get_lines(anagram, num_of_words)
    answer = ''
    length = anagram.length
    num_of_words = num_of_words.to_s
    if ANAGRAMS_OF_LINES.key? length
      if ANAGRAMS_OF_LINES[length].key? num_of_words
        answer = ANAGRAMS_OF_LINES[length][num_of_words][anagram] if ANAGRAMS_OF_LINES[length][num_of_words].key? anagram
      end
    end
    answer
  end
end