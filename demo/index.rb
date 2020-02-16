require 'sinatra'

require_relative '../lib/scarf'

get '/' do
  @avatars = {
    round:  Scarf::InitialAvatar.new('Hello World').svg,
    square: Scarf::InitialAvatar.new(
      'Jane Doe',
      font_family: ['Source Sans Pro'],
      background_shape: :square
    ).svg,
    identicon: Scarf::Identicon.new('sample').to_blob
  }

  erb :index
end