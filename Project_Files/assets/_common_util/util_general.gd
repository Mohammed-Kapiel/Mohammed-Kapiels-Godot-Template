class_name UtilGeneral

static func find_index_by_key(dic:Dictionary, key_to_find: String) -> int:
	var index = 0

	for key in dic.keys():
		if key == key_to_find:
			return index
		index += 1

	# If the key is not found, you can return -1 or any other value to indicate that
	return -1

static func load_resources_from_folder(folder_path: String) -> Array[Resource]:
	var object_list :Array[Resource]= []
	
	var dir = DirAccess.open(folder_path)
	if dir:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			#hack Needed workaround for export to work.
			file_name = file_name.trim_suffix('.remap')
			var file_path = folder_path + file_name
			if dir.current_is_dir():
				object_list += load_resources_from_folder(file_path + "/")
			else:
				if not file_name.contains(".gd"):
					var resource = load(file_path)
					if resource != null and resource is Resource:
						print(file_path)
						object_list.append(resource)
			file_name = dir.get_next()
	else:
		push_error("An error occurred when trying to access the path: " + folder_path)

	return object_list
