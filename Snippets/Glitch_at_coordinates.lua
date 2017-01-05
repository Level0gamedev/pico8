--a helper function to turn X & Y coordinates to memory adress needed to for glitching with memcpy()
function xy_to_mem(x,y)
  local v = 0x6000 + y*64 + flr(x/2)
  return v
end

--BASIC GLITCHING
--copies and pastes a horizontal sliver of screen 
--from one source to the dest. 
--both source and destination have to be memory adresses
--use xy_to_mem as a parameter to glitch at specific place 
--or flr(rnd(0x6000+8192)) to make it random part of the screen.
--range is the lenght of the line that will be copied and pasted
--if a line extends beyond the screen on the right
--it will wrap around the screen at Y+=1.
function basic_glitch(source,dest,range)
  memcpy(dest,source,range)
end

--messy function that needs more work! use at own risk!
function vertical_glitch(x,y,hight,dis,direction)
 local xy = {}
 for i=1,hight do
  add (xy,xy_to_mem(x,y)+64-i*64)
 end 
 local d = direction or 1
 for i=hight,1,-1 do
  local xydest=xy[i]-(dis*64)
  glitch_line(xy[i],xydest,2) 
 end
end


