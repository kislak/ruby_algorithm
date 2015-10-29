# Coursera Standford Algorighms part 1 first week.

input_ar = []

File.readlines('QuickSort.txt').each do |string|
  input_ar << string.to_i
end


@res = 0

def quicksort(array) #takes an array of integers as an argument
  return [] if array.empty?
  @res = @res + array.size - 1

  pivot = array[0]
  array.delete_at(array.index(pivot))

  less = []
  greater = []

  array.each do |x|
    x <= pivot ? less << x : greater << x
  end

  sorted_array = []
  sorted_array << quicksort(less)
  sorted_array << pivot
  sorted_array << quicksort(greater)

  sorted_array.flatten!
end

def quicksort2(array)
  return [] if array.empty?
  @res = @res + array.size - 1

  pivot = array[-1]
  array.delete_at(array.index(pivot))

  less = []
  greater = []

  array.each do |x|
    x <= pivot ? less << x : greater << x
  end

  sorted_array = []
  sorted_array << quicksort2(less)
  sorted_array << pivot
  sorted_array << quicksort2(greater)

  sorted_array.flatten!
end

def quicksort3(array) #takes an array of integers as an argument
  return [] if array.empty?
  @res = @res + array.size - 1

  middle_index = (array.size + 1) / 2 -1
  pivot = [array[0], array[-1], middle_index].sort[1]


  array.delete_at(array.index(pivot))

  less = []
  greater = []

  array.each do |x|
    x <= pivot ? less << x : greater << x
  end

  sorted_array = []
  sorted_array << quicksort3(less)
  sorted_array << pivot
  sorted_array << quicksort3WW(greater)

  sorted_array.flatten!
end

@input_ar

class QSort
  attr_accessor :ar, :res, :res2
  def initialize(ar)
    @ar = ar
    @res = 0
    @res2 = 0
  end

  def run
    quicksort_in_place(0, ar.size - 1)
    @ar
  end


  def quicksort_in_place(l, r)
    # puts "call #{l} #{r}"
    @res += r-l
    # return if r - l <= 1

    pivot = @ar[l]

    i = l + 1

    ((l + 1)..r).each do |j|
      @res2 += 1
      if @ar[j] < pivot

        if i != j
          x = @ar[i]
          @ar[i] = @ar[j]
          @ar[j] = x

          # puts "#{i} #{j} #{@ar[i]}, #{@ar[j]}"
          # puts @ar.to_s
        end

        i = i + 1
      end
    end

    @ar[l] = @ar[i-1]
    @ar[i-1] = pivot

    # puts @ar.to_s

    quicksort_in_place(l, i - 2) if (i - 2 - l) > 1
    quicksort_in_place(i, r) if r - i > 1
  end
end

class QSort2
  attr_accessor :ar, :res, :res2
  def initialize(ar)
    @ar = ar
    @res = 0
    @res2 = 0
  end

  def run
    quicksort_in_place(0, ar.size - 1)
    @ar
  end


  def quicksort_in_place(l, r)
    # puts "call #{l} #{r}"
    @res += r-l
    # return if r - l <= 1

    @ar[l], @ar[r] = @ar[r], @ar[l]
    pivot = @ar[l]


    i = l + 1

    ((l + 1)..r).each do |j|
      @res2 += 1
      if @ar[j] < pivot

        if i != j
          x = @ar[i]
          @ar[i] = @ar[j]
          @ar[j] = x

          # puts "#{i} #{j} #{@ar[i]}, #{@ar[j]}"
          # puts @ar.to_s
        end

        i = i + 1
      end
    end

    @ar[l] = @ar[i-1]
    @ar[i-1] = pivot

    # puts @ar.to_s

    quicksort_in_place(l, i - 2) if (i - 2 - l) > 1
    quicksort_in_place(i, r) if r - i > 1
  end
end

class QSort3
  attr_accessor :ar, :res, :res2
  def initialize(ar)
    @ar = ar
    @res = 0
    @res2 = 0
  end

  def run
    quicksort_in_place(0, ar.size - 1)
    @ar
  end


  def quicksort_in_place(l, r)
    # puts "call #{l} #{r}"
    @res += r-l
    # return if r - l <= 1


    middle_index = (r + l)/2
    middle = [@ar[l], @ar[r], @ar[middle_index]].sort[1]

    if middle == @ar[r]
      @ar[l], @ar[r] = @ar[r], @ar[l]
    end

    if middle == @ar[middle_index]
      @ar[l], @ar[middle_index] = @ar[middle_index], @ar[l]
    end

    # puts l
    # puts r
    # puts middle_index
    # puts [@ar[l], @ar[r], @ar[middle_index]].to_s
    # puts ar.to_s

    pivot = @ar[l]


    i = l + 1

    ((l + 1)..r).each do |j|
      @res2 += 1
      if @ar[j] < pivot

        if i != j
          x = @ar[i]
          @ar[i] = @ar[j]
          @ar[j] = x

          # puts "#{i} #{j} #{@ar[i]}, #{@ar[j]}"
          # puts @ar.to_s
        end

        i = i + 1
      end
    end

    @ar[l] = @ar[i-1]
    @ar[i-1] = pivot

    # puts @ar.to_s

    quicksort_in_place(l, i - 2) if (i - 2 - l) > 1
    quicksort_in_place(i, r) if r - i > 1
  end
end



ar = [3,8,2,5,1,4,7,6]
# @res = 0

a = QSort.new(input_ar.clone)
a.run
puts a.res
puts a.res2
# puts a.ar


a = QSort2.new(input_ar.clone)
a.run
puts a.res
puts a.res2



a = QSort3.new(input_ar.clone)
a.run
puts a.res
puts a.res2

# puts ar.to_s