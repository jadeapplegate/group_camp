module ApplicationHelper

#removes strange character combinations from strings returned by API call and replaces with the correct punctuation
  def scrub(string)
    string.gsub(/&amp;#39;|&apos;|&amp;|quot;/, "\'") if string
  end
  
end