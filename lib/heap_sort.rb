require_relative "heap"

class Array
  # heaps, sorted array, partition (in place sort)
  # Step 1: build a heap, increment the partition, the left side will be a
  # heap, the right side will be unknown elements that are fed in
  # Step 2: the right side will be the sorted array, the left side will be
  # the heap, extract, decrement the partition, (then call heapify on the left
  # side of the array)
  def heap_sort!
  end
end
