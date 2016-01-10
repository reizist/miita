class User < ActiveRecord::Base
  has_many :articles, inverse_of: :user

  validates :screen_name, presence: true

  after_destroy do
    Article.where(user: self).delete_all
  end
end
