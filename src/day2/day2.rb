def main
  input = File.read('src/day2/input.txt').split("\n")
  puts "Part 1: #{part1(input)}"
  puts "Part 2: #{part2(input)}"
end

def part1(input)
  # take a good look at what you play
  scores = {
    "A X" => 1 + 3,
    "A Y" => 2 + 6,
    "A Z" => 3 + 0,
    "B X" => 1 + 0,
    "B Y" => 2 + 3,
    "B Z" => 3 + 6,
    "C X" => 1 + 6,
    "C Y" => 2 + 0,
    "C Z" => 3 + 3,
  }
  score = 0
  input.each { |line|
    score += scores[line]
  }
  score
end

def part2(input)
  scores = { # Rock, Paper, Scissors
    "A X" => 3 + 0,
    "A Y" => 1 + 3,
    "A Z" => 2 + 6,
    "B X" => 1 + 0,
    "B Y" => 2 + 3,
    "B Z" => 3 + 6,
    "C X" => 2 + 0,
    "C Y" => 3 + 3,
    "C Z" => 1 + 6,
  }
  score = 0
  input.each { |line|
    score += scores[line]
  }
  score
end

main