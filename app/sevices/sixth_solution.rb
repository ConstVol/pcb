class Sixth_Solution
  def initialize
    @third = Third_Solution.new
  end
  def get_answer(line)
    answer = ''
    line_of_anagrams = parse_line(line)
    line_length = line_of_anagrams.length.to_s
    lines = get_lines (line_of_anagrams)
    p lines

    lines.each do |lline|

      key_word = @third.check_pop(lline)
      if WORDS_POPULARITY.key? key_word
        title_picks = WORDS_POPULARITY[key_word]
        line_num_and_title = get_line_number_and_title(lline, title_picks, line_length)
        puts "line_num_and_title = #{line_num_and_title}"
        unless line_num_and_title[0] == ''
          title = line_num_and_title.pop
          line_num = line_num_and_title.pop
          answer = DIRTY_PUSHKIN[title][line_num]
          return answer
        end
      end
    end
    "Give me Pushkin's line"
  end

  def parse_line(line_of_anagrams)
    anagrams = []
    words = line_of_anagrams.split(' ')
    words.each do |word|
      anagram = word.chars.sort.join
      anagrams.push(anagram)
    end
    anagrams
  end

  def get_lines(anagrams)
    p anagrams
    lines = []
    line = []
    anagrams.each do |anagram|
      if ANAGRAMS_POP.key? anagram
        if lines.length == 0
          if ANAGRAMS_POP[anagram][:multy] == 1
            word = ANAGRAMS_POP[anagram][:cor_word]
            line.push word
            lines.push line
            line = []
          else
            ANAGRAMS_POP[anagram][:cor_word].each do |word|
              line.push word
              lines.push line
              line = []
            end
          end
        else
          cor_lines = lines
          new_lines = []
          if ANAGRAMS_POP[anagram][:multy] > 1
            ANAGRAMS_POP[anagram][:cor_word].each do |word|
              cor_lines.each do |lline|
                new_line = []
                lline.each {|word| new_line.push word }
                new_line.push word
                new_lines.push new_line
              end
            end
            lines = new_lines
            new_lines = []
          else
            lines.each {|x| x.push ANAGRAMS_POP[anagram][:cor_word]}
          end
        end
      end
    end
    lines
  end

  def get_line_number_and_title(words, title_picks, line_length)
    line_num = ''
    key_title = ''
    line_num_and_title = []
    title_picks.each do |title|
      if CLEAN_PUSHKIN[title][line_length].key? words
        line_num = CLEAN_PUSHKIN[title][line_length][words]
        key_title = title
      end
    end
    line_num_and_title.push(line_num, key_title)
  end
end