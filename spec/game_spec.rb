# encoding: utf-8
# Тестовый сценарий для класса Game

# подключаю библиотеку RSpec
require 'rspec'
# подключаю game
require_relative '../lib/game.rb'

describe 'Game' do

  # тест должен вернуть выиграшь
  it 'return win' do

    # создаю экземпляр класса со словом 'лол'
    game = Game.new("лол")

    # эмитирую победу :)
    game.make_next_step("л")
    game.make_next_step("о")

    expect(game.status).to eq 1
    #easy

  end

  # тест должен вернуть поражение
  it 'return defeat' do

    # создаю экземпляр класса со словом 'лол'
    game = Game.new("лол")

    # эмитирую поражение :(
    game.make_next_step("г")
    game.make_next_step("е")
    game.make_next_step("к")
    game.make_next_step("а")
    game.make_next_step("р")
    game.make_next_step("и")
    game.make_next_step("м")

    expect(game.status).to eq -1

  end
end