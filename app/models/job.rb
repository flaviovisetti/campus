class Job < ApplicationRecord
  validates :title, presence: { message: "can't be blank"}
  belongs_to :company
end
