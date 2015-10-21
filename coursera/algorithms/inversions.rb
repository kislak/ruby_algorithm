# Coursera Standford Algorighms part 1 first week.

# Task: Count number of inversions
# Exp: array - [1,3,5,2,4,6]; inversions: [52, 54, 32]
# implementation taken from https://gist.github.com/dvorobiov/2038996

ar = []

File.readlines('IntegerArray.txt').each do |string|
 ar << string.to_i
end

def sort_and_count(arr)
	return [0, arr] if arr.length <= 1

  mid = arr.length / 2  
  left_arr = arr[0..(mid - 1)] 
  right_arr = arr[mid..(arr.length - 1)]
  
  left_result = sort_and_count(left_arr)
  right_result = sort_and_count(right_arr)
	merge_result = merge_and_count(left_result[1], right_result[1])

  [left_result[0] + right_result[0] + merge_result[0], merge_result[1]]
end

def merge_and_count(left_arr, right_arr)
  inversions = 0
  output = []
  i,j = 0,0
  while i < left_arr.length and j < right_arr.length
    if left_arr[i] < right_arr[j]
      output << left_arr[i]
      i+=1
    else
      output << right_arr[j]
      j+=1
      inversions += left_arr.length - i
    end
  end

  if i < left_arr.length
    output += left_arr[i..(left_arr.length - 1)]
  else
    output += right_arr[j..(right_arr.length - 1)]
  end

  return [inversions, output]
end

puts ar.size
result = sort_and_count ar
puts "number of inverstions: " + result[0].to_s
