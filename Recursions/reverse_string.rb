# Hello World
# dlroW olleH

def reverse(str)
  if str.empty?
    return str
  end
  return str[-1]+reverse(str[0..-2])
end

p reverse('Hello World')