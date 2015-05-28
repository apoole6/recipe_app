class Recipe < ActiveRecord::Base

	validates :name, presence: true, uniqueness: true, length: {minimum: 2}
	validates :category, presence: true, uniqueness: true, length: {minimum: 2}
	validates :instructions, presence: true, uniqueness: true, length: {maximum: 1500}
	validates :minutes_to_prepare, presence: true, uniqueness: true, numericality: {greater_than: -1}
	validates :minutes_to_cook, presence: true, uniqueness: true, numericality: {greater_than: 0, less_than: 500}

     mount_uploader :picture, PictureUploader 
	
	def minutes_total
		if (minutes_to_prepare > 0)
			 minutes_to_prepare + minutes_to_cook
		else
			minutes_to_cook
		end
	end
end
