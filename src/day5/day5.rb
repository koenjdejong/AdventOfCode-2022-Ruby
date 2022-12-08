def main
  input = File.read('src/day5/input.txt').split("\n")
  puts "Part 1: #{part1(input)}"
  puts "Part 2: #{part2(input)}"
end

def part1(input)
  stacks = []
  # Parsing crates
  (0..7).each { |lineIndex|
    line = input[7 - lineIndex]
    (0..8).each { |crateIndex|
      crate = line[crateIndex * 4 + 1]
      if crate && crate != " "
        stacks[crateIndex] = if stacks[crateIndex] then stacks[crateIndex].append(crate) else [crate] end
      end
    }
  }
  # Moving crates
  (10..input.length - 1).each do |index|
    split = input[index].split(' ')
    amount, from, to = split[1].to_i, split[3].to_i-1, split[5].to_i-1
    throw :stacks if amount > stacks[from].length
    stacks[to].concat(stacks[from].reverse.slice(0, amount))
    stacks[from] = stacks[from].slice(0, stacks[from].length-amount)
  end

  stacks.map{|stack| stack.last}.join
end

def part2(input)
  stacks = []
  # Parsing crates
  (0..7).each { |lineIndex|
    line = input[7 - lineIndex]
    (0..8).each { |crateIndex|
      crate = line[crateIndex * 4 + 1]
      if crate && crate != " "
        stacks[crateIndex] = if stacks[crateIndex] then stacks[crateIndex].append(crate) else [crate] end
      end
    }
  }
  # Moving crates
  (10..input.length - 1).each do |index|
    split = input[index].split(' ')
    amount, from, to = split[1].to_i, split[3].to_i-1, split[5].to_i-1
    throw :"Amount is greater than stack length" if amount > stacks[from].length
    stacks[to].concat(stacks[from].slice(stacks[from].length - amount, stacks[from].length))
    stacks[from] = stacks[from].slice(0, stacks[from].length - amount)
  end

  stacks.map{|stack| stack.last}.join
end

main
