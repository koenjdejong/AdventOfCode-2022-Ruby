def main
  input = File.read('src/day4/input.txt').split("\n")
  puts "Part 1: #{part1(input)}"
  puts "Part 2: #{part2(input)}"
end

def get_upper_and_lower(line)
  return line.split('-')[0].to_i, line.split('-')[1].to_i
end

def part1(input)
  amount = 0
  input.each do |line|
    lower1, upper1 = get_upper_and_lower(line.split(',')[0])
    lower2, upper2 = get_upper_and_lower(line.split(',')[1])
    # puts "#{lower1},#{upper1},#{lower2},#{upper2},"
    if (lower1 <= lower2 and upper1 >= upper2) or (lower2 <= lower1 and upper2 >= upper1)
      amount += 1
    end
  end
  amount
end

def part2(input)
  amount = 0
  input.each do |line|
    lower1, upper1 = get_upper_and_lower(line.split(',')[0])
    lower2, upper2 = get_upper_and_lower(line.split(',')[1])
    # puts "#{lower1},#{upper1},#{lower2},#{upper2},"
    if [lower1, lower2].max <= [upper1, upper2].min
      amount += 1
    end
  end
  amount
end

main

