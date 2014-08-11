# voog.rb

[ ![Codeship Status for Edicy/voog.rb](https://www.codeship.io/projects/785ef4c0-0388-0132-4cf0-0e105ab6f59d/status)](https://www.codeship.io/projects/30460)

Ruby toolkit for the [Voog](http://www.voog.com) API.

Learn more at the [Voog developer central](http://www.voog.com/developers/api) and by reading the [Voog API documentation](http://www.voog.com/developers/api).

## Getting started

Either add this line to your application's `Gemfile`:

```
gem 'voog_api'
```

And then execute:

```
$ bundle
```

Or install it yourself as:

```
$ gem install voog_api
```

## API token

To generate your personal **API token** for your site, go to `Account` -> `My profile` and click on "Generate new API token".

## Initializing the client

All requests to the Voog API are done through the `Voog::Client` class, which takes two parameters: site host and API token.

```ruby
client = Voog::Client.new('example.com', 'afcf30182aecfc8155d390d7d4552d14')
```

Making an API request is as simple as calling a single method on the client:

```ruby
client.layouts
```

Most responses from the client are `Response` objects that provide access to the API resource objects by using both dot and hash notation:

```ruby
layout = client.layout(1)

puts layout.title
# => "Front page"

puts layout[:title]
# => "Front page"
```
