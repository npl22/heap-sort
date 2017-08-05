require_relative 'heap'

# Why are heaps implicated in this problem?
# 1) You want to keep track of the max, whenever you want to track
# the min or max in not O(n), but O(logn) you should use a heap
# What are the benefits of implementing a heap?
# In a heap the root is always the min or max
def k_largest_elements(array, k)
end

# Let's use our BinaryMinHeap to solve a whiteboarding-style question. Given an `array` and an integer `k`, return the k-largest elements in `O(k + (n-k)logk)` time.

# MaxHeap solution, O(nlogn + klogn)
# Sorting solution, O(nlogn + k)

# MinHeap (optimal) solution, build a MinHeap, but only keep it at k size
# O(klogk + (n-k)logk), klogk -> build heap, ejecting elements -> (n-k) elements times the cost of heapifying --> O(nlogk)
# in other words, build a head of size k, then heapify and eject the remaining elements (n-k)

# Ex: [5,4,3,1,2], 3 largest, build heap using first 3 elements, [3,4,5]
# Ex: insert 1, extract (extract gets rid of smallest); insert 2, extract
# and so, on and so on, in the end you'll be left with a heap of k largest
