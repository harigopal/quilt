# quilt

![sample02](http://swdyh.github.io/quilt/sample/quilt-02.png) ![sample03](http://swdyh.github.io/quilt/sample/quilt-03.png) ![sample04](http://swdyh.github.io/quilt/sample/quilt-04.png) ![sample05](http://swdyh.github.io/quilt/sample/quilt-05.png)

[![Build Status](https://travis-ci.org/harigopal/quilt.png?branch=master)](https://travis-ci.org/harigopal/quilt)

A Ruby library for generating identicons.

Identicon: http://en.wikipedia.org/wiki/Identicon

## Updates

See `CHANGELOG.md`

## Installation

    gem install quilt

## Example

```ruby
# input: any string
# output: 15 * 15 png (default)
identicon = Quilt::Identicon.new 'sample'
identicon.write 'sample.svg'

# input: identicon code (32 bit integer)
identicon = Quilt::Identicon.new 1, type: :code
identicon.write 'sample.svg'

# input: ip address
identicon = Quilt::Identicon.new '100.100.100.100', type: :ip
identicon.write 'sample_ip.svg'

# output: blob
identicon = Quilt::Identicon.new 'sample'
print identicon.to_blob

# output: tranparent background
identicon = Quilt::Identicon.new 'sample', transparent: true
identicon.write 'sample_transparent.svg'
```
