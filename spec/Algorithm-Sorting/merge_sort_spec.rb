require_relative './shared_example.rb'
require_relative '../../lib/Algorithm-Sorting/merge_sort.rb'

describe MergeSort do
  let(:values) { [5,2,4,7,1,3,6] }

  include_examples "recursive"
end
