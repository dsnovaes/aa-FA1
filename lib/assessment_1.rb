$vowels = "aeiouAEIOU"

arr_1 = [1,2,3,4]
arr_2 = ['give', 'more', 'take', 'less']
# even = Proc.new { |n| n.even? }
# positive = Proc.new { |n| n > 0 }
# all_uppercase = Proc.new { |x| x == x.upcase }
# starts_with_a = Proc.new { |x| x[0].downcase == 'a' }
# arr_1 = [
#     { matt: 17, polina: 19, erin: 18 },
#     { jj: 9, anna: 17}
# ]
# arr_2 = [
#     { a: -3, b: 4 },
#     { a: 10, b: 12 },
#     {}
# ]


def my_map!(arr,&blk)
    arr.collect! { |ele| blk.call(ele) }
end

# p my_map!(arr_1) { |n| n * n }
# p my_map!(arr_2) { |s| s.capitalize + '!' }

def two?(arr, &blk)
    arr.map! { |ele| blk.call(ele) }
    count = arr.count { |ele| ele == true }
    count == 2
end

# p two?([7, 4, 10, 3, 1]) { |x| x.even? }
# p two?([2019, 121, 10]) { |x| x.even? }

def nor_select(arr, prc1, prc2)
    arr.select { |ele| !prc1.call(ele) && !prc2.call(ele) }
end

# p nor_select([-2, -4, 7, -7, -5], even, positive) # [-7, -5]
# p nor_select(['potato', 'ORANGE', 'toMATO', 'apple'], all_uppercase, starts_with_a) # ['potato', 'toMATO']

def array_of_hash_sum(arr)
    count = 0
    arr.each do |hash|
        hash.each do |k,v|
            count += v
        end
    end
    count
end

# p array_of_hash_sum(arr_1) # 80
# p array_of_hash_sum(arr_2) # 23
# p array_of_hash_sum([]) # 0


def unvowel_first(str)
    vowels = []
    str.each_char.with_index { |char,i| vowels << i if $vowels.include?(char) }
    first_vowel = vowels[0]
    return str if vowels.empty?
    return str[0...first_vowel] + str[first_vowel+1..-1]
end

def slangify(sentence)
    arr = sentence.split(" ")
    arr.map! { |ele| unvowel_first(ele) }.join(" ")
end

p slangify("follow the yellow brick road") # fllow th yllow brck rad

def char_counter(str,*single_char)
    result = Hash.new(0)
    if single_char.count == 0
        str.each_char { |char| result[char] += 1 }
        return result
    end

    single_char.each do |char|
        result[char] = 0
    end
    str.each_char { |char| result[char] += 1 if result.has_key?(char)  }
    result
end

# p char_counter('mississippi', 'm', 'i')
# p char_counter('christine')