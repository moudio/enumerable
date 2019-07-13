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
    self.my_each {|el| arr << yield(el) }
    arr 

end 

    
end #end of module