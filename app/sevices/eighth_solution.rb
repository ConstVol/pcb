class Eighth_Solution
  def get_answer(line)
    words = line.split(' ')
    g_line = words.join
    anagram_of_line = g_line.chars.sort
    lines = get_lines anagram_of_line
  end

  def get_lines(angram)
    line_length = angram.length
    if ANAGRAMS_OF_LINES.key?(line_length)
        ANAGRAMS_OF_LINES[line_length].each_key do |key|
          intersection = angram - key
          intersection.length
          if intersection.length == 1
            return  ANAGRAMS_OF_LINES[line_length][num_of_words][key]
          end
        end
        return "My bad"
    else
      return "Can't help you"
    end
  end
end