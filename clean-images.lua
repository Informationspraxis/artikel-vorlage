function Image (elem)
	-- delete the width and height attributes
	elem.attributes.width = nil
	elem.attributes.height = nil
	return elem
end
