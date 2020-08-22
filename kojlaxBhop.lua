CreateClientConVar("cl_autojump", "1", true, false)

--Flag used to check if LocalPlayer has jumped on the previous game tick
HasJumped = false

--adds +bhop command, and defines the function it will call
concommand.Add("+bhop", function()
    --calls a hook that fires every game tick
    hook.Add("Tick", "Bhop Hook", function()

        if GetConVarNumber("cl_autojump") == 1 then
            
            --checks whether the player jumped on the previous game tick
            --This check prevents +jump being held during two consecutive game ticks, preventing input

            if HasJumped == false then

                --check whether conditions are right to jump
                if LocalPlayer():IsOnGround() or (LocalPlayer():WaterLevel() > 0) then
                    RunConsoleCommand("+jump")
                    HasJumped = true

                --I got a little bit excessive with the -jumps and the HasJumped = falses
                --but it fixed the bug I was having, so I am not going to change it
                else 
                    RunConsoleCommand("-jump")
                    HasJumped = false
                end

            else
                RunConsoleCommand("-jump")
                HasJumped = false
            end
        else
            RunConsoleCommand("+jump")
        end
    end)
end)

--adds the -bhop command, called when the +bhop bind is released
concommand.Add("-bhop", function()
    HasJumped = false
    RunConsoleCommand("-jump")
    hook.Remove("Tick", "Bhop Hook") 
end)

--added for personal convenience
concommand.Add("bhop_toggle", function()
    if GetConVarNumber("cl_autojump") == 0 then
        RunConsoleCommand("cl_autojump", "1")
        LocalPlayer():ChatPrint("cl_autojump set to 1!")
        
    else
        RunConsoleCommand("cl_autojump", "0")
        LocalPlayer():ChatPrint("cl_autojump set to 0!")
        
    end
end)