class Solver

  def initialize
    @first = First_Solution.new
    @second = Second_Solution.new
    @third = Third_Solution.new
    @fourth = Fourth_Solution.new
    @fifth = Fifth_Solution.new
    @sixth = Sixth_Solution.new
    @seventh = Seventh_Solution.new
    @eighth = Eighth_Solution.new
  end

  def get_answer(line, level)
    answer = "I don't know"
    level = level.to_i
    case level
      when 1
        answer = @first.get_title(line)
      when 2
        answer = @second.get_word(line)
      when 3
        answer = @third.get_answer(line)
      when 4
        answer = @fourth.get_answer(line)
      when 5
        answer = @fifth.get_answer(line)
      when 6
        answer = @sixth.get_answer(line)
      when 7
        answer = @seventh.get_answer(line)
      when 8
        answer = @eighth.get_answer(line)
    end
    answer
  end
end