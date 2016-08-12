
Dir.entries('/Users/chipirek/projects/xenap/raw_images/CATIMAGES/IMGSTORE').each do |directory|
  if directory.start_with?(".") || directory.start_with?("_")
    next
  end
  target_directory = directory.gsub(/\w+/, &:capitalize)
  puts "Folder: " + directory + " -----------------------"

  begin
    Dir.entries('/Users/chipirek/projects/xenap/raw_images/CATIMAGES/IMGSTORE/' + directory + '/Resized/').each do |file|
      if file.end_with?(".tif") || file.end_with?(".TIF")
        system("mkdir /Users/chipirek/projects/xenap/public/images/'" + target_directory + "'")
        s='/Users/chipirek/projects/xenap/raw_images/CATIMAGES/IMGSTORE/"' + directory + '"/Resized/"' + file + '"'
        t='/Users/chipirek/projects/xenap/public/images/"' + target_directory + '"/"' + file[0...-4] + '.jpg"'
        c='convert ' + s + ' ' + t
        puts 'Running ' + c
        system(c)
      end
    end
  rescue
    puts 'Failure in ' + target_directory
  end

end
