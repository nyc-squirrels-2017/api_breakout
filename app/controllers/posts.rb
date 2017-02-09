get '/' do
  root = 'https://jsonplaceholder.typicode.com' #Note: ideally this would be put into an environment variable
  target = root + '/posts'
  response = Net::HTTP.get(URI(target))
  parsed_response = JSON.parse(response)
  @posts = parsed_response.map do |post_hash|
    Post.create(title: post_hash['title'], body: post_hash['body'])
  end
  erb :'posts/index'
end