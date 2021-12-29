-- If the image caption is a separate paragraph below the
-- image, then this script will move it into the curly braces in
-- Markdown and make sure it is not redundantly present.
-- For example:
--
--   ![](image1.png)
--                      ==>    ![Abb. 1: title](image1.png)
--   Abb. 1: title


local elementstoremove = {}

function Blocks (blocks)
  for i = 1, #blocks-1, 1 do
    -- go through all blocks and look at the current block and the one ahead
    if (blocks[i].t == "Para"
        and #blocks[i].c == 1
        and blocks[i].c[1].t == "Image"
        and blocks[i+1].t == "Para"
        and #blocks[i+1].c >= 1
        and blocks[i+1].c[1].t == "Str") then
      local img = blocks[i].c[1]
      local caption = blocks[i+1].c
      -- if caption is as expected
      if (caption[1].c == "Abbildung" 
           or caption[1].c == "Abb."
           or caption[1].c == "Figure"
           or caption[1].c == "Fig.") then
        if (#img.caption > 0) then
          -- old caption is saved in a special attribute
          img.attributes.oldcaption = pandoc.utils.stringify(img.caption)
        end
        img.caption = caption
        table.insert(elementstoremove, i+1)
      -- if caption is not as expected but redundant
      elseif (pandoc.utils.equals(caption, img.caption)) then
        table.insert(elementstoremove, i+1)
      end
    end
  end
  -- Remove the redundant elements after the previous loop
  -- because otherwise this might interfer with the loop.
  -- Important we go backwards through this list
  for j = #elementstoremove, 1, -1 do
    blocks:remove(elementstoremove[j])
  end
  return blocks
end
