module ApplicationHelper
  class HTMLwithCoderay < Redcarpet::Render::HTML
    def block_code(code, language)
      case language.to_s
      when 'rb'
        lang = 'ruby'
      when 'yml'
        lang = 'yaml'
      when ''
        # 空欄のままだと「Invalid id given:」エラー
        lang = 'md'
      else
        lang = language
      end

      CodeRay.scan(code, lang).div
    end
  end

  def diff(old_str, new_str, options = {})
    Diffy::Diff.new(old_str, new_str, options)
  end

  def markdown(content)
    html_render = HTMLwithCoderay.new(filter_html: true, hard_wrap: true)
    options = {
      autolink: true,
      space_after_headers: true,
      fenced_code_blocks: true,
      strikethrough: true,
      lax_spacing: true,
      tables: true,
      disable_indented_code_blocks: true,
      hard_wrap: true,
      no_intra_emphasis: true,
    }
    markdown = Redcarpet::Markdown.new(html_render, options)
    markdown.render(content).html_safe
  end

  # タイトルの終端が'.md'で終わってたらmarkdownとしてrender
  def markdown?(title)
    /^*\.md$/ === title
  end
end
