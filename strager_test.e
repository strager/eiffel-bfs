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
			add_boolean_case (agent bfs_of_depth_1_tree)
			--show_browser
			run_espec
		end

feature
	bfs(root: NODE): ARRAYED_LIST[INTEGER]
		do
			create Result.make(0)
			Result.extend(root.data)

			across root.children as entry loop
				Result.extend(entry.item.data)
			end
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

	bfs_of_depth_1_tree: BOOLEAN
		local
			root: NODE
			child_a: NODE
			child_b: NODE
			child_c: NODE
			traversal: ARRAYED_LIST[INTEGER]
		do
			comment("test: bfs_of_depth_1_tree")
			create root.make(0)
			create child_a.make(10)
			root.children.extend(child_a)
			create child_b.make(20)
			root.children.extend(child_b)
			create child_c.make(30)
			root.children.extend(child_c)

			traversal := bfs(root)
			check traversal.count = 4 end
			check traversal.at(1) = 0 end
			check traversal.at(2) = 10 end
			check traversal.at(3) = 20 end
			check traversal.at(4) = 30 end
			Result := true
		end
end
