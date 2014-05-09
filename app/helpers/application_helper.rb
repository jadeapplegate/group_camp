module ApplicationHelper

  def scrub(string)
    string.gsub(/&amp;#39;|&apos;|&amp;|quot;/, "\'") if string
  end
end