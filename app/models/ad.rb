class Ad < ApplicationRecord
  belongs_to :company
  belongs_to :run

  def self.visits(ad)
	if ad.visits.nil?
      ad.visits = 1
    else
      ad.visits += 1
    end
    ad.save
  end
end
