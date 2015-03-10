class Heap
	constructor: (comparisonFn) ->
		@heap = []
		@lookupMap = {}
		@comparisonFn = comparisonFn
	push: (id, value) ->
		@heap.push([id, value])
		index = @heap.length - 1
		@lookupMap[id] = index
		@bubbleUp(index)
		return @heap
	pop: ->
		return undefined if @heap.length == 0
		root = @heap[0]
		last = @heap[@heap.length - 1]
		@heap[0] = last
		@heap.length = @heap.length - 1 #"slice" off the last spot in the heap
		delete @lookupMap[root[0]] #remove id from lookup map
		@bubbleDown(0)
		return root

	bubbleUp: (index) ->
		return if index == 0
		parentIndex = Math.floor(index / 2)
		currentNodeValue = @heap[index][1]
		parentNodeValue = @heap[parentIndex][1]

		if @comparisonFn(currentNodeValue, parentNodeValue) #e.g., if currentNodeValue < parentNodeValue in minHeap
			@swap(index, parentIndex)
			@bubbleUp(parentIndex)

	bubbleDown: (index) ->
		return if @heap.length == 0
		leftChildIndex = index*2 + 1
		rightChildIndex = index*2 + 2

		leftChildValue = @heap[leftChildIndex]?[1]
		rightChildValue = @heap[rightChildIndex]?[1]
		currentNodeValue = @heap[index][1]

		leastChildIndex = undefined

		if leftChildValue and leftChildValue < currentNodeValue
			leastChildIndex = leftChildIndex

		if rightChildValue and rightChildValue < currentNodeValue and (rightChildValue < leftChildValue)
			leastChildIndex = rightChildIndex

		if leastChildIndex
			@swap(index, leastChildIndex)
			@bubbleDown(leastChildIndex)

	swap: (index1, index2) ->
		node1 = @heap[index1]
		node2 = @heap[index2]
		node1Id = node1[0]
		node2Id = node2[0]

		@heap[index1] = node2
		@lookupMap[node2Id] = index1
		@heap[index2] = node1
		@lookupMap[node1Id] = index2

	find: (id) ->
		index = @lookupMap[id]
		@heap[index]

	update: (id, value) ->
		index = @lookupMap[id]
		@heap[index][1] = value
		@bubbleUp(index)
		@bubbleDown(index)

	peek: ->
		@heap[0]

module.exports = Heap