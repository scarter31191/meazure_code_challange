class Exam < ApplicationRecord
  belongs_to :college
  has_many :exam_windows
  has_and_belongs_to_many :students
  
end
