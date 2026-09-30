require_relative "../laburos"

def fetch_json(path)
  if path == "user/whoishiring"
    {"submitted" => [10, 20, 22, 25, 30]}
  elsif path == "item/30"
    {"id" => 30, "type" => "story", "title" => "Ask HN: Who wants to be hired? (October 2026)"}
  elsif path == "item/25"
    {"id" => 25, "type" => "story", "title" => "Ask HN: Who is hiring? (October 2026)", "dead" => true}
  elsif path == "item/22"
    {"id" => 22, "type" => "story", "title" => "Ask HN: Who is hiring? (October 2026)", "deleted" => true}
  elsif path == "item/20"
    {"id" => 20, "type" => "story", "title" => "Ask HN: Who is hiring? (September 2026)", "kids" => [108, 106, 105, 104, 103, 102, 101]}
  elsif path == "item/10"
    {"id" => 10, "type" => "story", "title" => "Ask HN: Who is hiring? (August 2026)"}
  elsif path == "item/108"
    {"id" => 108, "type" => "comment", "text" => "Sales manager"}
  elsif path == "item/106"
    nil
  elsif path == "item/105"
    {"id" => 105, "type" => "comment", "text" => "Ruby on Rails engineer"}
  elsif path == "item/104"
    {"id" => 104, "type" => "comment", "text" => "Deleted job post", "deleted" => true}
  elsif path == "item/103"
    {"id" => 103, "type" => "comment", "text" => "Dead job post", "dead" => true}
  elsif path == "item/102"
    {"id" => 102, "type" => "story", "text" => "Not a comment"}
  elsif path == "item/101"
    {"id" => 101, "type" => "comment", "text" => "Senior Backend Engineer"}
  else
    raise "Unexpected request: #{path}"
  end
end

main
