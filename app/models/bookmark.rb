class Bookmark < ApplicationRecord
  belongs_to :list
  belongs_to :movie
  validates :comment, length: { minimum: 6 }
  validates :list,  uniqueness: { scope: :movie, message: 'cannot appear in same list more than once'}
end
