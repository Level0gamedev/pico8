--original by AdamJ: http://www.lexaloffle.com/bbs/?tid=3367

-- is_held(k) is true if the key k is held down
-- is_pressed(k) is true if the key has just been pressed by the user
-- is_released(k) is true if the key has just been released by the user

keys={}

function is_held(k) return band(keys[k], 1) == 1 end
function is_pressed(k) return band(keys[k], 2) == 2 end
function is_released(k) return band(keys[k], 4) == 4 end

function upd_key(k)
if keys[k] == 0 then
if btn(k) then keys[k] = 3 end
elseif keys[k] == 1 then
if btn(k) == false then keys[k] = 4 end
elseif keys[k] == 3 then
if btn(k) then keys[k] = 1
else keys[k] = 4 end
elseif keys[k] == 4 then
if btn(k) then keys[k] = 3
else keys[k] = 0 end
end
end

function init_keys()
for a = 0,5 do keys[a] = 0 end
end

function upd_keys()
for a = 0,5 do upd_key(a) end
end



You need to call these in your _init() and _update() functions:


function _init()
init_keys()
end

function _update()
upd_keys()
end