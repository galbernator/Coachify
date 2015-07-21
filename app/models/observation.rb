class Observation < ActiveRecord::Base
  belongs_to :evaluation
  has_many :responses, dependent: :nullify
  has_many :answers, dependent: :nullify
  has_many :quesitons, dependent: :destroy
  belongs_to :observer, class_name: "User", foreign_key: :observer_id
  belongs_to :subject, class_name: "User", foreign_key: :subject_id

  validates :subject_id, presence: true
  validates :evaluation_id, presence: true

  def get_total_responses(observation)
    # start a new hash called questions outside of the loop
    questions = Hash.new
    # get all of the questions that are in the evaluation
     eval = observation.evaluation_id
     eval_questions = observation.responses
    # loop over each of the questions and get the question text
     eval_questions.each do |question|
        # instanciate a variable called answers to hold all of the answer options for the specific question
         answers = Hash.new(0)
        # loop through the answer possibilities and add them to answers
         question.answers.each do |answer|
           answers[answer.id] += 1
         end
        # add the hash of answers to the hash of questions by the question id
         questions[question.id] = answers
     end
    questions
  end
end


q.responses.joins(:answer).select("count(answer_id), answer_id").group(:answer_id).map {|x| result.merge({x.answer.answer => x.count}) } 
