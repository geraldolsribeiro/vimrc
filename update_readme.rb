#!/usr/bin/env ruby

in_fold = false

File.open("README.md", "w") do |readme|
  File.readlines("vimrc").each do |line|
    if m = line.match( /^"   (.*)/ )
      readme << m[1] << "\n"
    elsif m = line.match( /^"{{{/ )
      in_fold = true
      readme << "\n```vim\n"
      next
    elsif m = line.match( /^"}}}/ )
      in_fold = false
      readme << "```\n\n"
    end

    if in_fold
      readme << line
    end
  end
end


