game_board = [["-", "-", "-"], ["-", "-", "-"], ["-", "-", "-"]]
turn_counter = 1

def print_board(array)
    i = 0
    while i < array.length
        sub_arr = array[i]
        j=0
        while j<sub_arr.length
            print "  " + array[i][j] + "  "
            j += 1
            if j == sub_arr.length
                puts ""
            end
        end
        i += 1
    end
end

def get_row_col
    outputArray = []
    row_number = ""
    col_number = ""
    loop do
        puts "Please enter a row"
        row_number = gets.chomp
        break if row_number == "exit"
        puts "Please enter a column"
        col_number = gets.chomp
        break if col_number == "exit"
        row_number = row_number.to_i
        col_number = col_number.to_i
        break if ((row_number >= 0 && row_number <= 2) && (col_number >= 0 && col_number <= 2)) #notify player that there row/col selection is invalid and need to reselect
    end
    outputArray << row_number
    outputArray << col_number
    outputArray
end

def check_winner(game_board, player_letter)
    winner_combinations = [
        [game_board[0][0], game_board[0][1], game_board[0][2]], [game_board[1][0], game_board[1][1], game_board[1][2]], [game_board[2][0], game_board[2][1], game_board[2][2]], #horizontal win conditions
        [game_board[0][0], game_board[1][0], game_board[2][0]], [game_board[0][1], game_board[1][1], game_board[2][1]], [game_board[0][2], game_board[1][2], game_board[2][2]], #vertical win conditions
        [game_board[0][0], game_board[1][1], game_board[2][2]], [game_board[2][0], game_board[1][1], game_board[0][2]] #diaginal win conditions
    ]
    winner_combinations.any? { |line| line.all? { |letter| letter == player_letter } }
end

puts "Welcome to Tic Tac Toe"
puts "Here is a visual of the initial game board"

print_board(game_board)

loop do 
    coordinates = get_row_col
    
    if (coordinates[0] == "exit" || coordinates[1] == "exit")
        break
    end

    if turn_counter % 2 == 0
        game_board[coordinates[0]][coordinates[1]] = "X"
        if(check_winner(game_board, "X"))
            puts "'X' player wins"
            break
        end
    else
        game_board[coordinates[0]][coordinates[1]] = "O"
        if(check_winner(game_board, "O"))
            puts "'O' player wins"
            break
        end
    end

    print_board(game_board)

    turn_counter += 1
end