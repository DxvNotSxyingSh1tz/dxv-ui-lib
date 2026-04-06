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

function Library:Init(options)
	options = Library:validate({
		
		title = "UI Library!",
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
	local gui = GUI["2"] -- your ScreenGui
	
	
	gui.Active = true
	gui.Selectable = true
	gui.Draggable = true
	
	
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


		
		function Tab:Slider(options)
			options = Library:validate({
				title = "Slider",
				min = 0,
				max = 100,
				default = 50,
				callback = function(val) end
			}, options or {})

			local Slider = {}

			-- Frame
			Slider["frame"] = Instance.new("Frame", Tab["1a"])
			Slider["frame"].Size = UDim2.new(0.95, 0, 0, 40)
			Slider["frame"].BackgroundColor3 = Color3.fromRGB(39,39,39)

			-- Label
			Slider["label"] = Instance.new("TextLabel", Slider["frame"])
			Slider["label"].Text = options.title
			Slider["label"].TextColor3 = Color3.fromRGB(255,255,255)
			Slider["label"].Size = UDim2.new(0.5,0,1,0)

			-- Bar
			Slider["bar"] = Instance.new("Frame", Slider["frame"])
			Slider["bar"].Size = UDim2.new(0.4,0,0.3,0)
			Slider["bar"].Position = UDim2.new(0.55,0,0.35,0)
			Slider["bar"].BackgroundColor3 = Color3.fromRGB(100,100,100)

			local dragging = false

			Slider["bar"].InputBegan:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 then
					dragging = true
				end
			end)

			Slider["bar"].InputEnded:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 then
					dragging = false
				end
			end)

			RunService.RenderStepped:Connect(function()
				if dragging then
					local mousePos = uis:GetMouseLocation().X
					local framePos = Slider["frame"].AbsolutePosition.X
					local frameSize = Slider["frame"].AbsoluteSize.X
					local value = math.clamp((mousePos - framePos) / frameSize, 0, 1)
					Slider["bar"].Size = UDim2.new(value,0,0.3,0)
					local realVal = options.min + (options.max - options.min) * value
					options.callback(realVal)
				end
			end)

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

return Library
