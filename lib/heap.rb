require 'pry-byebug'

class BinaryMinHeap
  attr_reader :store, :prc

  def initialize(&prc)
    @store = []
    @prc ||= proc { |el1, el2| el1 <=> el2 }
  end

  def count
    @store.count
  end

  def extract
    raise 'Heap is empty' if count.zero?
    # return the root value of the heap
    val = store[0]

    # remove the 1st element and make sure the heap property is preserved
    # replace the first el with the last el, then call heapify down
    # the result will always be a tree that satisfies the heap properties
    if count > 1
      store[0] = @store.pop
      BinaryMinHeap.heapify_down(store, 0, &prc)
    else
      @store.pop
    end

    val
  end

  def peek
    @store[0]
  end

  def push(val)
    @store << val
    BinaryMinHeap.heapify_up(store, count - 1, &prc)
  end

  public

  def self.child_indices(len, parent_idx)
    [2 * parent_idx + 1, 2 * parent_idx + 2].select { |idx| idx < len }
  end

  def self.parent_idx(child_idx)
    raise 'root has no parent' if child_idx.zero?
    (child_idx - 1) / 2
  end

  def self.heapify_down(arr, parent_idx, len = arr.length, &prc)
    prc ||= proc { |el1, el2| el1 <=> el2 }
    parent = arr[parent_idx]

    l_child_idx, r_child_idx = child_indices(len, parent_idx)
    children = []
    children << arr[l_child_idx] if l_child_idx
    children << arr[r_child_idx] if r_child_idx
    # return array if heap property is satisfied for both children
    return arr if children.all? { |child| prc.call(child, parent) >= 0 }

    # swap parent with largest/smallest of its children
    if children.length == 1
      swap_idx = l_child_idx
    else
      swap_idx =
        prc.call(children[0], children[1]) <= 0 ? l_child_idx : r_child_idx
    end
    arr[parent_idx], arr[swap_idx] = arr[swap_idx], arr[parent_idx]
    heapify_down(arr, swap_idx, len, &prc)

    arr
  end

  def self.heapify_up(arr, child_idx, len = arr.length, &prc)
    return arr if child_idx.zero?
    prc ||= proc { |el1, el2| el1 <=> el2 } # Prc for min/max heap
    child = arr[child_idx]
    parent = arr[parent_idx(child_idx)]

    # return arr if heap property is satisfied
    return arr if prc.call(child, parent) >= 0

    # swap child and parent
    arr[parent_idx(child_idx)] = child
    arr[child_idx] = parent
    # do another level of swaps
    heapify_up(arr, parent_idx(child_idx), len, &prc)

    arr
  end
end

# iterative solution
# def self.heapify_up(arr, child_idx, len = arr.length, &prc)
#   # pass the arr/heap, and the idx of the element you want to heapify up
#   # compare the child and parent, swap if out of order
#   prc ||= Proc.new { |el1, el2| el1 <=> el2 } # Prc for min/max heap
#   loop do
#     child, parent = arr[child_idx], arr[self.parent_idx(child_idx)]
#
#     if prc.call(child, parent) == -1
#       arr[self.parent_idx(child_idx)] = child
#       arr[child_idx] = parent
#     elsif prc.call(child, parent) == 1
#       break
#     end
#
#     # Reassign child_idx (go up one level in the heap)
#     child_idx = self.parent_idx(child_idx)
#     break if child_idx.zero?
#   end
#
#   arr
# end
