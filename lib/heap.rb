class BinaryMinHeap
  attr_reader :store, :prc

  def initialize(&prc)
    @store = []
  end

  def count
    @store.count
  end

  def extract
  end

  def peek
    @store[0]
  end

  def push(val)
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
