--// Services 
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local coreGui = game:GetService("CoreGui")
local uis = game:GetService("UserInputService")
local StarterGui = game:GetService("StarterGui")

-- vars
local plr = Players.LocalPlayer
local mouse = plr:GetMouse()
local tweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
local viewport = workspace.CurrentCamera.ViewportSize

local Library = {}

function Library:validate(defaults, options)
	for i, v in pairs(defaults) do
		if options[i] == nil then
			options[i] = v
		end
	end
	return options
end

function Library:SendNotification(title, text, duration)
	duration = duration or 5 -- default duration 5 seconds

	StarterGui:SetCore("SendNotification", {
		Title = title,
		Text = text,
		Duration = duration or 5,
	})
end

function Library:tween(object, goal, callback)
	local tween = TweenService:Create(object, tweenInfo, goal)

	if callback then
		tween.Completed:Connect(callback)
	end

	tween:Play()
end

function Library:Destroy()
	
end

function Library:Init(options)
	options = Library:validate({
		
		title = "UI Library!",
		keybind = Enum.KeyCode.RightControl,
		visible = false,
		color = Color3.fromRGB(50, 50, 50)
	}, options or {})
	
	local GUI = {
		CurrentTab = nil
	}
	
	if not options["visible"] then
		options["keybind"] = nil
	end
	
	
	--Main Frame
	do
		-- StarterGui.MyLibrary
		GUI["1"] = Instance.new("ScreenGui", RunService:IsStudio() and Players.LocalPlayer:WaitForChild("PlayerGui") or coreGui);
		GUI["1"]["Name"] = [[MyLibrary]];
		GUI["1"]["IgnoreGuiInset"] = true


		-- StarterGui.MyLibrary.Main
		GUI["2"] = Instance.new("Frame", GUI["1"]);
		GUI["2"]["BorderSizePixel"] = 0;
		GUI["2"]["BackgroundColor3"] = options["color"];
		GUI["2"]["Size"] = UDim2.new(0, 526, 0, 337);
		GUI["2"]["Position"] = UDim2.new(0.34138, 0, 0.28752, 0);
		GUI["2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["2"]["Name"] = [[Main]];
		GUI["2"]["Visible"] = options["visible"];


		-- StarterGui.MyLibrary.Main.UICorner
		GUI["3"] = Instance.new("UICorner", GUI["2"]);
		GUI["3"]["CornerRadius"] = UDim.new(0, 12);
		
		-- StarterGui.MyLibrary.Main.TopBar
		GUI["4"] = Instance.new("Frame", GUI["2"]);
		GUI["4"]["BorderSizePixel"] = 0;
		GUI["4"]["BackgroundColor3"] = options["color"];
		GUI["4"]["Size"] = UDim2.new(1, 0, 0, 50);
		GUI["4"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["4"]["Name"] = [[TopBar]];


		-- StarterGui.MyLibrary.Main.TopBar.UICorner
		GUI["5"] = Instance.new("UICorner", GUI["4"]);



		-- StarterGui.MyLibrary.Main.TopBar.Line
		GUI["6"] = Instance.new("Frame", GUI["4"]);
		GUI["6"]["BorderSizePixel"] = 0;
		GUI["6"]["BackgroundColor3"] = Color3.fromRGB(68, 68, 68);
		GUI["6"]["Size"] = UDim2.new(1, 0, 0, 5);
		GUI["6"]["Position"] = UDim2.new(0, 0, 0.88706, 0);
		GUI["6"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["6"]["Name"] = [[Line]];


		-- StarterGui.MyLibrary.Main.TopBar.Buttons
		GUI["7"] = Instance.new("Frame", GUI["4"]);
		GUI["7"]["BorderSizePixel"] = 0;
		GUI["7"]["BackgroundColor3"] = options["color"];
		GUI["7"]["Size"] = UDim2.new(0, 80, 0, 30);
		GUI["7"]["Position"] = UDim2.new(0.81369, 0, 0.16731, 0);
		GUI["7"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["7"]["Name"] = [[Buttons]];


		-- StarterGui.MyLibrary.Main.TopBar.Buttons.UICorner
		GUI["8"] = Instance.new("UICorner", GUI["7"]);



		-- StarterGui.MyLibrary.Main.TopBar.Buttons.Line
		GUI["9"] = Instance.new("Frame", GUI["7"]);
		GUI["9"]["BorderSizePixel"] = 0;
		GUI["9"]["BackgroundColor3"] = Color3.fromRGB(68, 68, 68);
		GUI["9"]["Size"] = UDim2.new(0, 2, 0, 30);
		GUI["9"]["Position"] = UDim2.new(0.5, 0, 0, 0);
		GUI["9"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["9"]["Name"] = [[Line]];


		-- StarterGui.MyLibrary.Main.TopBar.Buttons.Minimize
		GUI["a"] = Instance.new("TextButton", GUI["7"]);
		GUI["a"]["TextWrapped"] = true;
		GUI["a"]["BorderSizePixel"] = 0;
		GUI["a"]["TextSize"] = 14;
		GUI["a"]["TextScaled"] = true;
		GUI["a"]["TextColor3"] = Color3.fromRGB(201, 201, 201);
		GUI["a"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		GUI["a"]["FontFace"] = Font.new([[rbxasset://fonts/families/FredokaOne.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
		GUI["a"]["BackgroundTransparency"] = 1;
		GUI["a"]["Size"] = UDim2.new(0.5, 0, 1, 0);
		GUI["a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["a"]["Text"] = [[-]];
		GUI["a"]["Name"] = [[Minimize]];


		-- StarterGui.MyLibrary.Main.TopBar.Buttons.Minimize.UICorner
		GUI["b"] = Instance.new("UICorner", GUI["a"]);
		GUI["b"]["CornerRadius"] = UDim.new(0, 4);


		-- StarterGui.MyLibrary.Main.TopBar.Buttons.UIStroke
		GUI["c"] = Instance.new("UIStroke", GUI["7"]);
		GUI["c"]["Thickness"] = 2.5;
		GUI["c"]["Color"] = Color3.fromRGB(68, 68, 68);


		-- StarterGui.MyLibrary.Main.TopBar.Buttons.Close
		GUI["d"] = Instance.new("TextButton", GUI["7"]);
		GUI["d"]["TextWrapped"] = true;
		GUI["d"]["BorderSizePixel"] = 0;
		GUI["d"]["TextSize"] = 14;
		GUI["d"]["TextScaled"] = true;
		GUI["d"]["TextColor3"] = Color3.fromRGB(201, 201, 201);
		GUI["d"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		GUI["d"]["FontFace"] = Font.new([[rbxasset://fonts/families/FredokaOne.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
		GUI["d"]["BackgroundTransparency"] = 1;
		GUI["d"]["Size"] = UDim2.new(0.5, 0, 1, 0);
		GUI["d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["d"]["Text"] = [[X]];
		GUI["d"]["Name"] = [[Close]];
		GUI["d"]["Position"] = UDim2.new(0.5, 0, 0, 0);


		-- StarterGui.MyLibrary.Main.TopBar.Buttons.Close.UICorner
		GUI["e"] = Instance.new("UICorner", GUI["d"]);
		GUI["e"]["CornerRadius"] = UDim.new(0, 4);


		-- StarterGui.MyLibrary.Main.TopBar.TItle
		GUI["f"] = Instance.new("TextLabel", GUI["4"]);
		GUI["f"]["TextWrapped"] = true;
		GUI["f"]["BorderSizePixel"] = 0;
		GUI["f"]["TextSize"] = 14;
		GUI["f"]["TextXAlignment"] = Enum.TextXAlignment.Left;
		GUI["f"]["TextScaled"] = true;
		GUI["f"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		GUI["f"]["FontFace"] = Font.new([[rbxasset://fonts/families/Ubuntu.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
		GUI["f"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
		GUI["f"]["BackgroundTransparency"] = 1;
		GUI["f"]["Size"] = UDim2.new(0, 154, 0, 27);
		GUI["f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["f"]["Text"] = options["title"];
		GUI["f"]["Name"] = [[TItle]];
		GUI["f"]["Position"] = UDim2.new(0.03612, 0, 0.18654, 0);
		
		GUI["d"].MouseButton1Click:Connect(function()
			GUI["2"]["Visible"] = false
		end)
	end
	
	local key = options.keybind or Enum.KeyCode.RightControl
	local gui = GUI["2"] -- your ScreenGui
	
	
	gui.Active = true
	gui.Selectable = true
	gui.Draggable = true

	uis.InputBegan:Connect(function(input, gpe)
		if gpe then return end -- ignore typing in chat

		if input.KeyCode == key then
			gui.Visible = not gui.Visible
			Library:SendNotification("The UI has been closed/open.", "Please press on " .. key.Name .. " to open/close it again!")
		end
	end)
	GUI["a"]["MouseButton1Click"]:Connect(function()
		gui.Visible = not gui.Visible
		Library:SendNotification("The UI has been closed", "You must press on " .. key.Name .. " to open it again!")
	end)
	
	
	-- navigation
	do
		-- StarterGui.MyLibrary.Main.Navigation
		GUI["10"] = Instance.new("Frame", GUI["2"]);
		GUI["10"]["BorderSizePixel"] = 0;
		GUI["10"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		GUI["10"]["Size"] = UDim2.new(1, 0, 0, 285);
		GUI["10"]["Position"] = UDim2.new(0, 0, 0.1543, 0);
		GUI["10"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["10"]["Name"] = [[Navigation]];
		GUI["10"]["BackgroundTransparency"] = 1;


		-- StarterGui.MyLibrary.Main.Navigation.Line
		GUI["11"] = Instance.new("Frame", GUI["10"]);
		GUI["11"]["BorderSizePixel"] = 0;
		GUI["11"]["BackgroundColor3"] = Color3.fromRGB(68, 68, 68);
		GUI["11"]["Size"] = UDim2.new(0, 286, 0, 4);
		GUI["11"]["Position"] = UDim2.new(0, 0, 0.492, 0);
		GUI["11"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["11"]["Name"] = [[Line]];
		GUI["11"]["Rotation"] = 90;


		-- StarterGui.MyLibrary.Main.Navigation.SideButtons
		GUI["12"] = Instance.new("Frame", GUI["10"]);
		GUI["12"]["BorderSizePixel"] = 0;
		GUI["12"]["BackgroundColor3"] = Color3.fromRGB(87, 87, 87);
		GUI["12"]["Size"] = UDim2.new(0, 121, 0, 266);
		GUI["12"]["Position"] = UDim2.new(0.02281, 0, 0.04211, 0);
		GUI["12"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["12"]["Name"] = [[SideButtons]];
		GUI["12"]["BackgroundTransparency"] = 1;


		-- StarterGui.MyLibrary.Main.Navigation.SideButtons.UIListLayout
		GUI["13"] = Instance.new("UIListLayout", GUI["12"]);
		GUI["13"]["Padding"] = UDim.new(0, 4);
		GUI["13"]["SortOrder"] = Enum.SortOrder.LayoutOrder;
	end
	
	function GUI:Destroy()
		GUI["1"]:Destroy()
	end
	
	function GUI:Visible(options)
		options = Library:validate({
			wait_time = 10,
		}, options or {})
		GUI["1"].Enabled = true -- enable the ScreenGui
		wait(options["wait_time"])
		GUI["2"].Visible = true
		
	end
	
	function GUI:CreateTab(options)
		options = Library:validate({
			title = "Tab Button Tester",
			icon = "rbxassetid://126315809462831"
		}, options or {})
		
		local Tab = {
			Hover = false,
			Active = false,

		}
	
		
		-- Render
		do
			-- StarterGui.MyLibrary.Main.Navigation.SideButtons.Inactive
			Tab["17"] = Instance.new("Frame", GUI["12"]);
			Tab["17"]["BorderSizePixel"] = 0;
			Tab["17"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
			Tab["17"]["Size"] = UDim2.new(0, 121, 0, 31);
			Tab["17"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			Tab["17"]["Name"] = [[InformationButtonFrame]];
			Tab["17"]["BackgroundTransparency"] = 1;


			-- StarterGui.MyLibrary.Main.Navigation.SideButtons.Inactive.Image
			Tab["18"] = Instance.new("ImageLabel", Tab["17"]);
			Tab["18"]["BorderSizePixel"] = 0;
			Tab["18"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
			Tab["18"]["ImageColor3"] = Color3.fromRGB(159, 159, 159);
			Tab["18"]["Image"] = options.icon;
			Tab["18"]["Size"] = UDim2.new(0, 23, 0, 23);
			Tab["18"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			Tab["18"]["BackgroundTransparency"] = 1;
			Tab["18"]["Name"] = [[Image]];
			Tab["18"]["Position"] = UDim2.new(0.05785, 0, 0.12903, 0);


			-- StarterGui.MyLibrary.Main.Navigation.SideButtons.Inactive.TextButton
			Tab["19"] = Instance.new("TextButton", Tab["17"]);
			Tab["19"]["TextWrapped"] = true;
			Tab["19"]["BorderSizePixel"] = 0;
			Tab["19"]["TextSize"] = 14;
			Tab["19"]["TextScaled"] = true;
			Tab["19"]["TextColor3"] = Color3.fromRGB(166, 166, 166);
			Tab["19"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
			Tab["19"]["FontFace"] = Font.new([[rbxasset://fonts/families/FredokaOne.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
			Tab["19"]["BackgroundTransparency"] = 1;
			Tab["19"]["Size"] = UDim2.new(0, 67, 0, 20);
			Tab["19"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			Tab["19"]["Text"] = options.title;
			Tab["19"]["Position"] = UDim2.new(0.31405, 0, 0.16129, 0);
			
			-- StarterGui.MyLibrary.Main.Navigation.HomeTab
			Tab["1a"] = Instance.new("ScrollingFrame", GUI["10"]);
			Tab["1a"]["Active"] = true;
			Tab["1a"]["BorderSizePixel"] = 0;
			Tab["1a"]["CanvasPosition"] = Vector2.new(0, 100);
			Tab["1a"]["Name"] = [[HomeTab]];
			Tab["1a"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
			Tab["1a"]["Size"] = UDim2.new(0.719, 0, 0, 285);
			Tab["1a"]["ScrollBarImageColor3"] = Color3.fromRGB(0, 0, 0);
			Tab["1a"]["Position"] = UDim2.new(0.281, 0, 0, 0);
			Tab["1a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			Tab["1a"]["BackgroundTransparency"] = 1;
			Tab["1a"]["Visible"] = false;
			
			-- StarterGui.MyLibrary.Main.Navigation.HomeTab.UIListLayout
			Tab["1b"] = Instance.new("UIListLayout", Tab["1a"]);
			Tab["1b"]["Padding"] = UDim.new(0, 10);
			Tab["1b"]["SortOrder"] = Enum.SortOrder.LayoutOrder;


			-- StarterGui.MyLibrary.Main.Navigation.HomeTab.UIPadding
			Tab["1c"] = Instance.new("UIPadding", Tab["1a"]);
			Tab["1c"]["PaddingTop"] = UDim.new(0, 10);
			Tab["1c"]["PaddingLeft"] = UDim.new(0.04, 0);

		end
		
		
		-- Methods
		
		function Tab:Activate()
			if not Tab.Active then
				Tab.Active = true
				if GUI.CurrentTab then
					GUI.CurrentTab:Deactivate()
				end
				
				
				Library:tween(Tab["17"], {BackgroundTransparency = .8})
				Library:tween(Tab["19"], {TextColor3 = Color3.fromRGB(255, 255, 255)})
				Library:tween(Tab["18"], {ImageColor3 = Color3.fromRGB(255, 255, 255)})
				Tab["1a"]["Visible"] = true
				
				GUI.CurrentTab = Tab
			end
		end
		
		function Tab:Deactivate()
			if Tab.Active then
				Tab.Active = false
				Tab.Hover = false
				Library:tween(Tab["19"], {TextColor3 = Color3.fromRGB(165, 165, 165)})
				Library:tween(Tab["18"], {ImageColor3 = Color3.fromRGB(165, 165, 165)})
				Library:tween(Tab["17"], {BackgroundTransparency = 1})
				Tab["1a"]["Visible"] = false
			end
		end
		
		
		
		-- Logics
		do
			Tab["19"].MouseEnter:Connect(function()
				Tab.Hover = true
				if not Tab.Active then
					Library:tween(Tab["19"], {TextColor3 = Color3.fromRGB(255, 255, 255)})
					Library:tween(Tab["18"], {ImageColor3 = Color3.fromRGB(255, 255, 255)})
				end
			end)

			Tab["19"].MouseLeave:Connect(function()
				Tab.Hover = false

				if not Tab.Active then
					Library:tween(Tab["19"], {TextColor3 = Color3.fromRGB(165, 165, 165)})
					Library:tween(Tab["18"], {ImageColor3 = Color3.fromRGB(165, 165, 165)})
				end
			end)

			Tab["19"].MouseButton1Click:Connect(function()
				Tab:Activate()
			end)

			if GUI.CurrentTab == nil then
				Tab:Activate()
			end
		end
		
		function Tab:Button(options)
			options = Library:validate({
				title = "Preview Button",
				callback = function() end
			}, options or {})
			
			local Button = {
				Hover = false,
				MouseDown = false
			}
			
			-- button render
			do
				-- StarterGui.MyLibrary.Main.Navigation.HomeTab.Button
				Button["1d"] = Instance.new("Frame", Tab["1a"]);
				Button["1d"]["BorderSizePixel"] = 0;
				Button["1d"]["BackgroundColor3"] = Color3.fromRGB(39, 39, 39);
				Button["1d"]["Size"] = UDim2.new(0.95, 0, 0.00364, 40);
				Button["1d"]["Position"] = UDim2.new(-0, 0, 0, 0);
				Button["1d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Button["1d"]["Name"] = [[Button]];


				-- StarterGui.MyLibrary.Main.Navigation.HomeTab.Button.UICorner
				Button["1e"] = Instance.new("UICorner", Button["1d"]);
				Button["1e"]["CornerRadius"] = UDim.new(0, 9);


				-- StarterGui.MyLibrary.Main.Navigation.HomeTab.Button.LabelText
				Button["1f"] = Instance.new("TextLabel", Button["1d"]);
				Button["1f"]["TextWrapped"] = true;
				Button["1f"]["BorderSizePixel"] = 0;
				Button["1f"]["TextSize"] = 14;
				Button["1f"]["TextScaled"] = true;
				Button["1f"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Button["1f"]["FontFace"] = Font.new([[rbxasset://fonts/families/FredokaOne.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
				Button["1f"]["TextColor3"] = Color3.fromRGB(207, 207, 207);
				Button["1f"]["BackgroundTransparency"] = 1;
				Button["1f"]["Size"] = UDim2.new(0.27679, 0, -0.12821, 29);
				Button["1f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Button["1f"]["Text"] = options["title"];
				Button["1f"]["Name"] = [[LabelText]];
				Button["1f"]["Position"] = UDim2.new(0.03175, 0, 0.19957, 0);


				-- StarterGui.MyLibrary.Main.Navigation.HomeTab.Button.UIStroke
				Button["20"] = Instance.new("UIStroke", Button["1d"]);
				Button["20"]["Thickness"] = 2.4;
				Button["20"]["Color"] = Color3.fromRGB(81, 81, 81);


				-- StarterGui.MyLibrary.Main.Navigation.HomeTab.Button.Icon
				Button["21"] = Instance.new("ImageButton", Button["1d"]);
				Button["21"]["BorderSizePixel"] = 0;
				Button["21"]["BackgroundTransparency"] = 1;
				Button["21"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Button["21"]["Image"] = [[rbxassetid://126315809462831]];
				Button["21"]["Size"] = UDim2.new(0.0696, 0, -0.05347, 27);
				Button["21"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Button["21"]["Name"] = [[Icon]];
				Button["21"]["Position"] = UDim2.new(0.89588, 0, 0.16652, 0);
			end
			
			
			-- Methods
			function Button:SetText(txt)
				Button["1f"].Text = txt
			end
			
			
			function Button:SetCallback(fn)
				options.callback = fn
			end
			
			-- logic
			do
				Button["1d"].MouseEnter:Connect(function()
					Button.Hover = true
					Library:tween(Button["20"], {Color = Color3.fromRGB(100, 100, 100)})

				end)
				
				Button["21"].MouseLeave:Connect(function()
					Button.Hover = false
					if not Button.MouseDown then
						Library:tween(Button["20"], {Color = Color3.fromRGB(81, 81, 81)})
						Library:tween(Button["1d"], {BackgroundColor3 = Color3.fromRGB(39, 39, 39)})

					end
				end)
				
				Button["21"].MouseButton1Down:Connect(function()
					Button.MouseDown = true
					Library:tween(Button["1d"], {BackgroundColor3 = Color3.fromRGB(200, 200, 200)})
					Library:tween(Button["20"], {Color = Color3.fromRGB(200, 200, 200)})
				end)

				Button["21"].MouseButton1Up:Connect(function()
					if Button.MouseDown then
						Button.MouseDown = false

						Library:tween(Button["1d"], {BackgroundColor3 = Color3.fromRGB(39, 39, 39)})
						Library:tween(Button["20"], {Color = Color3.fromRGB(200, 200, 200)})

						options.callback()
					end
				end)
				
			end
			
			
			
			return Button
		end
		
		function Tab:Toggle(options)
			options = Library:validate({
				title = "Preview Toggle",
				callback = function() end
			}, options or {})
			
			local Toggle = {
				Hover = false,
				MouseDown = false,
				State = false
			}
			
			-- Render
			do
				-- StarterGui.MyLibrary.Main.Navigation.HomeTab.ToggleInactive
				Toggle["2f"] = Instance.new("Frame", Tab["1a"]);
				Toggle["2f"]["BorderSizePixel"] = 0;
				Toggle["2f"]["BackgroundColor3"] = Color3.fromRGB(0, 8, 23);
				Toggle["2f"]["Size"] = UDim2.new(0.95, 0, -0.00066, 40);
				Toggle["2f"]["Position"] = UDim2.new(-0, 0, 0.09914, 0);
				Toggle["2f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Toggle["2f"]["Name"] = [[ToggleInactive]];


				-- StarterGui.MyLibrary.Main.Navigation.HomeTab.ToggleInactive.UICorner
				Toggle["30"] = Instance.new("UICorner", Toggle["2f"]);
				Toggle["30"]["CornerRadius"] = UDim.new(0, 9);


				-- StarterGui.MyLibrary.Main.Navigation.HomeTab.ToggleInactive.Title
				Toggle["31"] = Instance.new("TextLabel", Toggle["2f"]);
				Toggle["31"]["TextWrapped"] = true;
				Toggle["31"]["BorderSizePixel"] = 0;
				Toggle["31"]["TextSize"] = 14;
				Toggle["31"]["TextXAlignment"] = Enum.TextXAlignment.Left;
				Toggle["31"]["TextScaled"] = true;
				Toggle["31"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Toggle["31"]["FontFace"] = Font.new([[rbxasset://fonts/families/FredokaOne.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
				Toggle["31"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
				Toggle["31"]["BackgroundTransparency"] = 1;
				Toggle["31"]["Size"] = UDim2.new(0.17527, 0, -0.0942, 29);
				Toggle["31"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Toggle["31"]["Text"] = options.title;
				Toggle["31"]["Name"] = [[Title]];
				Toggle["31"]["Position"] = UDim2.new(0.03175, 0, 0.191, 0);


				-- StarterGui.MyLibrary.Main.Navigation.HomeTab.ToggleInactive.UIStroke
				Toggle["32"] = Instance.new("UIStroke", Toggle["2f"]);
				Toggle["32"]["Thickness"] = 2.4;
				Toggle["32"]["Color"] = Color3.fromRGB(54, 54, 54);


				-- StarterGui.MyLibrary.Main.Navigation.HomeTab.ToggleInactive.CheckMarkHolder
				Toggle["33"] = Instance.new("Frame", Toggle["2f"]);
				Toggle["33"]["BorderSizePixel"] = 0;
				Toggle["33"]["BackgroundColor3"] = Color3.fromRGB(135, 135, 135);
				Toggle["33"]["Size"] = UDim2.new(0.06813, 0, 0.63757, 0);
				Toggle["33"]["Position"] = UDim2.new(0.90469, 0, 0.191, 0);
				Toggle["33"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Toggle["33"]["Name"] = [[CheckMarkHolder]];


				-- StarterGui.MyLibrary.Main.Navigation.HomeTab.ToggleInactive.CheckMarkHolder.UICorner
				Toggle["34"] = Instance.new("UICorner", Toggle["33"]);
				Toggle["34"]["CornerRadius"] = UDim.new(0, 5);


				-- StarterGui.MyLibrary.Main.Navigation.HomeTab.ToggleInactive.CheckMarkHolder.ImageLabel
				Toggle["35"] = Instance.new("ImageButton", Toggle["33"]);
				Toggle["35"]["BorderSizePixel"] = 0;
				Toggle["35"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Toggle["35"]["ImageTransparency"] = 1;
				Toggle["35"]["Image"] = [[rbxassetid://92048215147085]];
				Toggle["35"]["Size"] = UDim2.new(1, 0, 1, 0);
				Toggle["35"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Toggle["35"]["BackgroundTransparency"] = 1;
			end
			
			-- methods
			
			do
				function Toggle:Toggle(boolean)
					if boolean == nil then
						Toggle.State = not Toggle.State
					else
						Toggle.State = boolean
					end
					
					if Toggle.State then
						Library:tween(Toggle["33"], {BackgroundColor3 = Color3.fromRGB(0, 200, 0)})
						Library:tween(Toggle["35"], {ImageTransparency = 0})
					else
						Library:tween(Toggle["33"], {BackgroundColor3 = Color3.fromRGB(135, 135, 135)})
						Library:tween(Toggle["35"], {ImageTransparency = 1})
					end
					
					
					
					options.callback(Toggle.State)
				end
			end
			
			--Logic
			do
				Toggle["2f"].MouseEnter:Connect(function()
					Toggle.Hover = true
					Library:tween(Toggle["2f"], {BackgroundColor3 = Color3.fromRGB(100, 100, 100)})

				end)

				Toggle["2f"].MouseLeave:Connect(function()
					Toggle.Hover = false
					if not Toggle.MouseDown then
						Library:tween(Toggle["2f"], {BackgroundColor3 = Color3.fromRGB(39, 39, 39)})

					end
				end)

				Toggle["35"].MouseButton1Down:Connect(function()
					Toggle.MouseDown = true
				end)

				Toggle["35"].MouseButton1Up:Connect(function()
					if Toggle.MouseDown then
						Toggle.MouseDown = false
						Toggle:Toggle()
					end
				end)
			end
			return Toggle
		end
		
		function Tab:Label(options)
			options = Library:validate({
				Text = "Preview Text",
			}, options or {})

			local Label = {
				Hover = false,
				MouseDown = false
			}
			
			-- Render
			do
				-- StarterGui.MyLibrary.Main.Navigation.HomeTab.Label
				Label["22"] = Instance.new("Frame", Tab["1a"]);
				Label["22"]["BorderSizePixel"] = 0;
				Label["22"]["BackgroundColor3"] = Color3.fromRGB(0, 8, 23);
				Label["22"]["Size"] = UDim2.new(0.95, 0, -0.01022, 40);
				Label["22"]["Position"] = UDim2.new(-0, 0, 0.09292, 0);
				Label["22"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Label["22"]["Name"] = [[Label]];


				-- StarterGui.MyLibrary.Main.Navigation.HomeTab.Label.UICorner
				Label["23"] = Instance.new("UICorner", Label["22"]);
				Label["23"]["CornerRadius"] = UDim.new(0, 9);


				-- StarterGui.MyLibrary.Main.Navigation.HomeTab.Label.LabelText
				Label["24"] = Instance.new("TextLabel", Label["22"]);
				Label["24"]["TextWrapped"] = true;
				Label["24"]["BorderSizePixel"] = 0;
				Label["24"]["TextSize"] = 14;
				Label["24"]["TextXAlignment"] = Enum.TextXAlignment.Left;
				Label["24"]["TextScaled"] = true;
				Label["24"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Label["24"]["FontFace"] = Font.new([[rbxasset://fonts/families/FredokaOne.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
				Label["24"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
				Label["24"]["BackgroundTransparency"] = 1;
				Label["24"]["Size"] = UDim2.new(0.93527, 0, -0.18055, 29);
				Label["24"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Label["24"]["Name"] = [[LabelText]];
				Label["24"]["Text"] = options.Text;
				Label["24"]["Position"] = UDim2.new(0.03175, 0, 0.15945, 0);


				-- StarterGui.MyLibrary.Main.Navigation.HomeTab.Label.UIStroke
				Label["25"] = Instance.new("UIStroke", Label["22"]);
				Label["25"]["Thickness"] = 2.4;
				Label["25"]["Color"] = Color3.fromRGB(54, 54, 54);
			end
			
			-- Methods
			do
				
			end
			
			--/ logics
			do
				Label["22"].MouseEnter:Connect(function()
					Label.Hover = true
					Library:tween(Label["22"], {BackgroundColor3 = Color3.fromRGB(57,57,57)})
					Library:tween(Label["25"], {Color = Color3.fromRGB(100, 100, 100)})
				end)

				Label["22"].MouseLeave:Connect(function()
					Label.Hover = false
					if not Label.MouseDown then
						Library:tween(Label["22"], {BackgroundColor3 = Color3.fromRGB(0, 8, 23)})
						Library:tween(Label["25"], {Color = Color3.fromRGB(54, 54, 54)})

					end
				end)
			end
			
			return Label
		end
		
		
		
		
		
		function Tab:Slider(options)
			options = Library:validate({
				title = "Slider",
				min = 0,
				max = 100,
				default = 50,
				callback = function(v) print(v) end
			}, options or {})

			local Slider = {
				MouseDown = false,
				Hover = false,
				Connection = nil,
				Options = options
			}
			
			--render
			do
				-- StarterGui.MyLibrary.Main.Navigation.HomeTab.Slider
				Slider["26"] = Instance.new("Frame", Tab["1a"]);
				Slider["26"]["BorderSizePixel"] = 0;
				Slider["26"]["BackgroundColor3"] = Color3.fromRGB(0, 8, 23);
				Slider["26"]["Size"] = UDim2.new(0.95, 0, 0.02909, 40);
				Slider["26"]["Position"] = UDim2.new(-0, 0, 0.57455, 0);
				Slider["26"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Slider["26"]["Name"] = [[Slider]];


				-- StarterGui.MyLibrary.Main.Navigation.HomeTab.Slider.UICorner
				Slider["27"] = Instance.new("UICorner", Slider["26"]);
				Slider["27"]["CornerRadius"] = UDim.new(0, 9);


				-- StarterGui.MyLibrary.Main.Navigation.HomeTab.Slider.Title
				Slider["28"] = Instance.new("TextLabel", Slider["26"]);
				Slider["28"]["TextWrapped"] = true;
				Slider["28"]["BorderSizePixel"] = 0;
				Slider["28"]["TextSize"] = 14;
				Slider["28"]["TextXAlignment"] = Enum.TextXAlignment.Left;
				Slider["28"]["TextScaled"] = true;
				Slider["28"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Slider["28"]["FontFace"] = Font.new([[rbxasset://fonts/families/FredokaOne.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
				Slider["28"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
				Slider["28"]["BackgroundTransparency"] = 1;
				Slider["28"]["Size"] = UDim2.new(0.17527, 0, -0.25321, 29);
				Slider["28"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Slider["28"]["Text"] =options.title;
				Slider["28"]["Name"] = [[Title]];
				Slider["28"]["Position"] = UDim2.new(0.03175, 0, 0.15945, 0);


				-- StarterGui.MyLibrary.Main.Navigation.HomeTab.Slider.UIStroke
				Slider["29"] = Instance.new("UIStroke", Slider["26"]);
				Slider["29"]["Thickness"] = 2.4;
				Slider["29"]["Color"] = Color3.fromRGB(54, 54, 54);


				-- StarterGui.MyLibrary.Main.Navigation.HomeTab.Slider.Title
				Slider["2a"] = Instance.new("TextLabel", Slider["26"]);
				Slider["2a"]["TextWrapped"] = true;
				Slider["2a"]["BorderSizePixel"] = 0;
				Slider["2a"]["TextSize"] = 14;
				Slider["2a"]["TextScaled"] = true;
				Slider["2a"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Slider["2a"]["FontFace"] = Font.new([[rbxasset://fonts/families/FredokaOne.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
				Slider["2a"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
				Slider["2a"]["BackgroundTransparency"] = 1;
				Slider["2a"]["Size"] = UDim2.new(0.17527, 0, -0.25321, 29);
				Slider["2a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Slider["2a"]["Text"] = tostring(options.default);
				Slider["2a"]["Name"] = [[Title]];
				Slider["2a"]["Position"] = UDim2.new(0.79756, 0, 0.15945, 0);


				-- StarterGui.MyLibrary.Main.Navigation.HomeTab.Slider.SlideBack
				Slider["2b"] = Instance.new("Frame", Slider["26"]);
				Slider["2b"]["BorderSizePixel"] = 0;
				Slider["2b"]["BackgroundColor3"] = Color3.fromRGB(76, 76, 76);
				Slider["2b"]["Size"] = UDim2.new(0, 313, 0, 10);
				Slider["2b"]["Position"] = UDim2.new(0.02885, 0, 0.6412, 0);
				Slider["2b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Slider["2b"]["Name"] = [[SlideBack]];


				-- StarterGui.MyLibrary.Main.Navigation.HomeTab.Slider.SlideBack.UICorner
				Slider["2c"] = Instance.new("UICorner", Slider["2b"]);
				Slider["2c"]["CornerRadius"] = UDim.new(1, 0);


				-- StarterGui.MyLibrary.Main.Navigation.HomeTab.Slider.SlideBack.Draggable
				Slider["2d"] = Instance.new("Frame", Slider["2b"]);
				Slider["2d"]["BorderSizePixel"] = 0;
				Slider["2d"]["BackgroundColor3"] = Color3.fromRGB(135, 135, 135);
				Slider["2d"]["Size"] = UDim2.new(0, 160, 0, 10);
				Slider["2d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Slider["2d"]["Name"] = [[Draggable]];


				-- StarterGui.MyLibrary.Main.Navigation.HomeTab.Slider.SlideBack.Draggable.UICorner
				Slider["2e"] = Instance.new("UICorner", Slider["2d"]);
				Slider["2e"]["CornerRadius"] = UDim.new(1, 0);
			end
			
			-- Methods
			function Slider:SetValue(v)
				if v == nil then
					local percentage = math.clamp((mouse.X - Slider["2b"].AbsolutePosition.X) / (Slider["2b"].AbsoluteSize.X), 0, 1)
					local value = math.floor(((options.max - options.min) * percentage) + options.min)

					Slider["2a"]["Text"] = tostring(value)
					Slider["2d"]["Size"] = UDim2.fromScale(percentage, 1)
				else
					Slider["2a"]["Text"] = tostring(v)
					Slider["2d"]["Size"] = UDim2.fromScale(((v -  options.min) / (options.max - options.min)), 1)
				end
				options.callback(Slider:GetValue())
			end
			
			function Slider:GetValue()
				return tonumber(Slider["2a"]["Text"])
			end
			
			-- logic
			do
				
				Slider["26"].MouseEnter:Connect(function()
					Slider.Hover = true
					Library:tween(Slider["29"], {Color = Color3.fromRGB(100, 100, 100)})
					Library:tween(Slider["2d"], {BackgroundColor3 = Color3.fromRGB(100, 100, 100)})

				end)

				Slider["26"].MouseLeave:Connect(function()
					Slider.Hover = false
					if not Slider.MouseDown then
						Library:tween(Slider["29"], {Color = Color3.fromRGB(81, 81, 81)})
						Library:tween(Slider["26"], {BackgroundColor3 = Color3.fromRGB(39, 39, 39)})
						Library:tween(Slider["2d"], {BackgroundColor3 = Color3.fromRGB(81, 81, 81)})

					end
				end)

				Slider["2b"].InputBegan:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						Slider.MouseDown = true

						Library:tween(Slider["26"], {BackgroundColor3 = Color3.fromRGB(200, 200, 200)})
						Library:tween(Slider["29"], {Color = Color3.fromRGB(200, 200, 200)})

						if not Slider.Connection then
							Slider.Connection = RunService.RenderStepped:Connect(function()
								Slider:SetValue()
							end)
						end
					end
				end)

				uis.InputEnded:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						if Slider.MouseDown then
							Slider.MouseDown = false

							Library:tween(Slider["26"], {BackgroundColor3 = Color3.fromRGB(39, 39, 39)})
							Library:tween(Slider["29"], {Color = Color3.fromRGB(81, 81, 81)})
						end

						if Slider.Connection then
							Slider.Connection:Disconnect()
							Slider.Connection = nil
						end
					end
				end)
			end
			
			return Slider
			
		end
		
		function Tab:TextBox(options)
			options = Library:validate({
				title = "Preview TextBox",
				placeholder = "Txt"
			}, options or {})
			
			local TextBox = {
				Hover = false,
				MouseDown = false,
				
			}
			
			
			-- render
			do
				-- StarterGui.MyLibrary.Main.Navigation.HomeTab.TextBox
				TextBox["45"] = Instance.new("Frame", Tab["1a"]);
				TextBox["45"]["BorderSizePixel"] = 0;
				TextBox["45"]["BackgroundColor3"] = Color3.fromRGB(39, 39, 39);
				TextBox["45"]["Size"] = UDim2.new(0.95, 0, 0.00364, 40);
				TextBox["45"]["Position"] = UDim2.new(-0, 0, 0, 0);
				TextBox["45"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				TextBox["45"]["Name"] = [[TextBox]];


				-- StarterGui.MyLibrary.Main.Navigation.HomeTab.TextBox.UICorner
				TextBox["46"] = Instance.new("UICorner", TextBox["45"]);
				TextBox["46"]["CornerRadius"] = UDim.new(0, 9);


				-- StarterGui.MyLibrary.Main.Navigation.HomeTab.TextBox.LabelText
				TextBox["47"] = Instance.new("TextLabel", TextBox["45"]);
				TextBox["47"]["TextWrapped"] = true;
				TextBox["47"]["BorderSizePixel"] = 0;
				TextBox["47"]["TextSize"] = 14;
				TextBox["47"]["TextScaled"] = true;
				TextBox["47"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				TextBox["47"]["FontFace"] = Font.new([[rbxasset://fonts/families/FredokaOne.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
				TextBox["47"]["TextColor3"] = Color3.fromRGB(207, 207, 207);
				TextBox["47"]["BackgroundTransparency"] = 1;
				TextBox["47"]["Size"] = UDim2.new(0.27679, 0, -0.12821, 29);
				TextBox["47"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				TextBox["47"]["Text"] = options.title;
				TextBox["47"]["Name"] = [[LabelText]];
				TextBox["47"]["Position"] = UDim2.new(0.03175, 0, 0.19957, 0);


				-- StarterGui.MyLibrary.Main.Navigation.HomeTab.TextBox.UIStroke
				TextBox["48"] = Instance.new("UIStroke", TextBox["45"]);
				TextBox["48"]["Thickness"] = 2.4;
				TextBox["48"]["Color"] = Color3.fromRGB(81, 81, 81);


				-- StarterGui.MyLibrary.Main.Navigation.HomeTab.TextBox.TextBox
				TextBox["49"] = Instance.new("TextBox", TextBox["45"]);
				TextBox["49"]["BorderSizePixel"] = 0;
				TextBox["49"]["TextWrapped"] = true;
				TextBox["49"]["TextSize"] = 14;
				TextBox["49"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
				TextBox["49"]["TextScaled"] = true;
				TextBox["49"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				TextBox["49"]["RichText"] = true;
				TextBox["49"]["FontFace"] = Font.new([[rbxasset://fonts/families/Ubuntu.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
				TextBox["49"]["PlaceholderText"] = options["placeholder"];
				TextBox["49"]["Size"] = UDim2.new(0.15, 0, 0, 31);
				TextBox["49"]["Position"] = UDim2.new(0.8, 0, 0.119, 0);
				TextBox["49"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				TextBox["49"]["Text"] = [[]];
				TextBox["49"]["BackgroundTransparency"] = 0.6;
			end
			
			
			-- methods
			function TextBox:GetText()
				return TextBox["49"].Text
			end
			
			return TextBox
		end

		return Tab
	end

	
	return GUI
end
