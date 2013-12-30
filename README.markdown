# Edicy.rb

Ruby toolkit for the Edicy API.

## Getting started

Either add this line to your application's Gemfile:

    gem 'edicy_api'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install edicy_api

## Initializing client

All requests to Edicy API are done through `Edicy::Client` class, which takes two parameters, site host and API token:

```ruby
client = Edicy::Client.new('example.com', 'afcf30182aecfc8155d390d7d4552d14')
```

Making a request to API is just calling a method on client:

```ruby
client.layouts
```

Most responses from client are `Response` objects that provide access to objects by using dot and hash notation:

```ruby
layout = client.layout(1)

puts layout.title # => "Front page"
puts layout[:title] # => "Front page"
```
