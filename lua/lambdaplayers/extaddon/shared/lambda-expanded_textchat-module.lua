CreateLambdaConvar( "lambdaplayers_text_chatsound", "lambdaplayers/chat_tick.wav", true, false, false, "If Lambda text chat should play a custom sound.", nil, nil, { type = "Text", name = "Chat Tick Sound", category = "Text Chat Options" } )

local function Initialize( self )
    if !self:HookExists( "LambdaPlayerSay", "chatsound" ) then
        self:Hook( "LambdaPlayerSay", "chatsound", function( ply )

            local ChatSound = GetConVar("lambdaplayers_text_chatsound"):GetString()
            if ChatSound != "" then
                sound.Play(ChatSound, Vector(0,0,0), 0)
            end
        end )
    end
end

hook.Add( "LambdaOnInitialize", "ChatSound", Initialize )