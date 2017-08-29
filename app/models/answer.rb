class Answer < ApplicationRecord
  validates :description, presence: true, length: { minimum: 50 }
  validates :user_id, presence: true
  validates :question_id, presence: true
  belongs_to :question
end
