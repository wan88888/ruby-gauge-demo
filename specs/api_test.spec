# JSONPlaceholder API Tests

This specification contains tests for JSONPlaceholder API endpoints.

## Get Posts
tags: api, posts

* Send GET request to "/posts"
* Response status code should be "200"
* Response should contain multiple posts

## Create Post
tags: api, posts

* Create a new post with title "Test Post" and body "This is a test post"
* Response status code should be "201"
* Response should contain the created post

## Get User
tags: api, users

* Send GET request to "/users/1"
* Response status code should be "200"
* Response should contain user with id "1"

## Get Comments
tags: api, comments

* Send GET request to "/posts/1/comments"
* Response status code should be "200"
* Response should contain comments for post "1"