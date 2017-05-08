class Ad < ApplicationRecord
  belongs_to :company
  belongs_to :run

  def self.visits(ad)
	ad.visits += 1
    ad.save
  end
end
