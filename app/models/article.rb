class Article < ActiveRecord::Base
  has_paper_trail

  belongs_to :user

  validates :title, presence: true
end
