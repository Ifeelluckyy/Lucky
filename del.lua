local target = "Click to copy Discord invite"

local function destroyRoot(obj)
    if not obj then return end

    local root = obj
    while root.Parent and root.Parent ~= game and root.Parent ~= game:GetService("CoreGui") do
        root = root.Parent
    end

    pcall(function()
        root:Destroy()
    end)
end

local function check(obj)
    if obj:IsA("TextLabel") and obj.Text == target then
        print("FOUND:", obj:GetFullName())
        destroyRoot(obj)
    end
end

local function scan(container)
    for _, v in ipairs(container:GetDescendants()) do
        check(v)
    end

    container.DescendantAdded:Connect(check)
end

scan(game)

pcall(function()
    scan(game:GetService("CoreGui"))
end)
