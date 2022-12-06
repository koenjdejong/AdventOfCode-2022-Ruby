def main
  input = File.read('src/day3/input.txt').split("\n")
  puts "Part 1: #{part1(input)}"
  puts "Part 2: #{part2(input)}"
end

require "set"


def part1(input)
  alphabet = %w[a b c d e f g h i j k l m n o p q r s t u v w x y z A B C D E F G H I J K L M N O P Q R S T U V W X Y Z]
  score = 0
  input.each { |line|
    first = line[0, line.length / 2].bytes.to_a
    second = line[line.length / 2, line.length - 1].bytes.to_a
    same = Set.new(first).intersection(Set.new(second))
    same.each { |elem|
      score += alphabet.find_index(elem.chr) + 1
    }
  }
  score
end

def part2(input)
  alphabet = %w[a b c d e f g h i j k l m n o p q r s t u v w x y z A B C D E F G H I J K L M N O P Q R S T U V W X Y Z]
  score = 0
  index = 1
  lines = []
  input.each { |line|
    lines.append(line)
    if index == 3
      same = Set.new(lines[0].bytes.to_a).intersection(Set.new(lines[1].bytes.to_a)).intersection(Set.new(lines[2].bytes.to_a))
      score += alphabet.find_index(same.first.chr) + 1
      index = 0
      lines = []
    end
    index += 1
  }
  score
end

main
