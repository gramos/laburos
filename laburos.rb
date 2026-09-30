require "json"
require "openssl"
require "net/http"

def fetch_json(path)
  uri = URI("https://hacker-news.firebaseio.com/v0/#{path}.json")
  response = Net::HTTP.start(uri.host, uri.port, use_ssl: true,
                            open_timeout: 10, read_timeout: 20) do |http|
    http.get(uri.request_uri)
  end

  response.value
  JSON.parse(response.body)
end

def latest_hiring_thread
  user = fetch_json("user/whoishiring")

  # HN assigns increasing IDs; inspect the newest submissions first.
  user.fetch("submitted").sort.reverse_each do |id|
    item = fetch_json("item/#{id}")
    next if item.nil? || item["deleted"] || item["dead"]
    next unless item["type"] == "story"
    next unless item["title"].to_s.start_with?("Ask HN: Who is hiring? (")

    return item
  end

  nil
end

if __FILE__ == $PROGRAM_NAME
  begin
    thread = latest_hiring_thread
    abort "No Who is hiring? thread found." unless thread

    puts thread.fetch("title")
    puts "https://news.ycombinator.com/item?id=#{thread.fetch('id')}"
  rescue SocketError, SystemCallError, Timeout::Error, OpenSSL::SSL::SSLError,
         Net::HTTPExceptions, JSON::ParserError => error
    abort "Could not fetch the hiring thread: #{error.message}"
  end
end
