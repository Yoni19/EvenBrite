class Event < ApplicationRecord
  belongs_to :organizer, class_name: "User"
  has_many :attendances
	has_many :users, through: :attendances

  validates :start_date, presence: true 
	validate :is_start_date_past?

	validates :duration, presence: true
	validate :is_duration_correct?

	validates :title, presence: true, length: {minimum: 5, maximum: 140}
	validates :description, presence: true, length: {minimum: 20, maximum: 1000}

	validates :price, presence: true, numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 1000}
	validates :location, presence: true

	
	def is_start_date_past?
		if start_date < Time.now
			errors.add(:start_date, "Tu ne peux pas encore voyager dans le temps, ducon")
		end
	end

	def is_duration_correct?
		if duration <= 0 || (duration % 5) != 0 
			errors.add(:duration, "Doit être un multiple de 5, et est strictement positif")
		end			
	end
end
