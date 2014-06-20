require 'rspotify/version'

require 'json'
require 'restclient'

module RSpotify

  API_URI   = 'https://api.spotify.com/v1/'
  TOKEN_URI = 'https://accounts.spotify.com/api/token'
  VERBS     = %w(get post put delete)

  autoload :Base,   'rspotify/base'
  autoload :Artist, 'rspotify/artist'
  autoload :Album,  'rspotify/album'
  autoload :Track,  'rspotify/track'
  autoload :User,   'rspotify/user'

  VERBS.each do |verb|
    define_singleton_method verb do |path, *params|
      url = API_URI + path
      response = RestClient.send(verb, url, *params)
      JSON.parse response
    end
  end
end
