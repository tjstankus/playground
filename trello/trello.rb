require 'dotenv'
dotenv_path = File.expand_path(File.join(File.dirname(__FILE__), '.env'))
Dotenv.load(dotenv_path)
require 'trello'
require 'json'

Trello.configure do |config|
  config.developer_public_key = ENV['TRELLO_PUBLIC_KEY']
  config.member_token = ENV['TRELLO_MEMBER_TOKEN']
end

boards = Trello::Board.all
board = boards.first
# puts board.inspect
# puts board.client.inspect
client = board.client
boards_data = client.get("/members/#{Trello::Member.find(:me).username}/boards") #.json_into(self)
parsed_boards_data = JSON.parse(boards_data)
starred_boards_data = parsed_boards_data.select { |data| data['starred'] }
puts starred_boards_data.inspect

# board = Trello::Board.new(parsed.first)
# puts board.inspect
# board = Trello::Board.new(data.first)
# puts board.inspect

# list = board.lists.first
# cards = list.cards
# card = cards.first
# puts card.inspect
# puts card.checklists.first.check_items.collect { |item| item['name'] }
# puts cards.map(&:name).inspect

# require 'sequel'
#
# DB = Sequel.sqlite # memory database
#
# DB.create_table :activities do
#   primary_key :id
#   String :title
#   String :description
# end
#
# activities = DB[:activities]
#
# activities.insert(title: 'Read Sequel README')
# activities.insert(title: 'Go to sleep')
#
# puts "Activities count: #{activities.count}"
# puts "Activity ids: #{activities.map(:id)}"
