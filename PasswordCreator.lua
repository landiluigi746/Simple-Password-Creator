--[[
    Lua script that creates a password 
    with given user preferences
--]]

local function createPassword(passlength, symbolsFlag, numFlag, upperFlag)
    
    math.randomseed(os.time())
    
    local charset = "abcdefghijklmnopqrstuvwxyz"
    local password = ""
    
    if symbolsFlag == "Y" then
        charset = charset .. "!@#$%^&*()-_+=<>?/"
    end
    
    if numFlag == "Y" then
        charset = charset .. "0123456789"
    end
    
    if upperFlag == "Y" then
        charset = charset .. "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    end
    
    for i = 1, passlength do
        local rng = math.random(1, #charset)
        password = password .. charset:sub(rng, rng)
    end
    
    return password
    
end

local function main()
    
    print("--------------------------------")
    print("")
    print("        Password creator        ") 
    print("        by landiluigi746        ")
    print("")
    print("--------------------------------")
    print("")
    
    local passLength = ""
    local symbolsFlag = ""
    local numFlag = ""
    local upperFlag = ""
    
    repeat
        print("How long do you want your password to be? ")
        passLength = tonumber(io.read())
    until passLength >= 1
    
    repeat
        print("Do you want symbols in your password (example: * - _ #)? (Yes - Y / No - N)")
        symbolsFlag = io.read("*l")
    until symbolsFlag == "Y" or symbolsFlag == "N"
    
    repeat
        print("Do you want numbers in your password? (Yes - Y / No - N)")
        numFlag = io.read("*l")
    until numFlag == "Y" or numFlag == "N"
    
    repeat
        print("Do you want to use uppercase letters? (Yes - Y / No - N)")
        upperFlag = io.read("*l")
    until upperFlag == "Y" or upperFlag == "N"
    
    local password = createPassword(passLength, symbolsFlag, numFlag, upperFlag)
    print("Your password: " .. password)
end

main()