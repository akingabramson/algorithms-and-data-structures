djikstra = (startNode, endNode, adjacencyList) ->
	distances = new Minheap(), paths = {}, nodes = Object.keys(adjacencyList)

	distances[node] = Infinity for node in nodes
	distances[endNode] = 0

	paths[endNode] = [endNode]
	currentNode = distances.pop() #i.e. currentNode = endNode

	while currentNode
		edges = adjacencyList[currentNode]
		for edge in edges
			attachedNode = edge[0]
			attachedDistance = edge[1]
			existingDistanceToNode = distances[attachedNode]
			notYetVisited = typeof(existingDistanceToNode) == "number"

			if notYetVisited and attachedDistance < existingDistanceToNode
				distances[attachedNode] = attachedDistance
				paths[attachedNode] = [attachedNode].concat(paths[currentNode])
		currentNode = distances.pop()
		return paths[currentNode] if currentNode == startNode

	return []



module.exports = djikstra