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
    {"id" => 20, "type" => "story", "title" => "Ask HN: Who is hiring? (September 2026)"}
  elsif path == "item/10"
    {"id" => 10, "type" => "story", "title" => "Ask HN: Who is hiring? (August 2026)"}
  else
    raise "Unexpected request: #{path}"
  end
end

thread = latest_hiring_thread
puts thread.fetch("title")
puts thread.fetch("id")
