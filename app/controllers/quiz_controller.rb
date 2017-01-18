class QuizController < ApplicationController
  def new

  end

  def solve
    uri = URI("http://pushkin.rubyroidlabs.com/quiz")
    @solver = Solver.new
    receipt_time = Time.new.to_s[0..-6]
    question = params[:question]
    level = params[:level]


    start = Time.now
    answer = @solver.get_answer(question, level)
    finish = Time.now
    diff = finish - start
    response_time = diff.to_s
    if answer.kind_of? Array
      answer.each do |answ|

        parameters = {
            answer: answ,
            token: API_KEY,
            task_id: params[:id]
        }
        Net::HTTP.post_form(uri, parameters)

      end
    else
      parameters = {
          answer: answer,
          token: API_KEY,
          task_id: params[:id]
      }
      Net::HTTP.post_form(uri, parameters)

    end
    #Log.new( level: level, receipt_time: receipt_time, question: question, response_time: response_time, answer: answer).save

  end
end
