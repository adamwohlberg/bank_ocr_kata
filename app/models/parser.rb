class Parser < ActiveRecord::Base

  def self.parse_file(name) 
    array = each_line_to_array(name)
    # define nine arrays, one array for each number
    n0, n1, n2, n3, n4, n5, n6, n7, n8 = [], [], [], [], [], [], [], [], []
    array.each do |arr|
      arr.each_with_index do |element, index|
        case index
        when 0
          n0 << arr[index]
        when 1
          n1 << arr[index]
        when 2
          n2 << arr[index]
        when 3
          n3 <<arr[index]
        when 4
          n4 << arr[index]
        when 5
          n5 << arr[index]
        when 6
          n6 << arr[index]
        when 7
          n7 << arr[index]
        when 8
          n8 << arr[index]  
        end
      end
    end
    array_to_account_numbers(n0,n1,n2,n3,n4,n5,n6,n7,n8)
  end

  # def self.checksum(name)
  #   # https://stackoverflow.com/questions/7372489/whats-the-efficient-way-to-multiply-two-arrays-and-get-sum-of-multiplied-values?rq=1
  #   account_number = self.parse_file(name) 
  #   array_A = [1,2,3,4,5,6,7,8,9]
  #   array_B = account_number.split('').to_a.map{|x|x.to_i}
  #   total = (0...array_A.count).inject(0) {|r, i| r + array_A[i]*array_B[i]}
  #   return true if (( total % 11 ) == 0 )
  #   false
  # end

  private

  def self.each_line_to_array(name)
    # takes a file name and outputs an array of nested arrays
    file = File.join(Rails.root, '/fixtures', "#{name}.txt")
    array = []
    File.readlines(file).each_with_index do |line,index|
      # get each line as an array of nine nested arrays, each with three characters 
      arr = line.chomp.split('').each_slice(3).to_a
      array << arr
    end
    array
  end

  def self.pretty_print(array)
    p array[0]
    p array[1]
    p array[2]
  end

  def self.convert_to_number(string)
    case string
    when '[[" ", "_", " "], ["|", " ", "|"], ["|", "_", "|"]]'
      0
    when '[[" ", " ", " "], [" ", " ", "|"], [" ", " ", "|"]]'
      1
    when '[[" ", "_", " "], [" ", "_", "|"], ["|", "_", " "]]'
      2
    when '[[" ", "_", " "], [" ", "_", "|"], [" ", "_", "|"]]'
      3
    when '[[" ", " ", " "], ["|", "_", "|"], [" ", " ", "|"]]'
      4
    when '[[" ", "_", " "], ["|", "_", " "], [" ", "_", "|"]]'   
      5
    when '[[" ", "_", " "], ["|", "_", " "], ["|", "_", "|"]]'
      6
    when '[[" ", "_", " "], [" ", " ", "|"], [" ", " ", "|"]]'
      7
    when '[[" ", "_", " "], ["|", "_", "|"], ["|", "_", "|"]]' 
      8
    when '[[" ", "_", " "], ["|", "_", "|"], [" ", "_", "|"]]'
      9
    end
  end

  def self.array_to_account_numbers(n0,n1,n2,n3,n4,n5,n6,n7,n8)
    arr = []
    d9 = arr << convert_to_number( n0.to_s )
    d8 = arr << convert_to_number( n1.to_s )
    d7 = arr << convert_to_number( n2.to_s )
    d6 = arr << convert_to_number( n3.to_s )
    d5 = arr << convert_to_number( n4.to_s )
    d4 = arr << convert_to_number( n5.to_s )
    d3 = arr << convert_to_number( n6.to_s )
    d2 = arr << convert_to_number( n7.to_s )
    d1 = arr << convert_to_number( n8.to_s ) 
    arr.join('')
  end




end
