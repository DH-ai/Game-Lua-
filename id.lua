local function f1 (self)

    print("f1")
    self:later() --not yet "delared" local function
end

local function f2 (self)

    print("f2")
    self:later() --not yet "declared" local function   
end
--...
--later in your source declare the "later" function:
local function later (self)

    print("later")   
end

function myClass.new()    -- constructor
    local this = {}

    this = {
        f1 = f1,
        f2 = f2,
        later = later,  --you can access the "later" function through "self"
    }

    setmetatable(this, myClass_mt)

    return this
end