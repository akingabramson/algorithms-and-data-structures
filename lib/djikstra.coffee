Heap = require './heap'

djikstra = (startNode, endNode, adjacencyList) ->
	distances = new Heap((value1, value2) -> value1 < value2) #creating a minHeap
	paths = {}
	nodes = Object.keys(adjacencyList)

	distances.push(node, Infinity) for node in nodes
	distances.update(endNode, 0)

	paths[endNode] = [endNode]
	currentNode = distances.pop()[0] #i.e. currentNode = endNode

	while currentNode
		return paths[currentNode] if currentNode == startNode

		edges = adjacencyList[currentNode]
		for edge in edges
			attachedNode = edge[0]
			attachedDistance = edge[1]
			existingDistanceToNode = distances.find(attachedNode)?[1]


			notYetVisited = typeof(existingDistanceToNode) == "number" # visited notes are off the heap and would return undefined,

			if notYetVisited and attachedDistance < existingDistanceToNode
				distances.update(attachedNode, attachedDistance)
				paths[attachedNode] = [attachedNode].concat(paths[currentNode])

		#if the next closest node check can't be reached, there's no path
		return [] if (distances.peek()?[1]) == Infinity
		currentNode = distances.pop()[0]

	return []

module.exports = djikstra