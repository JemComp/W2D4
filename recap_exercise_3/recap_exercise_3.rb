require "byebug"

def no_dupes?(arr)
    counter = Hash.new {0}

    arr.each do |el|
        counter[el] += 1
    end

    arr.reject { |el| counter[el] > 1}
end

def no_consecutive_repeats?(arr)
    (1...arr.length).each do |i|
        return false if arr[i-1] == arr[i]
    end
    true
end

def char_indices(str)
    char_hash = Hash.new {|k,v| k[v] = []}

    (0...str.length).each do |i|
        char_hash[str[i]] << i

    end
    char_hash
end

def longest_streak(str)
    streak = false
    startindx = 0
    backindx = 0
    max = (0...1)

    (1...str.length).each do |i|
        if str[i] == str[i-1]
            if streak == false
                streak = true
                start = i-1
            else
                backindx = i
                max = (startindx...backindx).size > max ? (startindx...backindx) : max
            end
        else
            streak = false
        end
    end
    str[max]
end

p longest_streak('a')           # => 'a'
p longest_streak('accccbbb')    # => 'cccc'
p longest_streak('aaaxyyyyyzz') # => 'yyyyy
p longest_streak('aaabbb')      # => 'bbb'
p longest_streak('abc')         # => 'c'
                

