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
  
  def blur(distance)
    n = 1
    c_len = 0
    
    while n < distance
      temp = []

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
        image[row+1][col] = 1 unless row >= image.size
        image[row-1][col] = 1 unless row == 0
      }

      image.each { |i| 
        if i.size > c_len
          i.pop
        end
      }

#      puts "---------"
#      self.output_image
      n += 1
    end
    
  end
  
end

image = Image.new([
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  ])
expected = Image.new([
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [1, 1, 1, 0],
  [1, 1, 1, 1],
  [1, 1, 1, 0],
  [0, 1, 0, 0],
  ])

puts "---------"
puts "ORIGINAL:"
puts "---------"
image.output_image
image.blur(3)

puts "---------------"
puts "MANHATTAN BLUR:"
puts "---------------"
image.output_image

#puts "---------"
#puts "EXPECTED:"
#puts "---------"
#
#expected.output_image




