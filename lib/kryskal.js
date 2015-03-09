UnionFind = require('./unionFind.js')

kryskal = function (graph) {
	var nodes = Object.keys(graph),
	edges = [],
	finalOutput = [],
	nodeToIndexMap = {};

	for (var i = 0, len = nodes.length; i < len; i++) {
		var node = nodes[i],
		nodeConnections = graph[node];

		nodeToIndexMap[node] = i;

		for(var c = 0, clen = nodeConnections.length; c < clen; c++) {
			var edge = nodeConnections[c];
			newEdge = [[node, edge[0]], edge[1]];
			edges.push(newEdge);
		}

	}

	edges.sort(function(a,b) {
		var value1 = a[1], value2 = b[1];
		if (value1 < value2) {
			return -1
		} else {
			return 1
		}
	});

	var uf = new UnionFind(edges.length);

	for (var e = 0, elen = edges.length; e < elen; e++) {
		var edge = edges[e];
		node1 = edge[0][0],
		node2 = edge[0][1],
		node1Index = nodeToIndexMap[node1];
		node2Index = nodeToIndexMap[node2];

		var sameSet = uf.find(node1Index) === uf.find(node2Index);

		if(!sameSet) {
			uf.union(node1Index, node2Index);
			finalOutput.push([node1, node2]);
		}
	}

	return finalOutput;
}

var graph = {
	A: [["B", 1], ["F", 3], ["G", 2]],
	B: [["A", 1], ["F", 1], ["C", 2]],
	C: [["B", 2], ["D", 6]],
	D: [["C", 6], ["F", 3], ["E", 3]],
	E: [["D", 3], ["F", 4], ["G", 1]],
	F: [["A", 3], ["B", 1], ["D", 3], ["E", 4], ["G", 1]],
	G: [["A", 2], ["F", 1], ["E", 1]]
};

console.log("kryskal(graph)", kryskal(graph));
