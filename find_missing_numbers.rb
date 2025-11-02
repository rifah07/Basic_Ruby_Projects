=begin
You are given an integer array nums consisting of unique integers.
Originally, nums contained every integer within a certain range.
However, some integers might have gone missing from the array.
The smallest and largest integers of the original range are still present in nums.
Return a sorted list of all the missing integers in this range.
If no integers are missing, return an empty list.©leetcode
=end

# frozen_string_literal: true
# @param {Integer[]} nums
# @return {Integer[]}
def find_missing_elements(nums)
  result = []
  #nums = nums.sort
  mx = nums.max
  mn = nums.min
  arr = (mn..mx).to_a
  if nums.length != arr.length
    arr.each do |n|
      result << n unless nums.include?(n)
    end
  end
  result
end

p find_missing_elements([1,2,5,4])
p find_missing_elements([5, 1])