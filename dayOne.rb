input = File.new("dayOneFirstInput.txt", "r")

list1 = []
list2 = []

if input
  while !input.eof do 
    line = input.readline()
    if line == input.eof
      break
    end
    numbers = line.split
    list1.append(Integer(numbers[0]))
    list2.append(Integer(numbers[1]))
  end
end

list1 = list1.sort
list2 = list2.sort

totalDistance = 0

index = 0
for num in list1 do
  diff = list2[index] - num
  if diff < 0 
    diff = diff * -1
  end
  totalDistance += diff
  index += 1
end

puts("Part 1\nTotal Distance: #{totalDistance}")

totalDistance = 0

for num in list1 do
  numCounter = 0
  for num2 in list2 do
    if num == num2
      numCounter += 1
    end
  end
  totalDistance += num * numCounter
end

puts("Part 2\nTotal Distance: #{totalDistance}")