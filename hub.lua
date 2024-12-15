local Mercury = loadstring(game:HttpGet("https://raw.githubusercontent.com/deeeity/mercury-lib/master/src.lua"))()

local GUI = Mercury:Create{
    Name = "Starving's Trolling Panel",
    Size = UDim2.fromOffset(600, 400),
    Theme = Mercury.Themes.Dark,
    Link = "https://github.com/Abovescore/StarvingsTrollingHub"
}

local Tab = GUI:Tab{
	Name = "New Tab",
	Icon = "rbxassetid://74000494301350"
}

Tab:Button{
	Name = "Button",
	Description = nil,
	Callback = function() end
}

Tab:Toggle{
	Name = "Toggle",
	StartingState = false,
	Description = nil,
	Callback = function(state) end
}

Tab:Textbox{
	Name = "Textbox",
	Callback = function(text) end
}

local MyDropdown = Tab:Dropdown{
	Name = "Dropdown",
	StartingText = "Select...",
	Description = nil,
	Items = {
		{"Hello", 1}, 		-- {name, value}
		12,			-- or just value, which is also automatically taken as name
		{"Test", "bump the thread pls"}
	},
	Callback = function(item) return end
}

Tab:Slider{
	Name = "Slider",
	Default = 50,
	Min = 0,
	Max = 100,
	Callback = function() end
}

Tab:Keybind{
	Name = "Keybind",
	Keybind = nil,
	Description = nil
}

GUI:Notification{
	Title = "Alert",
	Text = "You shall bump the thread on V3rmillion!",
	Duration = 3,
	Callback = function() end
}

Tab:ColorPicker{
	Style = Mercury.ColorPickerStyles.Legacy,
	Callback = function(color) end
}

GUI:Credit{
	Name = "Abovescore",
	Description = "Helped with the script",
	V3rm = "link/name",
	Discord = "helo#1234"
}
