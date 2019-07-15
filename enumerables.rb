# Creating the enumerable module
module Enumerables 
    #my_each method
    def my_each 
        i = 0
        while i < self.length
            yield(self[i])
            i+= 1
        end
    end
      
#my_each_with_index method
def my_each_with_index
    index = 0
    i = 0
    while i < self.length
    yield(self[i], index)
    index += 1
    i+= 1
    end
end

#my_select method
def my_select
arr = []
self.my_each {|el| arr << el if yield(el)}
arr 
end

#my_all? method
def my_all? 
    result= false
    self.my_each do |el| 
    if yield(el) 
    result = true
    else 
     false
    end
    result
    end

end

#my_any?

def my_any?

    self.my_each {|el| return true if yield(el)}
    false    
end


def my_none?
    result = true
    self.my_each do |el|
        if yield(el)
        return false
        end

    end
  result
end 

#count method
def my_count(el)
    return self.length if el == nil
    return self.my_select(el) if el
    if block_given? 
    count = 0
    self.my_each {|el| count+= 1 if yield(el)}
    count
    end 
    
end

#my_map method 
def my_map
    arr = []
        self.my_each  
    block = Prock.new{|el| arr << yield(el) }
    self.my_each(&block)
    arr 

end 

#my_inject 

def my_inject(a = nil)
    a ? total = a : total = self[0]
    for i in 1...self.length 
         total = yield(total, self[i])
    end

     total
end
    
end #end of module




#testing the my_inject method
def multiply_els(arr)
    arr.my_inject do |a,b|
    a = a * b
    a
    end

end

