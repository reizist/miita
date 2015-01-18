module ApplicationHelper
  def diff(old_str, new_str, options = {})
    Diffy::Diff.new(old_str, new_str, options)
  end

  def markdown(content)
    GitHub::Markdown::render(content).html_safe
  end

  # タイトルの終端が'.md'で終わってたらmarkdownとしてrender
  def markdown?(title)
    /^*\.md$/ === title
  end
end
