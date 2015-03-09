describe 'MinHeap', ->
	Heap = require('../lib/heap')
	heap = null
	beforeEach ->
		comparisonFunction = (value1, value2) ->
			value1 < value2
		heap = new Heap(comparisonFunction)

	describe "#push", ->
		it "bubbles the lowest values to the top", ->
			heap.push(["B", 2])
			heap.push(["A", 1])
			expect(heap.pop()).toEqual(["A", 1])

		it "works for a lot of additions", ->
			heap.push(["A", 2])
			heap.push(["B", 134])
			heap.push(["C", 99])
			heap.push(["D", 14])
			heap.push(["F", 100])
			heap.push(["G", 97])
			heap.push(["H", 105])
			heap.push(["I", 1])
			expect(heap.pop()).toEqual(["I", 1])


	describe "#pop", ->
		it "removes the lowest value from the heap and bubbles up the other values", ->
			heap.push(["A", 1])
			heap.push(["B", 2])
			heap.push(["C", 3])
			expect(heap.pop()).toEqual(["A", 1])
			expect(heap.pop()).toEqual(["B", 2])

		it "returns undefined values if the heap is empty", ->
			expect(heap.pop()).toBe(undefined)

	describe "#update", ->
		it "updates the heap at a specific identifier and bubbles as necessary", ->
			heap.push(["A", 4])
			heap.push(["B", 2])
			heap.push(["C", 3])
			heap.update("A", 1)
			expect(heap.pop()).toEqual(["A", 1])




