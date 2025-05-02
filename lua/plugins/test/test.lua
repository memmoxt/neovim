-- Variables
local name = "Alice"          -- 'name' (Variable/Identifier), "Alice" (String)
local age = 25                -- 'age' (Variable/Identifier), 25 (Number)
local is_active = true        -- 'is_active' (Variable/Identifier), true (Boolean)

-- Table with fields/properties
local person = {
    first_name = "Bob",       -- 'first_name' (Field/Property), "Bob" (String)
    years = 30,               -- 'years' (Field/Property), 30 (Number)
    active = false,           -- 'active' (Field/Property), false (Boolean)
}

-- Function definition
local function greet(user, greeting)  -- 'greet' (Function), 'user' & 'greeting' (Parameter)
    local message = greeting .. " " .. user.first_name  -- 'message' (Variable), 'first_name' (Field), .. (Operator)
    if user.years > 18 then       -- 'if' (Conditional), '>' (Operator), 18 (Number)
        return message            -- 'return' (Keyword)
    else                          -- 'else' (Conditional)
        return "Too young!"
    end
end

-- Function call
local result = greet(person, "Hello")  -- 'greet' (Function), 'result' (Variable)

-- Loops and conditionals
for i = 1, 5 do                -- 'for' (Repeat), 'i' (Variable), 1 & 5 (Number), 'do' (Keyword)
    if i % 2 == 0 then         -- '%' & '==' (Operator), 2 & 0 (Number)
        print("Even: " .. i)   -- 'print' (Function), "Even: " (String)
    end
end

-- Types (in Lua, often just tables or meta tables)
local TypeExample = {}         -- 'TypeExample' (Variable/Type)
TypeExample.__index = TypeExample  -- '__index' (Field/Property)

-- Operators and keywords
local sum = age + person.years  -- '+' (Operator), 'sum' (Variable)
