=begin
Find the first non repeating char in string.
Input Type = String
Input string contains only lower case English letters.
Input String Length -  1 <= N <= 100000
"a" => a
"aaabcccdeeef" => b
"abcbad"       => c
"abcabcabc"    => nil
=end

string = "aaabcccdeeef" 

# Time complexity: O(n^2)
# Space complexity: O(1)
def first_non_repeating_char_n2_1(str)
  for i in (0...str.length) do
    seen_dup = false
    for j in (0...str.length) do
      if(str[i]==str[j] && i!=j)
        seen_dup = true
        break
      end
    end
    return str[i] unless seen_dup
  end
  return nil
end

p "Input: #{string}"
p first_non_repeating_char_n2_1(string)

# Time complexity: O(n)
# Space complexity: O(n)
def first_non_repeating_char_2n_n(str)
  chars = {}
  for i in (0...str.length) do
    if(chars[str[i]])
      chars[str[i]] = chars[str[i]] + 1
    else
      chars[str[i]] = 1
    end
  end
  for i in (0...str.length) do
    if(chars[str[i]]==1)
      return str[i]
    end
  end
  return nil
end

p "Input: #{string}"
p first_non_repeating_char_2n_n(string)