class_name UtilGeneral

static func find_index_by_key(dic:Dictionary, key_to_find: String) -> int:
	var index = 0

	for key in dic.keys():
		if key == key_to_find:
			return index
		index += 1

	# If the key is not found, you can return -1 or any other value to indicate that
	return -1
