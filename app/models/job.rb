class Job < ApplicationRecord
  belongs_to :company
  validates :title, presence: { message: "can't be blank"}
  validates :location, presence: { message: "can't be blank"}
  validates :description, presence: { message: "can't be blank"}
  validates :category, presence: { message: "can't be blank"}
end
