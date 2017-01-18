class Eighth_Solution
  def get_answer(line)
    words = line.split(' ')
    g_line = words.join
    anagram_of_line = g_line.chars.sort
    lines = get_lines anagram_of_line
  end

  def get_lines(angram)
    answer = ''
    line_length = angram.length
    if ANAGRAMS_OF_LINES.key?(line_length)
      ANAGRAMS_OF_LINES[line_length].each_key do |key|
        intersection = angram - key
        diff = intersection.length
        if diff == 1
          answer = ANAGRAMS_OF_LINES[line_length][key]
          return answer
        end
      end
    end
    answer
  end
end