--example actor data
actor={
  x=60,
  y=60,
  sprite={65,81}, --composed of two sprites
  spflip=false,
  speed=1,
 --animations //this is where you will store all your animations in order, one per table
  ani={
   --down
   {
    function() p.sprite[2]=80 p.spflip=false end,
    function() p.sprite[2]=97 end,
    function() p.sprite[2]=81 end,
    function() p.sprite[2]=97 p.spflip=true end
   } --they are functions that the animation function will call 
  } 
 
 }


--function itself
function ani(actor,var,speed) --actor's main table, animation index, how many ticks per frame
 if(not a_ct) a_ct=0
 if(not a_step) a_step=1

 a_ct+=1

 if(a_ct%speed==0) then
  a_step+=1
  if(a_step>#actor.ani[var]) a_step=1
 end
 
 actor.ani[var][a_step]()
end

--use _draw to draw each sprite from actor table where you need it. Use _update with coditions (e.g btn(x)) to call ani and play through animations.
