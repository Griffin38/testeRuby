
class Image
    @@max = 250
  attr_reader :image

  def initialize (columns,rows)
    if( columns >  0 && columns <= @@max && rows >0 && rows <= @@max)
    @image = Array.new(rows) { Array.new(columns){"O"}}
    @dimC = columns
    @dimR = rows
    else puts "Valores invalidos" 
    end
  end

  def show 
    @image.each_with_index {|val, index| puts "#{val}"  }
  end

  def colour(y,x,color)
  if(checkParams(x,y))
     @image[x-1][y-1] = color
    end
  end

  def clear
    @image = Array.new(@dimR) { Array.new(@dimC){"O"}}
  end

  def checkParams(x,y)
    if( x >  0 && x <= @dimR && y >0 && y <= @dimC)
        return true
    end
    puts "Parametros invalidos"
    return false
  end
  def vertical(x,y1,y2,color)
    if(checkParams(y1,x) && checkParams(y2,x))
        for i in y1..y2
            @image[i-1][x-1] = color
        end
    end
  end
  def horizontal(x1,x2,y,color)
    if(checkParams(y,x1) && checkParams(y,x2))
        for i in x1..x2
            @image[y-1][i-1] = color
        end
    end
  end
  def region(y,x,color)
    if(checkParams(x,y))
   oldcolor =  @image[x-1][y-1] 
   @image[x-1][y-1] = color
   painter(oldcolor,color,y,x)
    end
  end

  def painter(old,color,x,y)
    if(x >  0 && x <= @dimR && y >0 && y <= @dimC)
    if(@image[x-1][y-2] == old)
        @image[x-1][y-2] = color
        painter(old,color,y-1,x)
    end
    if(@image[x-1][y] == old)
        @image[x-1][y] = color
        painter(old,color,y+1,x)
    end
    if(@image[x-2][y-1] == old)
        @image[x-2][y-1] = color
        painter(old,color,y,x-1)
    end
    if(@image[x][y-1] == old)
        @image[x][y-1] = color
        painter(old,color,y,x+1)
    end
end
  end
end
