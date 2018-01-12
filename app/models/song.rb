class Song < ActiveRecord::Base
  validates :title, presence: true

  validates :title, uniqueness: {
    scope: [:release_year, :artist_name],
    message: "cannot be repeated by the same artist in the same year"
  }

  validates :released, inclusion: { in: [true, false]}

  validates :release_year, presence: true, if: :released
  validates :release_year, length: { maximum: Date.current.year }

  validates :artist_name, presence: true
end
