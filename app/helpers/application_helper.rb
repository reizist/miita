module ApplicationHelper
  def diff(old_str, new_str, options = {})
    Diffy::Diff.new(old_str, new_str, options)
  end
end
