local rage_ref =  gui.Reference("MISC", "AUTOMATION","Movement")

local fakeduck = gui.Checkbox( rage_ref, "FakeDuckimp", "FakeDuck Improvment", false)
local fakeduck_mode
local fakeduckkey = gui.GetValue('rbot_antiaim_fakeduck')
local usingfkd = false

local function FakeDuckSetValues()

gui.SetValue('msc_fakelag_mode', 0)
end
local function FakeDuckGetValues()

fakeduck_mode = gui.GetValue('msc_fakelag_mode')
end
local function FakeDuckRestoreValues()

gui.SetValue('msc_fakelag_mode', fakeduck_mode)

end


function FakeDuckFix()
if fakeduck:GetValue() == true and  fakeduckkey ~= nil then
    if input.IsButtonDown( fakeduckkey )  then
			if usingfkd == false then
				FakeDuckGetValues()
				usingfkd = true
			end
			FakeDuckSetValues()
	else
		if usingfkd == true then
			FakeDuckRestoreValues()
            usingfkd = false
		end
				
end
end
end

callbacks.Register( "Draw", "FakeDuckFix", FakeDuckFix);