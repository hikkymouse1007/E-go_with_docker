# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


news_api_key = ENV["NEWS_API_KEY_ID"]
uri1 = URI.parse("https://newsapi.org/v2/sources?language=en&apiKey=#{news_api_key}")#外部英語ニュースサイト
json1= Net::HTTP.get(uri1)
publishers_to_rb = JSON.parse(json1)
publishers = publishers_to_rb["sources"]#@momentsで配列の情報が入ってます
publishers.each do |data|
  Publisher.create(source_id: data['id'],name: data['name'], description: data['description'], name:data['name'], url:data['url'], language:data['language'], country:data['country'],category:data['category'])
end

https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=2c32beda77524c168e9783edbe14b277

# uri2 = URI.parse('https://newsapi.org/v2/top-headlines?country=us&apiKey=2c32beda77524c168e9783edbe14b277')#ヘッドラインニュース
# json2= Net::HTTP.get(uri2)
# moments2 = JSON.parse(json2)
# @moments2 = moments2["articles"]#@momentsで配列の情報が入ってます