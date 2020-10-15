# frozen_string_literal: true

require 'rock_paper_scissors/version'

# Basic module for the game
module RockPaperScissors
  class Error < StandardError; end

  def self.start_game # rubocop:disable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/MethodLength, Metrics/PerceivedComplexity
    options = %w[rock paper scissors]

    puts 'Please choose one of those: rock, paper, scissors'
    choosen_by_user = gets.chomp
    raise TypeError, 'You do not have choosen one of those above; game is over!' unless options.include? choosen_by_user

    choosen_by_machine = options.sample

    if choosen_by_user == choosen_by_machine
      puts 'The machine has choosen the same thing; scoreless!'
    else
      choosen_options = [choosen_by_user, choosen_by_machine]

      user_won = false

      case choosen_options.sort
      when %w[paper rock]
        puts 'Paper wraps rock!'
        user_won = true if choosen_by_user == 'paper'
      when %w[rock scissors]
        puts 'Rock breaks scissors!'
        user_won = true if choosen_by_user == 'rock'
      when %w[scissors paper]
        puts 'Scissors cuts paper!'
        user_won = true if choosen_by_user == 'scissors'
      end

      if user_won
        puts 'You win!'
      else # user_won == false
        puts 'The machine win!'
      end
    end
  end
end
