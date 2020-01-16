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
			add_boolean_case (agent bfs_of_empty_graph_is_empty)
			--show_browser
			run_espec
		end

feature
	bfs_of_empty_graph_is_empty: BOOLEAN
		local
		do
			comment("test: DRY")
			--check false end
			Result := true
		end
end
