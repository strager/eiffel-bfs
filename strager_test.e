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
			add_boolean_case (agent bfs_of_linked_list)
			add_boolean_case (agent bfs_of_depth_2_tree)
			add_boolean_case (agent bfs_of_cyclic_linked_list)
			--show_browser
			run_espec
		end

feature
	bfs(root: NODE): ARRAYED_LIST[INTEGER]
		local
			todo: ARRAYED_LIST[NODE]
			cur: NODE
			visited: ARRAYED_LIST[NODE]
		do
			create Result.make(0)
			create todo.make(0)
			create visited.make(0)
			todo.extend(root)

			from until todo.is_empty loop
				cur := todo.first
				todo.prune(cur)
				Result.extend(cur.data)
				across cur.children as entry loop
					if not visited.has(entry.item) then
						todo.extend(entry.item)
						visited.extend(entry.item)
					end
				end
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

	bfs_of_linked_list: BOOLEAN
		local
			root: NODE
			child: NODE
			grandchild: NODE
			great_grandchild: NODE
			traversal: ARRAYED_LIST[INTEGER]
		do
			comment("test: bfs_of_linked_list")
			create root.make(100)
			create child.make(200)
			root.children.extend(child)
			create grandchild.make(300)
			child.children.extend(grandchild)
			create great_grandchild.make(400)
			grandchild.children.extend(great_grandchild)

			traversal := bfs(root)
			check traversal.count = 4 end
			check traversal.at(1) = 100 end
			check traversal.at(2) = 200 end
			check traversal.at(3) = 300 end
			check traversal.at(4) = 400 end
			Result := true
		end

	bfs_of_depth_2_tree: BOOLEAN
		local
			root: NODE
			child_a: NODE
			child_a_a: NODE
			child_a_b: NODE
			child_b: NODE
			child_b_a: NODE
			child_b_b: NODE
			traversal: ARRAYED_LIST[INTEGER]
		do
			comment("test: bfs_of_depth_2_tree")
			create root.make(0)

			create child_a.make(10)
			root.children.extend(child_a)
			create child_a_a.make(11)
			child_a.children.extend(child_a_a)
			create child_a_b.make(12)
			child_a.children.extend(child_a_b)

			create child_b.make(20)
			root.children.extend(child_b)
			create child_b_a.make(21)
			child_b.children.extend(child_b_a)
			create child_b_b.make(22)
			child_b.children.extend(child_b_b)

			traversal := bfs(root)
			check traversal.count = 7 end
			check traversal.at(1) = 0 end
			check traversal.at(2) = 10 end
			check traversal.at(3) = 20 end
			check traversal.at(4) = 11 end
			check traversal.at(5) = 12 end
			check traversal.at(6) = 21 end
			check traversal.at(7) = 22 end
			Result := true
		end

	bfs_of_cyclic_linked_list: BOOLEAN
		local
			root: NODE
			child: NODE
			grandchild: NODE
			great_grandchild: NODE
			traversal: ARRAYED_LIST[INTEGER]
		do
			comment("test: bfs_of_cyclic_linked_list")
			create root.make(100)
			create child.make(200)
			root.children.extend(child)
			create grandchild.make(300)
			child.children.extend(grandchild)
			create great_grandchild.make(400)
			grandchild.children.extend(great_grandchild)
			-- Add the cycle:
			grandchild.children.extend(child)

			traversal := bfs(root)
			check traversal.count = 4 end
			check traversal.at(1) = 100 end
			check traversal.at(2) = 200 end
			check traversal.at(3) = 300 end
			check traversal.at(4) = 400 end
			Result := true
		end
end
