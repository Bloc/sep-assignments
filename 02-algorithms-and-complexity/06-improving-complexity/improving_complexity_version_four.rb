# ruby uses a quicksort
# no idea of flatttens efficiency
def improvement_four(*arrays)
  arrays.flatten.sort
end

print "#{improvement_four([8,9,10], [0,1,2], [5,6,7], [3,4,5])} \n"
