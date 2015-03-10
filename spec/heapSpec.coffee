describe 'Heap', ->
	Heap = require('../lib/heap')
	heap = null
	beforeEach ->
		comparisonFunction = (value1, value2) ->
			value1 < value2
		heap = new Heap(comparisonFunction)

	describe "#push", ->
		it "bubbles the lowest values to the top", ->
			heap.push("B", 2)
			heap.push("A", 1)
			expect(heap.pop()).toEqual(["A", 1])

		it "works for a lot of additions", ->
			heap.push("A", 2)
			heap.push("B", 134)
			heap.push("C", 99)
			heap.push("D", 14)
			heap.push("F", 100)
			heap.push("G", 97)
			heap.push("H", 105)
			heap.push("I", 1)
			expect(heap.pop()).toEqual(["I", 1])


	describe "#pop", ->
		it "removes the lowest value from the heap and bubbles up the other values", ->
			heap.push("A", 1)
			heap.push("B", 2)
			heap.push("C", 3)
			expect(heap.pop()).toEqual(["A", 1])
			expect(heap.pop()).toEqual(["B", 2])

		it "returns undefined values if the heap is empty", ->
			expect(heap.pop()).toBe(undefined)

		it "removes the id of the popped item from the lookup map", ->
			heap.push("A", 1)
			heap.push("B", 2)
			heap.pop()
			expect(heap.find("A")).toBe undefined

	describe "#update", ->
		beforeEach ->
			heap.push("A", 4)
			heap.push("B", 2)
			heap.push("C", 3)

		it "updates the heap at a specific identifier and bubbles down as necessary", ->
			heap.update("A", 1)
			expect(heap.pop()).toEqual(["A", 1])
		it "updates the heap at a specific identifier and bubbles up as necessary", ->
			heap.update("B", 6)
			expect(heap.pop()).toEqual(["C", 3])

	describe "#find", ->
		it "returns the value in the heap of a given identifier", ->
			heap.push("A", 4)
			heap.push("B", 2)
			heap.push("C", 3)
			expect(heap.find("C")).toEqual ["C", 3]

	describe "#peek", ->
		it "returns the top value of the heap without removing it from the heap", ->
			heap.push("A", 4)
			heap.push("B", 2)
			heap.push("C", 3)
			expect(heap.peek()).toEqual ["B", 2]




