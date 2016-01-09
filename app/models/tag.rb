class Tag < ActiveRecord::Base
  has_many :article_tags
end
