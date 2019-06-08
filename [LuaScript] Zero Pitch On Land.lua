local GroundCounter = 0


local function ZeroPitchAfterLand()
  if entities.GetLocalPlayer() ~= nil then

       local localPlayer = entities.GetLocalPlayer();
       local localPlayerFlags = localPlayer:GetProp("m_fFlags");

 if (localPlayerFlags == 256 or localPlayerFlags == 262) then
  GroundCounter = 0
 end
 
   if (localPlayerFlags == 257 or localPlayerFlags == 261 or localPlayerFlags == 263) then
           GroundCounter = GroundCounter + 1
       end
 
 --draw.Text(0, 50, "Ground counter:" .. GroundCounter)
 
 if GroundCounter > 10 and GroundCounter < 75 then
  gui.SetValue("rbot_antiaim_stand_pitch_real", 4)
  gui.SetValue("rbot_antiaim_move_pitch_real", 4)
 else
 gui.SetValue("rbot_antiaim_stand_pitch_real", 1)
  gui.SetValue("rbot_antiaim_move_pitch_real", 1)
 end
 
 
  end
  
  
  	draw.Color( 220, 50, 50 );
	local g_Font = draw.CreateFont("skeet Smallest Pixel-7 Modified", 20)
    draw.SetFont(g_Font)
	draw.Text( 10, 895, "GroundCounter: " .. GroundCounter);
  
  
  
end

callbacks.Register("Draw", "ZeroPitchAfterLand", ZeroPitchAfterLand);