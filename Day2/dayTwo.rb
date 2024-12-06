def main
  input = File.new(Dir.pwd + "/Day2/dayTwoInput.txt", "r")

  correctReportsCounter = 0
  
  reports = []
  
  if input
    while !input.eof do
      line = input.readline()
  
      numbers = line.split().map(&:to_i)
      
      reports.append(numbers)
    end
  end
  
  for report in reports do 
    correctReportsCounter += reportChecker(report)
  end
  
  puts("Part 1\nThere are #{correctReportsCounter} correct Levels in the report.")
  
  correctReportsCounter = 0

  for report in reports do 
    reportResult = reportChecker(report)
    if reportResult == 1
      correctReportsCounter += reportResult
    else
      correctReportsCounter += problemDampener(report)
    end
  end
  
  puts("Part 2\nThere are #{correctReportsCounter} correct Levels in the report.")
end

def reportChecker(array)
  firstReport = array
  
  reportSize = firstReport.length() - 1

  firstLevel = firstReport[0]
  initialDiff = firstReport[1] - firstLevel

  levelCheckCounter = 0
  for index in 1..reportSize do
    nextLevelDiff = firstReport[index] - firstLevel

    if nextLevelDiff == 0
      break
    elsif nextLevelDiff > 0 && nextLevelDiff < 4
      if initialDiff < 0
        break
      end
    elsif nextLevelDiff < 0 && nextLevelDiff > -4
      if initialDiff > 0
        break
      end
    else
      break
    end

    firstLevel = firstReport[index]
    levelCheckCounter += 1
  end

  if levelCheckCounter == reportSize
    return 1
  else
    return 0
  end
end

def problemDampener(array)
  initialReport = array

  reportSize = initialReport.length() - 1

  result = 0
  for index in 0..reportSize do
    newArray = initialReport[...index] + initialReport[(index+1)...]
    result = reportChecker(newArray)
    if result == 1
      break
    end
  end

  return result
end

main