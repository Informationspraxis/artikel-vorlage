function Header(el)
	-- delete points after header number,
	-- e.g.   3.1.    ==>    3.1
	--
	el.c[3][1].c = string.gsub(el.c[3][1].c, "%.$", "")
	return el
end
