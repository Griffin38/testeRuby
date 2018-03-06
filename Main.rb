require './image.rb'

@Imagem = Image.new(1,1)
running = true

def checkInput(input,arguments)
    result = true
for i in 1..arguments
if(!input[i]) 
    result = false
end
end
if(!result) 
    puts "Comando Incompleto"
end
return result
end

while(running)
puts "Comando:"
inputs =  gets.chomp
input = inputs.split(" ")
case input[0] 
    when "I"
        if(checkInput(input,2))
     @Imagem = Image.new(input[1].to_i,input[2].to_i)
        end
    when "C"
     @Imagem.clear
    when "L"
        if(checkInput(input,3))
     @Imagem.colour(input[1].to_i,input[2].to_i,input[3])
        end
    when "V"
        if(checkInput(input,4))
     @Imagem.vertical(input[1].to_i,input[2].to_i,input[3].to_i,input[4])
        end
    when "H"
        if(checkInput(input,4))
     @Imagem.horizontal(input[1].to_i,input[2].to_i,input[3].to_i,input[4])
        end
    when "F"
        if(checkInput(input,3))
        @Imagem.region(input[1].to_i,input[2].to_i,input[3])
        end
    when "S"
     @Imagem.show
    when "X"
     puts "Terminated"   
    running = false 
else puts "Comando Invalido"
end

end