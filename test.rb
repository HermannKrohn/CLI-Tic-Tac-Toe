# while user_input = Integer(gets.chomp) rescue ''
#     if user_input.is_a? Integer
#       puts "your number is #{user_input}"
#       break
#     else
#       print "Think of a number "
#     end
# end

require 'pry'

def get_row_col
    output_array = []
    row_number = ""
    col_number = ""    
    loop do
        puts "Please enter a row (0-2 or 'exit' to terminate game)"
        row_number = gets.chomp
        break if row_number == "exit"
        puts "Please enter a column (0-2 or 'exit' to terminate game)"
        col_number = gets.chomp
        break if col_number == "exit"
        row_number = Integer(row_number) rescue (-1)
        col_number = Integer(col_number) rescue (-1)
        break if((row_number >= 0 && row_number <= 2) && (col_number >= 0 && col_number <= 2))
        puts "You have inputed either an invalid row or column. Please try again"
    end
    output_array << row_number
    output_array << col_number
    output_array
end 

get_row_col