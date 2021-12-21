# Scarf

![sample](http://blog.harigopal.in/scarf/sample.png)

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

## Demo

Check out the Sinatra app in the `/demo` folder to see the gem in action.

## Initial Avatar

```ruby
# Output: Raw SVG
initial_avatar = Scarf::InitialAvatar.new('Hello World')
initial_avatar.svg

# Customize the font family - defaults to sans-serif, and the background shape - defaults to :circle.
Scarf::InitialAvatar.new(
  'Jane Doe',
  font_family: ['Source Sans Pro'],
  background_shape: :square
).svg

# Configure at class level.
Scarf.configure do |config|
  config.font_family = ['Times New Roman', 'sans-serif']
  config.font_weight = 'normal'
  config.font_size = '64'
  config.background_shape = :square
  config.background_colors = ['#000000', '#999999']
end
```

### Options
| Name                | Type   | Default                  | Description                                                                                            |
| :------------------ | :----- | :----------------------- | :----------------------------------------------------------------------------------------------------- |
| `font_family`       | Array  | `['sans-serif']`         | A list of font families.                                                                                |
| `font_weight`       | String | `normal`                 | Uses [SVG font-weight](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/font-weight) values. |
| `font_size`         | String | `42`                     | Uses [CSS font-size](https://developer.mozilla.org/en-US/docs/Web/CSS/font-size#values) values.        |
| `background_shape`  | Symbol | `:circle`                | Shape of the background (`:circle` or `:square`.)                                                      |
| `background_colors` | Array  | `['#444444', '#dedede']` | A list of hex color codes.                                                                             |

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

## Updates

See `CHANGELOG.md`
