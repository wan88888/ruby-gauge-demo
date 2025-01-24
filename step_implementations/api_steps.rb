require 'test/unit'
require 'httparty'
include Test::Unit::Assertions

BASE_URL = 'https://jsonplaceholder.typicode.com'

step 'Send GET request to <endpoint>' do |endpoint|
  @response = HTTParty.get(BASE_URL + endpoint)
  @response_body = JSON.parse(@response.body)
end

step 'Response status code should be <status_code>' do |status_code|
  assert_equal(status_code.to_i, @response.code)
end

step 'Response should contain multiple posts' do
  assert(@response_body.is_a?(Array), 'Response should be an array of posts')
  assert(@response_body.length > 0, 'Response should contain at least one post')
end

step 'Create a new post with title <title> and body <body>' do |title, body|
  payload = {
    title: title,
    body: body,
    userId: 1
  }
  @response = HTTParty.post(
    BASE_URL + '/posts',
    body: payload.to_json,
    headers: { 'Content-Type' => 'application/json' }
  )
  @response_body = JSON.parse(@response.body)
end

step 'Response should contain the created post' do
  assert_equal(String, @response_body['title'].class)
  assert_equal(String, @response_body['body'].class)
  assert_equal(Integer, @response_body['id'].class)
  assert_equal(Integer, @response_body['userId'].class)
end

step 'Response should contain user with id <user_id>' do |user_id|
  assert_equal(user_id.to_i, @response_body['id'])
  assert_equal(String, @response_body['name'].class)
  assert_equal(String, @response_body['email'].class)
end

step 'Response should contain comments for post <post_id>' do |post_id|
  assert(@response_body.is_a?(Array), 'Response should be an array of comments')
  assert(@response_body.length > 0, 'Response should contain at least one comment')
  @response_body.each do |comment|
    assert_equal(post_id.to_i, comment['postId'])
  end
end