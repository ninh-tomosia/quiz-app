def readFile
    File.open("./tieng_anh_12.pdf", "r") do |f|
        f.each_line do |line|
          puts line
        end
      end
end 
readFile