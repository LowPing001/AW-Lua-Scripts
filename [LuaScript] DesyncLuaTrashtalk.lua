local Kill_String = {
    '_ping is back',
    'ping has the best custom desync lua',
    'go buy his lua',
    'impossible to hit me huh',
    'time to buy custom desync lua from ping',
    'imagine not having a custom desync lua script',
    'cant 1 me huh',
    'config problem they said',
    'get aw and the custom desync lua from ping',
    'just 4.99 for the lua script'
}

--local Kill_String = 'get owned';
local Death_String = 
{
    'the lua is still in beta hhhhh',
    'ok I fucked up the lua config made by ping',
    'the lua is getting remade when polak adds some p beta features to the main client'
}



function CHAT_KillSay( Event )

   if ( Event:GetName() == 'player_death' ) then

       local ME = client.GetLocalPlayerIndex();

       local INT_UID = Event:GetInt( 'userid' );
       local INT_ATTACKER = Event:GetInt( 'attacker' );

       local NAME_Victim = client.GetPlayerNameByUserID( INT_UID );
       local INDEX_Victim = client.GetPlayerIndexByUserID( INT_UID );

       local NAME_Attacker = client.GetPlayerNameByUserID( INT_ATTACKER );
       local INDEX_Attacker = client.GetPlayerIndexByUserID( INT_ATTACKER );

       if ( INDEX_Attacker == ME and INDEX_Victim ~= ME ) then

        client.ChatSay ( ' ' .. tostring( Kill_String [ math.random ( 9 ) ] ))

      elseif ( INDEX_Victim == ME and INDEX_Attacker ~= ME ) then
        client.ChatSay ( ' ' .. tostring( Death_String [ math.random ( 3 ) ] ))
      

       end
   
   end

end

client.AllowListener( 'player_death' );

callbacks.Register( 'FireGameEvent', 'AWKS', CHAT_KillSay );