# describe 'Djikstra', ->
# 	djikstra = null
# 	beforeEach ->
# 		djikstra = require('../lib/djikstra')


#   describe "when the shortest path requires more nodes than a longer path", ->
# 	  it 'finds the correct shortest path', ->
# 	  	graph =
# 	  		"A": [["B", 1], ["C", 2]]
# 	  		"B": [["A", 1], ["E", 20]]
# 	  		"C": [["A", 2], ["D", 3]]
# 	  		"D": [["C", 3], ["E", 4]]
# 	  		"E": [["B", 20], ["D", 4]]


# 	  	expect(djikstra("A", "E", graph)).toBe ["A", "C", "D", "E"]

# 	describe "when there is no shortest path", ->
# 	  it 'returns an empty array', ->
# 	  	graph =
# 		  		"A": [["B", 1], ["C", 2]]
# 		  		"B": [["A", 1]]
# 		  		"C": [["A", 2], ["D", 3]]
# 		  		"D": [["C", 3]]
# 		  		"E": []

# 		  expect(djikstra("A", "E", graph).length).toBe 0


