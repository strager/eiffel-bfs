note
	description: "Summary description for {STRAGER_TEST}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class STRAGER_TEST
inherit ES_TEST
create make
feature
	make
		do
			add_boolean_case (agent bfs_of_single_node)
			--show_browser
			run_espec
		end

feature
	bfs(root: NODE): ARRAYED_LIST[INTEGER]
		do
			create Result.make(0)
			Result.extend(root.data)
		end

feature
	bfs_of_single_node: BOOLEAN
		local
			graph: NODE
			traversal: ARRAYED_LIST[INTEGER]
		do
			comment("test: bfs_of_single_node")
			create graph.make(42)
			traversal := bfs(graph)
			check traversal.count = 1 end
			check traversal.at(1) = 42 end
			Result := true
		end
end
