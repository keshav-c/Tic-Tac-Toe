# Tic-Tac-Toe Game

## What is Tic-tac-toe?

Tic-tac-toe is a pen and paper game of two players, where each player takes turns in marking the spaces in a 3 X 3 grid. If a player succeeds in placing three of their marks in a horizontal, or vertical or diagonal direction along the grid, they win.

## Rules of the game:

- Either of the player can chose a symbol. "X" or "O" are commonly used.
- The players take turns to mark spaces on the grid.
- The players are not allowed to overwrite older marks.
- If a player marks a complete row, column or diagonal, they win.
- The game ends in a tie, if there is no space left on the grid, without anyone having won.

## Running the tests

From the project root directory, run

    rspec

or

    rspec --format doc

## Instructions to run the program

- Have ruby installed on your machine,

    `cd bin`

    `ruby main.rb`

### Dependencies

- lib/board.rb
- lib/player.rb
