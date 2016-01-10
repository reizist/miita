class Article < ActiveRecord::Base
  searchkick

  has_paper_trail

  belongs_to :user
  has_many :article_tags

  validates :title, presence: true
  scope :feed, -> { order('created_at desc') }
end
