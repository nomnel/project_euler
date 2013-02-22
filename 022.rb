def e022
  def name_score(name)
    name.enum_for(:each_byte).map{|c| c - 64}.inject(:+)
  end

  names = File.open("names.txt").read.split(/,/).map{|s| s.delete("\"")}.sort
  names.enum_for(:each_with_index) \
       .map{|name, idx| name_score(name) * (idx + 1)} \
       .inject(:+)
end