describe 'djikstra', ->
	djikstra = require '../lib/djikstra'

	it "finds the correct shortest path for graphs that have one node", ->
		graph = "A": []
		expect(djikstra("A", "A", graph)).toEqual(["A"])


	it "finds the correct shortest path for bigger graphs", ->
		graph = {
  		"A": [["B", 1], ["C", 2]]
			"B": [["A", 1], ["E", 20]]
			"C": [["A", 2], ["D", 3]]
			"D": [["C", 3], ["E", 4]]
			"E": [["B", 20], ["D", 4]]
	 	}

  	expect(djikstra("A", "E", graph)).toEqual ["A", "C", "D", "E"]

	describe "when there is no shortest path", ->
	  it 'returns an empty array', ->
	  	graph =
		  		"A": [["B", 1], ["C", 2]]
		  		"B": [["A", 1]]
		  		"C": [["E", 5], ["D", 3]]
		  		"D": [["C", 3]]
		  		"E": ["C", 5]

		  expect(djikstra("A", "E", graph).length).toBe 0


