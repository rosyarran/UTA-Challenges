class Image
  attr_accessor :image
  
  def initialize(image)
    @image = image
  end
  
  def output_image
    image.each { |i|
      puts i.join(" ")
    }
  end
  
  def blur
    temp = []
    c_len = 0
    
    image.each_with_index { |i, row|
      i.each_with_index { |j, col|
        if j == 1
          temp << [row, col]
        end
      }
      
      c_len = i.size
    }

    temp.each { |row, col| 
      image[row][col-1] = 1 unless col == 0 
      image[row][col+1] = 1 unless col == -1
      image[row+1][col] = 1 unless row == -1
      image[row-1][col] = 1 unless row == 0
    }
    
    image.each { |i| 
      if i.size > c_len
        i.pop
      end
    }
  end
  
end

image = Image.new([
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 1],
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  ])

image.output_image

image.blur
puts "---------"
image.output_image