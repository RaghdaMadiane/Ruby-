class ComplexNumber
    @@times_of_add = 0
    @@times_of_multiply = 0
    @@times_of_bulk_add = 0
    @@times_of_bulk_multiply = 0
    attr_accessor :real, :imag
    
    def initialize(r,i)     
        @real=r
        @imag=i
    end

    def +(cn)       
        @@times_of_add += 1
        return ComplexNumber.new(self.real + cn.real, self.imag + cn.imag)
    end

    def *(cn)      
        @@times_of_multiply += 1
        real = self.real * cn.real - self.imag * cn.imag;
        imag = self.real * cn.imag + self.imag * cn.real;
        return ComplexNumber.new(real, imag)
    end

    def self.addBluck(cns)  
        @@times_of_bulk_add += 1
        result =  ComplexNumber.new(0, 0)      
        for cn in cns 
            result = (result + cn)
        end
        return result
    end

    def self.multiplyBluck(cns) 
        @@times_of_bulk_multiply += 1
        result =  ComplexNumber.new(1, 0)      
        for cn in cns 
            result = (result * cn)
        end
        return result
    end

    def self.get_stats() 
        puts "Total number of adds: #@@times_of_add
        Total number of adds: #@@times_of_multiply
        Total number of bulk adds: #@@times_of_bulk_add 
        Total number of bulk multiples: #@@times_of_bulk_multiply"
    end
    
end


cn1 = ComplexNumber.new(40, 90)
cn2 = ComplexNumber.new(20, 30)
cns = []
cns << cn1
cns << cn2
add_result = cn1 + cn2
puts ("Add= #{add_result.real} + i#{add_result.imag}")
multiply_result = cn1 * cn2
puts ("Multiply = #{multiply_result.real} + #{multiply_result.imag}i")
bulk_add_result = ComplexNumber.addBluck(cns)
puts ("Bulk Add = #{bulk_add_result.real} + #{bulk_add_result.imag}i")
bulk_multiply_result = ComplexNumber.multiplyBluck(cns)
puts ("Bulk Multiply= #{bulk_multiply_result.real} + #{bulk_multiply_result.imag}i")
ComplexNumber.get_stats()