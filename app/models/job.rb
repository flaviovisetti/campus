class Job < ApplicationRecord
  belongs_to :company
  belongs_to :category

  validates :title, presence: { message: "can't be blank"}
  validates :location, presence: { message: "can't be blank"}
  validates :description, presence: { message: "can't be blank"}
  validates :category, presence: { message: "can't be blank"}

  def expired?
     Date.today >= (created_at.to_date + 90)
  end

end
