class BinaryMinHeap
  attr_reader :store, :prc

  def initialize(&prc)
    @store = []
  end

  def count
    @store.length
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
    [2 * parent_idx + 1, 2 * parent_idx + 2].select { |i| i < len }
  end

  def self.parent_idx(child_idx)
    raise 'root has no parent' if child_idx.zero?
    (child_idx - 1) / 2
  end

  # 1) until the array is heapified, swap parent and child index
  # 2) if parent is greater than its children, swap them
  # 3) continue swapping until parent is not larger than children
  def self.heapify_down(arr, parent_idx, len = arr.length, &prc)
    heapified = false
    new_parent_idx = nil

    until heapified
      if child_indicies(len, parent_idx).all? { |i| i < arr[parent_idx] }
        heapified = true
      else

      end

      child_indices(len, parent_idx).each do |child_idx|
        if arr[parent_idx] > arr[child_idx]
          arr[parent_idx], arr[child_idx] = arr[child_idx], arr[parent_idx]
          new_parent_idx = child_idx
          break
        end
      end
      parent_idx = new_parent_idx
    end



  end

  def self.heapify_up(arr, child_idx, len = arr.length, &prc)


  end
end
