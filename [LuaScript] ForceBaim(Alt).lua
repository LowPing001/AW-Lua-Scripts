    gui_set = gui.SetValue
    gui_get = gui.GetValue
    c_reg = callbacks.Register
    b_toggle = input.IsButtonDown
    key = "alt"
    local forcebaim = false

    -- Cache old values to restore later --
    local hBox_priority = 0
    local hBox_head = 0
    local hBox_neck = 0
    local hBox_chest = 0
    local hBox_stomach = 0
    local hBox_pelvis = 0
    local hBox_arms = 0
    local hBox_legs = 0
    local hBox_walking = 0

    local hBox_priority1 = 0
    local hBox_head1 = 0
    local hBox_neck1 = 0
    local hBox_chest1 = 0
    local hBox_stomach1 = 0
    local hBox_pelvis1 = 0
    local hBox_arms1 = 0
    local hBox_legs1 = 0
    local hBox_walking1 = 0

    local hBox_priority2 = 0
    local hBox_head2 = 0
    local hBox_neck2 = 0
    local hBox_chest2 = 0
    local hBox_stomach2 = 0
    local hBox_pelvis2 = 0
    local hBox_arms2 = 0
    local hBox_legs2 = 0
    local hBox_walking2 = 0

    local hBox_priority3 = 0
    local hBox_head3 = 0
    local hBox_neck3 = 0
    local hBox_chest3 = 0
    local hBox_stomach3 = 0
    local hBox_pelvis3 = 0
    local hBox_arms3 = 0
    local hBox_legs3 = 0
    local hBox_walking3 = 0

    local hBox_priority4 = 0
    local hBox_head4 = 0
    local hBox_neck4 = 0
    local hBox_chest4 = 0
    local hBox_stomach4 = 0
    local hBox_pelvis4 = 0
    local hBox_arms4 = 0
    local hBox_legs4 = 0
    local hBox_walking4 = 0

    local hBox_priority5 = 0
    local hBox_head5 = 0
    local hBox_neck5 = 0
    local hBox_chest5 = 0
    local hBox_stomach5 = 0
    local hBox_pelvis5 = 0
    local hBox_arms5 = 0
    local hBox_legs5 = 0
    local hBox_walking5 = 0

    local hBox_priority6 = 0
    local hBox_head6 = 0
    local hBox_neck6 = 0
    local hBox_chest6 = 0
    local hBox_stomach6 = 0
    local hBox_pelvis6 = 0
    local hBox_arms6 = 0
    local hBox_legs6 = 0
    local hBox_walking6 = 0

    local hBox_priority7 = 0
    local hBox_head7 = 0
    local hBox_neck7 = 0
    local hBox_chest7 = 0
    local hBox_stomach7 = 0
    local hBox_pelvis7 = 0
    local hBox_arms7 = 0
    local hBox_legs7 = 0
    local hBox_walking7 = 0

    local hBox_priority8 = 0
    local hBox_head8 = 0
    local hBox_neck8 = 0
    local hBox_chest8 = 0
    local hBox_stomach8 = 0
    local hBox_pelvis8 = 0
    local hBox_arms8 = 0
    local hBox_legs8 = 0
    local hBox_walking8 = 0


