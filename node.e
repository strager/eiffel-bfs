note
	description: "Summary description for {NODE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class NODE
create make
feature
	children: ARRAYED_LIST[NODE]
	data: INTEGER

	make (d: INTEGER)
		do
			data := d
			create children.make(0)
		end
end
