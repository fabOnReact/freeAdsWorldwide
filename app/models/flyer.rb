class Flyer < ApplicationRecord
	mount_uploader :image, FlyerUploader

	belongs_to :company
end
