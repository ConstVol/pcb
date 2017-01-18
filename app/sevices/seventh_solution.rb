class Seventh_Solution
  def get_answer(line)
    words = line.split(' ')
    g_line = words.join
    anagram_of_line = g_line.chars.sort
    lines = get_lines(anagram_of_line)
  end
  def get_lines(anagram)
    answer = ''
    length = anagram.length
    if ANAGRAMS_OF_LINES.key? length
      answer = ANAGRAMS_OF_LINES[length][anagram] if ANAGRAMS_OF_LINES[length].key? anagram
    end
    answer
  end
end