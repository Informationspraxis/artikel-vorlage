-- Source: https://stackoverflow.com/questions/57940840/pandoc-lua-filter-to-force-compact-lists

-- Iterate over all blocks in an item, converting 'top-level'
-- Para into Plain blocks.
function compactifyItem (blocks)
  -- step through the list of blocks step-by-step, keeping track of the
  -- element's index in the list in variable `i`, and assign the current
  -- block to `blk`.
  -- 
  for i, blk in ipairs(blocks) do
    if blk.t == 'Para' then
      -- update in item's block list.
      blocks[i] = pandoc.Plain(blk.content)
    end
  end
  return blocks
end

function compactifyList (l)
  -- l.content is an instance of pandoc.List, so the following is equivalent
  -- to pandoc.List.map(l.content, compactifyItem)
  l.content = l.content:map(compactifyItem)
  return l
end

return {{
  BulletList = compactifyList,
  OrderedList = compactifyList
}}
