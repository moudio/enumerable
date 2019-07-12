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


end