function ForceBodyaim()
    w, h = draw.GetScreenSize()
    w = w/2
    h = h/2 + 10

    if b_toggle(key) then
        draw.Color(0, 255, 0, 255)
        draw.Text(w,h, "BODYAIMING")

        -- Cache old values to restore later --
        if forcebaim == false then
            hBox_priority = gui_get("rbot_autosniper_hitbox")
            hBox_head = gui_get("rbot_autosniper_hitbox_head")
            hBox_neck = gui_get("rbot_autosniper_hitbox_neck")
            hBox_chest = gui_get("rbot_autosniper_hitbox_chest")
            hBox_stomach = gui_get("rbot_autosniper_hitbox_stomach")
            hBox_pelvis = gui_get("rbot_autosniper_hitbox_pelvis")
            hBox_arms = gui_get("rbot_autosniper_hitbox_arms")
            hBox_legs = gui_get("rbot_autosniper_hitbox_legs")
            hBox_walking = gui_get("rbot_autosniper_headifwalking")

            hBox_priority1 = gui_get("rbot_sniper_hitbox")
            hBox_head1 = gui_get("rbot_sniper_hitbox_head")
            hBox_neck1 = gui_get("rbot_sniper_hitbox_neck")
            hBox_chest1 = gui_get("rbot_sniper_hitbox_chest")
            hBox_stomach1 = gui_get("rbot_sniper_hitbox_stomach")
            hBox_pelvis1 = gui_get("rbot_sniper_hitbox_pelvis")
            hBox_arms1 = gui_get("rbot_sniper_hitbox_arms")
            hBox_legs1 = gui_get("rbot_sniper_hitbox_legs")
            hBox_walking1 = gui_get("rbot_sniper_headifwalking")

            hBox_priority2 = gui_get("rbot_scout_hitbox")
            hBox_head2 = gui_get("rbot_scout_hitbox_head")
            hBox_neck2 = gui_get("rbot_scout_hitbox_neck")
            hBox_chest2 = gui_get("rbot_scout_hitbox_chest")
            hBox_stomach2 = gui_get("rbot_scout_hitbox_stomach")
            hBox_pelvis2 = gui_get("rbot_scout_hitbox_pelvis")
            hBox_arms2 = gui_get("rbot_scout_hitbox_arms")
            hBox_legs2 = gui_get("rbot_scout_hitbox_legs")
            hBox_walking2 = gui_get("rbot_scout_headifwalking")

            hBox_priority3 = gui_get("rbot_rifle_hitbox")
            hBox_head3 = gui_get("rbot_rifle_hitbox_head")
            hBox_neck3 = gui_get("rbot_rifle_hitbox_neck")
            hBox_chest3 = gui_get("rbot_rifle_hitbox_chest")
            hBox_stomach3 = gui_get("rbot_rifle_hitbox_stomach")
            hBox_pelvis3 = gui_get("rbot_rifle_hitbox_pelvis")
            hBox_arms3 = gui_get("rbot_rifle_hitbox_arms")
            hBox_legs3 = gui_get("rbot_rifle_hitbox_legs")
            hBox_walking3 = gui_get("rbot_rifle_headifwalking")

            hBox_priority4 = gui_get("rbot_pistol_hitbox")
            hBox_head4 = gui_get("rbot_pistol_hitbox_head")
            hBox_neck4 = gui_get("rbot_pistol_hitbox_neck")
            hBox_chest4 = gui_get("rbot_pistol_hitbox_chest")
            hBox_stomach4 = gui_get("rbot_pistol_hitbox_stomach")
            hBox_pelvis4 = gui_get("rbot_pistol_hitbox_pelvis")
            hBox_arms4 = gui_get("rbot_pistol_hitbox_arms")
            hBox_legs4 = gui_get("rbot_pistol_hitbox_legs")
            hBox_walking4 = gui_get("rbot_pistol_headifwalking")

            hBox_priority5 = gui_get("rbot_revolver_hitbox")
            hBox_head5 = gui_get("rbot_revolver_hitbox_head")
            hBox_neck5 = gui_get("rbot_revolver_hitbox_neck")
            hBox_chest5 = gui_get("rbot_revolver_hitbox_chest")
            hBox_stomach5 = gui_get("rbot_revolver_hitbox_stomach")
            hBox_pelvis5 = gui_get("rbot_revolver_hitbox_pelvis")
            hBox_arms5 = gui_get("rbot_revolver_hitbox_arms")
            hBox_legs5 = gui_get("rbot_revolver_hitbox_legs")
            hBox_walking5 = gui_get("rbot_revolver_headifwalking")

            hBox_priority6 = gui_get("rbot_smg_hitbox")
            hBox_head6 = gui_get("rbot_smg_hitbox_head")
            hBox_neck6 = gui_get("rbot_smg_hitbox_neck")
            hBox_chest6 = gui_get("rbot_smg_hitbox_chest")
            hBox_stomach6 = gui_get("rbot_smg_hitbox_stomach")
            hBox_pelvis6 = gui_get("rbot_smg_hitbox_pelvis")
            hBox_arms6 = gui_get("rbot_smg_hitbox_arms")
            hBox_legs6 = gui_get("rbot_smg_hitbox_legs")
            hBox_walking6 = gui_get("rbot_smg_headifwalking")

            hBox_priority7 = gui_get("rbot_lmg_hitbox")
            hBox_head7 = gui_get("rbot_lmg_hitbox_head")
            hBox_neck7 = gui_get("rbot_lmg_hitbox_neck")
            hBox_chest7 = gui_get("rbot_lmg_hitbox_chest")
            hBox_stomach7 = gui_get("rbot_lmg_hitbox_stomach")
            hBox_pelvis7 = gui_get("rbot_lmg_hitbox_pelvis")
            hBox_arms7 = gui_get("rbot_lmg_hitbox_arms")
            hBox_legs7 = gui_get("rbot_lmg_hitbox_legs")
            hBox_walking7 = gui_get("rbot_lmg_headifwalking")

            hBox_priority8 = gui_get("rbot_shotgun_hitbox")
            hBox_head8 = gui_get("rbot_shotgun_hitbox_head")
            hBox_neck8 = gui_get("rbot_shotgun_hitbox_neck")
            hBox_chest8 = gui_get("rbot_shotgun_hitbox_chest")
            hBox_stomach8 = gui_get("rbot_shotgun_hitbox_stomach")
            hBox_pelvis8 = gui_get("rbot_shotgun_hitbox_pelvis")
            hBox_arms8 = gui_get("rbot_shotgun_hitbox_arms")
            hBox_legs8 = gui_get("rbot_shotgun_hitbox_legs")
            hBox_walking8 = gui_get("rbot_shotgun_headifwalking")
            forcebaim = true
        end
        gui_set("rbot_autosniper_hitbox", 3)
        gui_set("rbot_autosniper_hitbox_head", 0)
        gui_set("rbot_autosniper_hitbox_neck", 0)

        gui_set("rbot_autosniper_headifwalking", 0)

        gui_set("rbot_sniper_hitbox", 3)
        gui_set("rbot_sniper_hitbox_head", 0)
        gui_set("rbot_sniper_hitbox_neck", 0)

        gui_set("rbot_sniper_headifwalking", 0)

        gui_set("rbot_scout_hitbox", 3)
        gui_set("rbot_scout_hitbox_head", 0)
        gui_set("rbot_scout_hitbox_neck", 0)

        gui_set("rbot_scout_headifwalking", 0)

        gui_set("rbot_rifle_hitbox", 3)
        gui_set("rbot_rifle_hitbox_head", 0)
        gui_set("rbot_rifle_hitbox_neck", 0)

        gui_set("rbot_rifle_headifwalking", 0)

        gui_set("rbot_pistol_hitbox", 3)
        gui_set("rbot_pistol_hitbox_head", 0)
        gui_set("rbot_pistol_hitbox_neck", 0)

        gui_set("rbot_pistol_headifwalking", 0)

        gui_set("rbot_revolver_hitbox", 3)
        gui_set("rbot_revolver_hitbox_head", 0)
        gui_set("rbot_revolver_hitbox_neck", 0)

        gui_set("rbot_revolver_headifwalking", 0)

        gui_set("rbot_smg_hitbox", 3)
        gui_set("rbot_smg_hitbox_head", 0)
        gui_set("rbot_smg_hitbox_neck", 0)

        gui_set("rbot_smg_headifwalking", 0)

        gui_set("rbot_lmg_hitbox", 3)
        gui_set("rbot_lmg_hitbox_head", 0)
        gui_set("rbot_lmg_hitbox_neck", 0)

        gui_set("rbot_lmg_headifwalking", 0)

        gui_set("rbot_shotgun_hitbox", 3)
        gui_set("rbot_shotgun_hitbox_head", 0)
        gui_set("rbot_shotgun_hitbox_neck", 0)

        gui_set("rbot_shotgun_headifwalking", 0)
    else
        if forcebaim == true then
            gui_set("rbot_autosniper_hitbox", hBox_priority)
            gui_set("rbot_autosniper_hitbox_head", hBox_head)
            gui_set("rbot_autosniper_hitbox_neck", hBox_neck)
            gui_set("rbot_autosniper_hitbox_chest", hBox_chest)
            gui_set("rbot_autosniper_hitbox_stomach", hBox_stomach)
            gui_set("rbot_autosniper_hitbox_pelvis", hBox_pelvis)
            gui_set("rbot_autosniper_hitbox_arms", hBox_arms)
            gui_set("rbot_autosniper_hitbox_legs", hBox_legs)
            gui_set("rbot_autosniper_headifwalking", hBox_walking)

            gui_set("rbot_sniper_hitbox", hBox_priority1)
            gui_set("rbot_sniper_hitbox_head", hBox_head1)
            gui_set("rbot_sniper_hitbox_neck", hBox_neck1)
            gui_set("rbot_sniper_hitbox_chest", hBox_chest1)
            gui_set("rbot_sniper_hitbox_stomach", hBox_stomach1)
            gui_set("rbot_sniper_hitbox_pelvis", hBox_pelvis1)
            gui_set("rbot_sniper_hitbox_arms", hBox_arms1)
            gui_set("rbot_sniper_hitbox_legs", hBox_legs1)
            gui_set("rbot_sniper_headifwalking", hBox_walking1)

            gui_set("rbot_scout_hitbox", hBox_priority2)
            gui_set("rbot_scout_hitbox_head", hBox_head2)
            gui_set("rbot_scout_hitbox_neck", hBox_neck2)
            gui_set("rbot_scout_hitbox_chest", hBox_chest2)
            gui_set("rbot_scout_hitbox_stomach", hBox_stomach2)
            gui_set("rbot_scout_hitbox_pelvis", hBox_pelvis2)
            gui_set("rbot_scout_hitbox_arms", hBox_arms2)
            gui_set("rbot_scout_hitbox_legs", hBox_legs2)
            gui_set("rbot_scout_headifwalking", hBox_walking2)

            gui_set("rbot_rifle_hitbox", hBox_priority3)
            gui_set("rbot_rifle_hitbox_head", hBox_head3)
            gui_set("rbot_rifle_hitbox_neck", hBox_neck3)
            gui_set("rbot_rifle_hitbox_chest", hBox_chest3)
            gui_set("rbot_rifle_hitbox_stomach", hBox_stomach3)
            gui_set("rbot_rifle_hitbox_pelvis", hBox_pelvis3)
            gui_set("rbot_rifle_hitbox_arms", hBox_arms3)
            gui_set("rbot_rifle_hitbox_legs", hBox_legs3)
            gui_set("rbot_rifle_headifwalking", hBox_walking3)

            gui_set("rbot_pistol_hitbox", hBox_priority4)
            gui_set("rbot_pistol_hitbox_head", hBox_head4)
            gui_set("rbot_pistol_hitbox_neck", hBox_neck4)
            gui_set("rbot_pistol_hitbox_chest", hBox_chest4)
            gui_set("rbot_pistol_hitbox_stomach", hBox_stomach4)
            gui_set("rbot_pistol_hitbox_pelvis", hBox_pelvis4)
            gui_set("rbot_pistol_hitbox_arms", hBox_arms4)
            gui_set("rbot_pistol_hitbox_legs", hBox_legs4)
            gui_set("rbot_pistol_headifwalking", hBox_walking4)

            gui_set("rbot_revolver_hitbox", hBox_priority5)
            gui_set("rbot_revolver_hitbox_head", hBox_head5)
            gui_set("rbot_revolver_hitbox_neck", hBox_neck5)
            gui_set("rbot_revolver_hitbox_chest", hBox_chest5)
            gui_set("rbot_revolver_hitbox_stomach", hBox_stomach5)
            gui_set("rbot_revolver_hitbox_pelvis", hBox_pelvis5)
            gui_set("rbot_revolver_hitbox_arms", hBox_arms5)
            gui_set("rbot_revolver_hitbox_legs", hBox_legs5)
            gui_set("rbot_revolver_headifwalking", hBox_walking5)

            gui_set("rbot_smg_hitbox", hBox_priority6)
            gui_set("rbot_smg_hitbox_head", hBox_head6)
            gui_set("rbot_smg_hitbox_neck", hBox_neck6)
            gui_set("rbot_smg_hitbox_chest", hBox_chest6)
            gui_set("rbot_smg_hitbox_stomach", hBox_stomach6)
            gui_set("rbot_smg_hitbox_pelvis", hBox_pelvis6)
            gui_set("rbot_smg_hitbox_arms", hBox_arms6)
            gui_set("rbot_smg_hitbox_legs", hBox_legs6)
            gui_set("rbot_smg_headifwalking", hBox_walking6)

            gui_set("rbot_lmg_hitbox", hBox_priority7)
            gui_set("rbot_lmg_hitbox_head", hBox_head7)
            gui_set("rbot_lmg_hitbox_neck", hBox_neck7)
            gui_set("rbot_lmg_hitbox_chest", hBox_chest7)
            gui_set("rbot_lmg_hitbox_stomach", hBox_stomach7)
            gui_set("rbot_lmg_hitbox_pelvis", hBox_pelvis7)
            gui_set("rbot_lmg_hitbox_arms", hBox_arms7)
            gui_set("rbot_lmg_hitbox_legs", hBox_legs7)
            gui_set("rbot_lmg_headifwalking", hBox_walking7)

            gui_set("rbot_shotgun_hitbox", hBox_priority8)
            gui_set("rbot_shotgun_hitbox_head", hBox_head8)
            gui_set("rbot_shotgun_hitbox_neck", hBox_neck8)
            gui_set("rbot_shotgun_hitbox_chest", hBox_chest8)
            gui_set("rbot_shotgun_hitbox_stomach", hBox_stomach8)
            gui_set("rbot_shotgun_hitbox_pelvis", hBox_pelvis8)
            gui_set("rbot_shotgun_hitbox_arms", hBox_arms8)
            gui_set("rbot_shotgun_hitbox_legs", hBox_legs8)
            gui_set("rbot_shotgun_headifwalking", hBox_walking8)
            forcebaim = false
        end
    end
end


c_reg("Draw", "ForceBodyaim", ForceBodyaim)
