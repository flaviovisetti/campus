class Company < ApplicationRecord
  has_many :jobs

  def premium?
    jobs.size >= 5
  end

end
