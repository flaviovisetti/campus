class Company < ApplicationRecord
  has_many :jobs

  def premium?
    if self.jobs.size >= 5
    end
  end

end
