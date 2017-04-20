# Scarf

![sample](http://harigopal.github.io/scarf/sample.png)

[![Build Status](https://travis-ci.org/harigopal/scarf.svg?branch=master)](https://travis-ci.org/harigopal/scarf)
[![Code Climate](https://codeclimate.com/github/harigopal/scarf/badges/gpa.svg)](https://codeclimate.com/github/harigopal/scarf)

A Ruby library for generating initial avatars and identicons.

Identicon: http://en.wikipedia.org/wiki/Identicon

This library was forked from [swdyh/quilt](https://github.com/swdyh/quilt), trimmed, updated, and then expanded upon.

## Installation

Add to Gemfile:

```ruby
gem 'scarf', '~> 0.2'
```

## Initial Avatar

```ruby
# Output: Raw SVG
initial_avatar = Scarf::InitialAvatar.new('Hello World')
initial_avatar.svg

# Customize the font - defaults to sans-serif
Scarf::InitialAvatar.new('Jane Doe', font_family: ['Source Sans Pro']).svg
```

## Identicon

```ruby
# Input: any string
# Output: SVG as file
identicon = Scarf::Identicon.new 'sample'
identicon.write 'sample.svg'

# Input: Identicon code (32 bit integer)
identicon = Scarf::Identicon.new 1, type: :code
identicon.write 'sample.svg'

# Input: IP address
identicon = Scarf::Identicon.new '100.100.100.100', type: :ip
identicon.write 'sample_ip.svg'

# Output: Raw SVG
identicon = Scarf::Identicon.new 'sample'
print identicon.to_blob

# Set custom foreground color
identicon = Scarf::Identicon.new 'sample', color: 'red'
identicon.write 'sample_red.svg'
```

## TODO

- Add a configure block to set default value for `font_family`

## Updates

See `CHANGELOG.md`
