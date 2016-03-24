# encoding: utf-8
# Тестовый сценарий для класса Game

# подключаю библиотеку RSpec
require 'rspec'
# подключаю game
require '../game.rb'

describe 'Game' do

  # тест должен вернуть выиграшь
  it 'return win' do

    # создаю экземпляр класса со словом 'лол'
    game = Game.new("лол")

    # эмитирую победу :)
    game.next_step("л")
    game.next_step("о")

    expect(game.status).to eq 1
    #easy

  end

  # тест должен вернуть поражение
  it 'return defeat' do

    # создаю экземпляр класса со словом 'лол'
    game = Game.new("лол")

    # эмитирую поражение :(
    game.next_step("г")
    game.next_step("е")
    game.next_step("к")
    game.next_step("а")
    game.next_step("р")
    game.next_step("и")
    game.next_step("м")

    expect(game.status).to eq -1

  end
end