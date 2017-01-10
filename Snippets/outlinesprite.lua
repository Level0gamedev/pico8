--outlines sprite with a black line
--copied from: https://gist.github.com/ftsf/0b7fda700518d6c2dbe47d480944a4e9

function ospr(sprite, x,y, outline_col) --use x and y where you want to draw normally, outline_col normally 0
 for i=1,15 do
  pal(i,outline_col) --changes each color to 0 / black
 end
 spr(sprite, x-1,y) --draw the shadows 4x offsetting it by 1px (size of outline) do it 8x for better outline (with diagonals on X+/-size,Y+/-size)
 spr(sprite, x,y-1)
 spr(sprite, x+1,y)
 spr(sprite, x,y+1)
 pal()
 spr(sprite, x,y) -- draw a sprite over those shadows
end
