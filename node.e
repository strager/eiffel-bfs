note
	description: "Summary description for {NODE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class NODE
create make
feature
	children: ARRAY[NODE]
	data: INTEGER

	make (d: INTEGER)
		do
			data := d
			create children.make_empty
		end
end
