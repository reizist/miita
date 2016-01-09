require 'yaml'
require 'ostruct'
class MiitaImporter
  DATA_DIR = "#{Rails.root}/data"
  META_DIR = "#{DATA_DIR}/meta"
  POSTS_DIR = "#{DATA_DIR}/posts"

  def import
    Dir.glob("#{META_DIR}/*.yml").each do |file|
      post_id = File.basename(file, '.yml')
      meta_object = expand(YAML.load_file(file), post_id)
      save_record(meta_object)
    end
  end

  private

  def expand(meta_file, id)
    yml = meta_file[id]
    user, title, tags = yml["user"] , yml["title"], yml["tags"]
    body = File.open("#{POSTS_DIR}/#{id}.md").read
    OpenStruct.new(post_id: id, user: user, title: title, tags: tags, body: body)
  end

  def save_record(meta_object)
    ActiveRecord::Base.transaction do
      user = User.find_or_create_by(screen_name: meta_object.user)
      tags = meta_object.tags.map do |tag|
        Tag.find_or_create_by(name: tag)
      end
      article = Article.find_or_create_by(post_id: meta_object.post_id)
      article.update(
        user: user,
        title: meta_object.title,
        content: meta_object.body
      )
      tags.each {|tag| ArticleTag.find_or_create_by(article: article, tag: tag) }
    end
  end
end