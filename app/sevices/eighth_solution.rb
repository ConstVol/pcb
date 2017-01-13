class Eighth_Solution
  def get_answer(line)
    words = line.split(' ')
    num_of_words = words.length
    g_line = words.join
    anagram_of_line = g_line.chars.sort
    lines = get_lines anagram_of_line, num_of_words
  end

  def get_lines(angram, num_of_words)
    line_length = angram.length
    num_of_words = num_of_words.to_s
    if ANAGRAMS_OF_LINES.key?(line_length)
      if ANAGRAMS_OF_LINES[line_length].key? num_of_words
        ANAGRAMS_OF_LINES[line_length][num_of_words].each_key do |key|
          intersection = angram - key
          intersection.length
          p intersection.length if intersection.length < 3
          if intersection.length == 1
            return  ANAGRAMS_OF_LINES[line_length][num_of_words][key]
          end
        end
        return "My bad"
      end
    else
      return "Can't help you"
    end
  end
end