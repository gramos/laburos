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

def each_hiring_post(thread)
  thread.fetch("kids", []).each do |id|
    post = fetch_json("item/#{id}")
    next if post.nil? || post["deleted"] || post["dead"]
    next unless post["type"] == "comment"

    yield post
  end
end

def candidate_post?(post)
  text = post.fetch("text", "").to_s.downcase
  terms = ["ruby", "rails", "backend", "software engineer",
           "product engineer", "platform engineer",
           "founding engineer", "infrastructure engineer"]

  terms.any? { |term| text.include?(term) }
end

def main
  thread = latest_hiring_thread
  abort "No Who is hiring? thread found." unless thread

  puts thread.fetch("title")
  puts "https://news.ycombinator.com/item?id=#{thread.fetch('id')}"
  each_hiring_post(thread) do |post|
    next unless candidate_post?(post)

    puts
    puts "https://news.ycombinator.com/item?id=#{post.fetch('id')}"
    puts post.fetch("text", "")
  end
rescue SocketError, SystemCallError, Timeout::Error, OpenSSL::SSL::SSLError,
       Net::HTTPExceptions, JSON::ParserError => error
  abort "Could not fetch the hiring thread: #{error.message}"
end

main if __FILE__ == $PROGRAM_NAME
