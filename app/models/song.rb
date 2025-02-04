class Song < ActiveRecord::Base 
    # binding.pry
    validates :title, presence: true
    # validates :title, uniqueness: { scope: %i[release_year, artist_name], message: "Cannot be repeated by the same artist in the same year" }
  
    
    validates :released, inclusion: { in: [true, false] }
      with_options if: :released? do |song|
        song.validates :release_year, presence: true
        song.validates :release_year, numericality: { less_than_or_equal_to: Date.today.year }
        song.validates :release_year, uniqueness: true
        end
      validates :artist_name, presence: true
  
  
  end