class Array
  # def merge_sort
  #   return self if self.length <= 1

  #   medium = self.length / 2
  #   left = self[0...medium]
  #   right = self[medium..-1]

  #   merge(left.merge_sort, right.merge_sort)
  # end

  # def merge(left_side, right_side)
  #   my_array = []
  #   until left_side.empty? || right_side.empty?
  #     if left_side.first <= right_side.first
  #       my_array << left_side.shift
  #     else
  #       my_array << right_side.shift
  #     end
  #   end
  #   my_array + left_side + right_side
  # end
  def binary_search(target)
    return pivot if pivot == target

    med_idx = self.size / 2
    pivot = self[med_idx]

    left = self[0...med_idx]
    right = self[med_idx + 1..-1]

    p "Pivot is now: #{pivot}"
    p "Left is now: #{left}"
    p "Right is now: #{right}"

    target > pivot ? right.binary_search : left.binary_search
  end
end

p [1, 4, 5, 6, 23, 98, 93].binary_search(98)
