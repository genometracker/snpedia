require 'open-uri'

file = open('https://www.genome.gov/admin/gwascatalog.txt').read

#puts file

titles=[]
data=[]

file.each_line.with_index do | line,index|

	#sline=line.split("\t")
	
	#puts line
	sline=line.split("\t")

	if index==0 then
		sline.each_with_index do |item,index|
		  titles.push index.to_s + ')' + sline[index]
		end
	end

	if index==1
		sline.each_with_index do |item,index|
			data.push sline[index]
		end

		break
	end
	#break
end

titles.each_with_index do |item,index|
	puts item + "\t\t\t\t" + data[index]
end