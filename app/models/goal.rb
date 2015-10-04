class Goal < ActiveRecord::Base
  validates :title, :details, :difficulty, presence: true
  validates :difficulty, numericality: true
end
