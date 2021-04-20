def tsp(g, i, s, lintasan)
    
    if s.length == 0
        lintasan << 1
        return g[i-1][0]
    else
        temp = []
        tempLintasan = []
        s.each do |j|
            s1 = s.clone
            s1.delete(j)
            jalur = []
            temp << g[i-1][j-1] + tsp(g, j, s1, jalur)
            tempLintasan << jalur.clone
        end
        if i == 1
            lintasan << 1
        end
        min = temp.min
        lintasan << s[temp.find_index(min)]
        lintasan.concat(tempLintasan[temp.find_index(min)])
        return min
    end
    
end

g = []
f = File.new("graph2.txt", "r");
f.each_line do |line|
    g << line.split.map(&:to_i)
  end
f.close();
hasil = []
s = []
for i in 2..g.length
    s << i
end
print("Panjang lintasan terpendek: ")
print(tsp(g, 1, s, hasil))
print("\n")
print("Lintasan: ")
for i in 0..hasil.length-1
    if i != 0 
        print(" -> ")
    end
    print(hasil[i])
end
print("\n")
