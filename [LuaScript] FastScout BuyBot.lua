local function autobuy( event )
   if event:GetName() == "round_prestart" then
       client.Command("buy ssg 08; buy deagle; buy vest; buy vesthelm; buy incgrenade; buy molotov; buy hegrenade; buy smokegrenade", true)
   end
end

client.AllowListener( "round_prestart" );

callbacks.Register( "FireGameEvent", "autobuy", autobuy);