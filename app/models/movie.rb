class Movie < ApplicationRecord
  has_many :bookmarks
  # dependent: :restrict_with_exception
  validates :title, uniqueness: true, presence: true
  validates :overview, presence: true
  # before_destroy :check_for_booksmarks


  # private

  # def check_for_booksmarks
  #   if Bookmark.where(:movie_id).count.positive?
  #     errors.add_to_base("cannot delete customer while orders exist")
  #     return false
  #   end
  # end
end
