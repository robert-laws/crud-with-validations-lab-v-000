class Song < ActiveRecord::Base
  validates :title, presence: true


  validates :released, inclusion: { in: [true, false]}

  validates :release_year, presence: true, if: :released
  validates :release_year, length: { maximum: 2018 }

  validates :artist_name, presence: true
end
