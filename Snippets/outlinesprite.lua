--outlines sprite with a black line

function ospr(sprite, x,y, outline_col)
 for i=0,15 do
  pal(i,outline_col)
 end
 spr(sprite, x-1,y)
 spr(sprite, x,y-1)
 spr(sprite, x+1,y)
 spr(sprite, x,y+1)
 pal()
 spr(sprite, x,y)
end
