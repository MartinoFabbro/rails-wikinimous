require 'faker'
require "open-uri"
require "json"
require "pry-byebug"
Article.destroy_all
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
 url = "https://hacker-news.firebaseio.com/v0/topstories.json?print=pretty"
 word_serialized = open(url).read
 word = JSON.parse(word_serialized)
 word.take(20).each do |url|
    url2 = "https://hacker-news.firebaseio.com/v0/item/#{url}.json?print=pretty"
    word_serialized2 = open(url2).read
    word2 = JSON.parse(word_serialized2)
        # binding.pry
    Article.create(title: word2["title"], content: word2["url"])
  end

# 10.times do
# Article.create(title: Faker::CryptoCoin.coin_name, content: Faker::ChuckNorris.fact)
# end
