require_relative 'heap'

def k_largest_elements(array, k)
  array.sort.pop(k)
end
