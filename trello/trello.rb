require 'dotenv'
dotenv_path = File.expand_path(File.join(File.dirname(__FILE__), '.env'))
Dotenv.load(dotenv_path)
require 'trello'

Trello.configure do |config|
  config.developer_public_key = ENV['TRELLO_PUBLIC_KEY']
  config.member_token = ENV['TRELLO_MEMBER_TOKEN']
end

boards = Trello::Board.all
board = boards.first
list = board.lists.first
cards = list.cards
card = cards.first
puts card.inspect
puts card.checklists.first.check_items.collect { |item| item['name'] }
puts cards.map(&:name).inspect

