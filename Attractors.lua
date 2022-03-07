local RunService = game:GetService("RunService")
local HttpService = game:GetService("HttpService")
local module = {}
module.__index = module

export type Attractor = {
	Author : string,
	AuthorTwo : string?,
	DisplayName : string,
	Play : () -> ()
}

function module.new()
	local self = setmetatable({},module)
	self.connections = {}
	self.parts = game.Workspace:WaitForChild("AttractorPoints"):GetChildren()
	self.partsSetTwo = game.Workspace:WaitForChild("AttractorPointsTwo"):GetChildren()
	self.currentAttractor = nil
	
	self.Attractors = {}
	
	self.Attractors.Act = {}
	self.Attractors.Act.Author = "???"
	self.Attractors.Act.DisplayName = "Act"
	self.Attractors.Act.Play = function()
		
		local a = 1.8
		local b = -0.07
		local c = 1.5
		local d = 0.02
		
		local t = 0.02
		
		local size = 1
		
		local waitTime = 5

		for i,v in pairs(self.connections) do
			RunService:UnbindFromRenderStep(v)
		end
		
		for _,part in pairs(self.partsSetTwo) do
			part.Trail:Clear()
		end
		
		for _,part in pairs(self.parts) do
			part.Trail:Clear()
		end
		
		self.currentAttractor = self.Attractors.Act.DisplayName
		for _,part in pairs(self.parts) do
			if self.currentAttractor ~= self.Attractors.Act.DisplayName then
				break
			end
			
			local x = 0.5
			local y = 0.0
			local z = 0.0
			
			part.Position = Vector3.new(x,y,z)
			part.Trail:Clear()
			
			local function stepped()
				local xt = x + t * (a*(x-y))
				local yt = y + t * (-4*a*y + x*z + d*x^3)
				local zt = z + t * (-c*a*z + x*y + b*z^2)
				x=xt
				y=yt
				z=zt
				part.Position = Vector3.new(x,y,z) * size
				part.Size = Vector3.new(0.1,0.1,0.1) * size
				part.attachOne.Position = Vector3.new(0,0,(0.1 * size)/2) 
				part.attachTwo.Position = Vector3.new(0,0,-(0.1 * size)/2)
			end
			for i=0,1,1 do
				local connId = HttpService:GenerateGUID()
				RunService:BindToRenderStep(tostring(connId),i,stepped)
				table.insert(self.connections,tostring(connId))
				task.wait()
			end 
			task.wait(waitTime)
		end
	end
	
	self.Attractors.Aizawa = {}
	self.Attractors.Aizawa.Author = "Yoji Aizawa"
	self.Attractors.Aizawa.DisplayName = "Aizawa"
	self.Attractors.Aizawa.Play = function()
		
		local a = 0.95
		local b = 0.7
		local c = 0.6
		local d = 3.5
		local e = 0.25
		local f = 0.1
		
		local size = 10
		
		local t = 0.01
		
		local waitTime = 5
		
		for i,v in pairs(self.connections) do
			RunService:UnbindFromRenderStep(v)
		end
		
		for _,part in pairs(self.partsSetTwo) do
			part.Trail:Clear()
		end
		
		for _,part in pairs(self.parts) do
			part.Trail:Clear()
		end
		
		self.currentAttractor = self.Attractors.Aizawa.DisplayName
		for _,part in pairs(self.parts) do
			if self.currentAttractor ~= self.Attractors.Aizawa.DisplayName then
				break
			end
			
			local x = 0.1
			local y = 1.0
			local z = 0.01
			
			part.Position = Vector3.new(x,y,z)
			part.Trail:Clear()
			
			local function stepped()			
				local xt = x + t * ((z-b) * x - d * y)
				local yt = y + t * (d*x + (z-b) * y)
				local zt = z + t * (c + a * z - (math.pow(z,3)/3) - ((x^2) + (y^2)) * (1+e*z) + f*z*(x^3))
				x=xt
				y=yt
				z=zt
				part.Position = Vector3.new(x,y,z) * size
				part.Size = Vector3.new(0.1,0.1,0.1) * size
				part.attachOne.Position = Vector3.new(0,0,(0.1 * size)/2) 
				part.attachTwo.Position = Vector3.new(0,0,-(0.1 * size)/2)
			end
			for i=0,6,1 do
				local connId = HttpService:GenerateGUID()
				RunService:BindToRenderStep(tostring(connId),i,stepped)
				table.insert(self.connections,tostring(connId))
				task.wait()
			end
			task.wait(waitTime)
		end
	end
	
	self.Attractors.AnishenkoAstakhov = {}
	self.Attractors.AnishenkoAstakhov.Author = "Vadim Anishchenko"
	self.Attractors.AnishenkoAstakhov.AuthorTwo = "Vladimir Astakhov"
	self.Attractors.AnishenkoAstakhov.DisplayName = "Anishenko-Astakhov"
	self.Attractors.AnishenkoAstakhov.Play = function()
		
		local a = 1.2
		local b = 0.5
		
		local size = 1
		
		local t = 0.01
		
		local waitTime = 5
		
		for i,v in pairs(self.connections) do
			RunService:UnbindFromRenderStep(v)
		end
		
		for _,part in pairs(self.partsSetTwo) do
			part.Trail:Clear()
		end
		
		for _,part in pairs(self.parts) do
			part.Trail:Clear()
		end
		
		self.currentAttractor = self.Attractors.AnishenkoAstakhov.DisplayName
		for k,part in pairs(self.parts) do
			if self.currentAttractor ~= self.Attractors.AnishenkoAstakhov.DisplayName then
				break
			end
			
			local x = 0.1
			local y = 0.1
			local z = 0.1
			
			part.Position = Vector3.new(x,y,z)
			part.Trail:Clear()
			
			local function stepped()			
				local i = x>0 and 1.0 or 0.0
				
				local xt = x + t * (a*x + y - x*z)
				local yt = y + t * (-x)
				local zt = z + t * (-b*z+b*i*x^2)
				x=xt
				y=yt
				z=zt
				part.Position = Vector3.new(x,y,z) * size
				part.Size = Vector3.new(0.1,0.1,0.1) * size
				part.attachOne.Position = Vector3.new(0,0,(0.1 * size)/2) 
				part.attachTwo.Position = Vector3.new(0,0,-(0.1 * size)/2)
			end
			for i=0,3,1 do
				local connId = HttpService:GenerateGUID()
				RunService:BindToRenderStep(tostring(connId),i,stepped)
				table.insert(self.connections,tostring(connId))
				task.wait()
			end
			task.wait(waitTime)
		end
	end
	
	self.Attractors.Arneodo = {}
	self.Attractors.Arneodo.Author = "Alain Arneodo"
	self.Attractors.Arneodo.DisplayName = "Arneodo"
	self.Attractors.Arneodo.Play = function()
		
		local a = -5.5
		local b = 3.5
		local c = -1.0
		
		local size = 1
		
		local t = 0.009
		
		local waitTime = 5
		
		for i,v in pairs(self.connections) do
			RunService:UnbindFromRenderStep(v)
		end
		
		for _,part in pairs(self.partsSetTwo) do
			part.Trail:Clear()
		end
		
		for _,part in pairs(self.parts) do
			part.Trail:Clear()
		end
		
		self.currentAttractor = self.Attractors.Arneodo.DisplayName
		for k,part in pairs(self.parts) do
			if self.currentAttractor ~= self.Attractors.Arneodo.DisplayName then
				break
			end
			
			local x = 0.1
			local y = 0.0
			local z = 0.0
			
			part.Position = Vector3.new(x,y,z)
			part.Trail:Clear()
			
			local function stepped()			
				local i = x>0 and 1.0 or 0.0
				
				local xt = x + t * (y)
				local yt = y + t * (z)
				local zt = z + t * (-a*x-b*y-z+c*x^3)
				x=xt
				y=yt
				z=zt
				part.Position = Vector3.new(x,y,z) * size
				part.Size = Vector3.new(0.1,0.1,0.1) * size
				part.attachOne.Position = Vector3.new(0,0,(0.1 * size)/2) 
				part.attachTwo.Position = Vector3.new(0,0,-(0.1 * size)/2)
			end
			for i=0,6,1 do
				local connId = HttpService:GenerateGUID()
				RunService:BindToRenderStep(tostring(connId),i,stepped)
				table.insert(self.connections,tostring(connId))
				task.wait()
			end
			task.wait(waitTime)
		end
	end
	
	self.Attractors.BurkeShaw = {}
	self.Attractors.BurkeShaw.Author = "Bill Burke"
	self.Attractors.BurkeShaw.AuthorTwo = "Robert Shaw"
	self.Attractors.BurkeShaw.DisplayName = "Burke-Shaw"
	self.Attractors.BurkeShaw.Play = function()
		
		local a = 10
		local b = 4.272
		
		local size = 10
		
		local t = 0.005
		
		local waitTime = 5
		
		for i,v in pairs(self.connections) do
			RunService:UnbindFromRenderStep(v)
		end
		
		for _,part in pairs(self.partsSetTwo) do
			part.Trail:Clear()
		end
		
		for _,part in pairs(self.parts) do
			part.Trail:Clear()
		end
		
		self.currentAttractor = self.Attractors.BurkeShaw.DisplayName
		for k,part in pairs(self.parts) do
			if self.currentAttractor ~= self.Attractors.BurkeShaw.DisplayName then
				break
			end
			
			local x = 1.0
			local y = 0.0
			local z = 0.0
			
			part.Position = Vector3.new(x,y,z)
			part.Trail:Clear()
			
			local function stepped()			
				local i = x>0 and 1.0 or 0.0
				
				local xt = x + t * (-a*(x+y))
				local yt = y + t * (-y-a*x*z)
				local zt = z + t * (a*x*y+b)
				x=xt
				y=yt
				z=zt
				part.Position = Vector3.new(x,y,z) * size
				part.Size = Vector3.new(0.1,0.1,0.1) * size
				part.attachOne.Position = Vector3.new(0,0,(0.1 * size)/2) 
				part.attachTwo.Position = Vector3.new(0,0,-(0.1 * size)/2)
			end
			for i=0,2,1 do
				local connId = HttpService:GenerateGUID()
				RunService:BindToRenderStep(tostring(connId),i,stepped)
				table.insert(self.connections,tostring(connId))
				task.wait()
			end
			task.wait(waitTime)
		end
	end
	
	self.Attractors.Chen = {}
	self.Attractors.Chen.Author = "Chen Guanrong"
	self.Attractors.Chen.DisplayName = "Chen"
	self.Attractors.Chen.Play = function()
		
		local a = 5
		local b = -10
		local c = -0.38
		
		local size = 1
		
		local t = 0.002
		
		local waitTime = 5
		
		for _,v in pairs(self.connections) do
			RunService:UnbindFromRenderStep(v)
		end
		
		self.currentAttractor = self.Attractors.Chen.DisplayName
		
		for _,part in pairs(self.partsSetTwo) do
			part.Trail:Clear()
		end
		
		for _,part in pairs(self.parts) do
			part.Trail:Clear()
		end
		
		local firstAttractor = coroutine.create(function()
			

			

			
			
			for _,part in pairs(self.parts) do
				if self.currentAttractor ~= self.Attractors.Chen.DisplayName then
					break
				end
				
				local x = -5.0
				local y = 10.0
				local z = 10.0
				
				part.Position = Vector3.new(x,y,z)
				part.Trail:Clear()
				
				local function stepped()			
					local xt = x + t * (a*x-y*z)
					local yt = y + t * (b*y+x*z)
					local zt = z + t * (c*z+x*y/3)
					x=xt
					y=yt
					z=zt
					part.Position = Vector3.new(x,y,z) * size
					part.Size = Vector3.new(0.1,0.1,0.1) * size
					part.attachOne.Position = Vector3.new(0,0,(0.1 * size)/2) 
					part.attachTwo.Position = Vector3.new(0,0,-(0.1 * size)/2)
				end
				for i=0,6,1 do
					local connId = HttpService:GenerateGUID()
					RunService:BindToRenderStep(tostring(connId),i,stepped)
					table.insert(self.connections,tostring(connId))
					task.wait()
				end
				task.wait(waitTime)
			end
		end)
		coroutine.resume(firstAttractor)
		
		local secondAttractor = coroutine.create(function()

			
			for _,part in pairs(self.partsSetTwo) do
				if self.currentAttractor ~= self.Attractors.Chen.DisplayName then
					break
				end
				
				local x = -7.0
				local y = -5.0
				local z = -10.0
				
				part.Position = Vector3.new(x,y,z)
				part.Trail:Clear()
				
				local function stepped()			
					local xt = x + t * (a*x-y*z)
					local yt = y + t * (b*y+x*z)
					local zt = z + t * (c*z+x*y/3)
					x=xt
					y=yt
					z=zt
					part.Position = Vector3.new(x,y,z) * size
					part.Size = Vector3.new(0.1,0.1,0.1) * size
					part.attachOne.Position = Vector3.new(0,0,(0.1 * size)/2) 
					part.attachTwo.Position = Vector3.new(0,0,-(0.1 * size)/2)
				end
				for i=0,6,1 do
					local connId = HttpService:GenerateGUID()
					RunService:BindToRenderStep(tostring(connId),i,stepped)
					table.insert(self.connections,tostring(connId))
					task.wait()
				end
				task.wait(waitTime)
			end
		end)
		coroutine.resume(secondAttractor)
	end
	
	self.Attractors.ChenCelikovsky = {}
	self.Attractors.ChenCelikovsky.Author = "Sergej Celikovský"
	self.Attractors.ChenCelikovsky.AuthorTwo = "Chen Guanrong"
	self.Attractors.ChenCelikovsky.DisplayName = "Chen-Celikovsky"
	self.Attractors.ChenCelikovsky.Play = function()
		
		local a = 36
		local b = 3
		local c = 20
		
		local size = 1
		
		local t = 0.002
		
		local waitTime = 5
		
		for _,v in pairs(self.connections) do
			RunService:UnbindFromRenderStep(v)
		end
		
		self.currentAttractor = self.Attractors.ChenCelikovsky.DisplayName
		
		for _,part in pairs(self.partsSetTwo) do
			part.Trail:Clear()
		end
		
		for _,part in pairs(self.parts) do
			part.Trail:Clear()
		end
		
		local firstAttractor = coroutine.create(function()
			for _,part in pairs(self.parts) do
				if self.currentAttractor ~= self.Attractors.ChenCelikovsky.DisplayName then
					break
				end
				
				local x = -5.0
				local y = 10.0
				local z = 10.0
				
				part.Position = Vector3.new(x,y,z)
				part.Trail:Clear()
				
				local function stepped()			
					local xt = x + t * (a*(y-x))
					local yt = y + t * (-(x*z)+(c*y))
					local zt = z + t * ((x*y)-(b*z))
					
					x=xt
					y=yt
					z=zt
					part.Position = Vector3.new(x,y,z) * size
					part.Size = Vector3.new(0.1,0.1,0.1) * size
					part.attachOne.Position = Vector3.new(0,0,(0.1 * size)/2) 
					part.attachTwo.Position = Vector3.new(0,0,-(0.1 * size)/2)
				end
				for i=0,6,1 do
					local connId = HttpService:GenerateGUID()
					RunService:BindToRenderStep(tostring(connId),i,stepped)
					table.insert(self.connections,tostring(connId))
					task.wait()
				end
				task.wait(waitTime)
			end
		end)
		coroutine.resume(firstAttractor)
	end
	
	self.Attractors.Chua = {}
	self.Attractors.Chua.Author = "Leon Chua"
	self.Attractors.Chua.DisplayName = "Chua"
	self.Attractors.Chua.Play = function()
		
		local a = 15.6
		local b = 1
		local c = 25.58
		local d = -1
		local e = 0
		
		local size = 10
		
		local t = 0.01
		
		local waitTime = 5
		
		for _,v in pairs(self.connections) do
			RunService:UnbindFromRenderStep(v)
		end
		
		self.currentAttractor = self.Attractors.Chua.DisplayName
		
		for _,part in pairs(self.partsSetTwo) do
			part.Trail:Clear()
		end
		
		for _,part in pairs(self.parts) do
			part.Trail:Clear()
		end
		
		local firstAttractor = coroutine.create(function()
			
			for _,part in pairs(self.parts) do
				if self.currentAttractor ~= self.Attractors.Chua.DisplayName then
					break
				end
				
				local x = 1.0
				local y = 1.0
				local z = 1.0
				
				part.Position = Vector3.new(x,y,z)
				part.Trail:Clear()
				
				local function stepped()	
					
					local h = (e*x+(d+e)*(math.abs(x+1)-math.abs(x-1)))
					
					local xt = x + t * (a*(y-x-h))
					local yt = y + t * (b*(x-y+z))
					local zt = z + t * (-c*y)
					x=xt
					y=yt
					z=zt
					part.Position = Vector3.new(x,y,z) * size
					part.Size = Vector3.new(0.1,0.1,0.1) * size
					part.attachOne.Position = Vector3.new(0,0,(0.1 * size)/2) 
					part.attachTwo.Position = Vector3.new(0,0,-(0.1 * size)/2)
				end
				for i=0,3,1 do
					local connId = HttpService:GenerateGUID()
					RunService:BindToRenderStep(tostring(connId),i,stepped)
					table.insert(self.connections,tostring(connId))
					task.wait()
				end
				task.wait(waitTime)
			end
		end)
		coroutine.resume(firstAttractor)
		
	end
	
	self.Attractors.ChuaMulti1 = {}
	self.Attractors.ChuaMulti1.Author = "Leon Chua"
	self.Attractors.ChuaMulti1.DisplayName = "Chua Multi 1st"
	self.Attractors.ChuaMulti1.Play = function()

		local a = 10.814
		local b = 14
		local c = 1.3
		local d = 0.11
		local e = 2
		
		local size = 10
		
		local t = 0.01
		
		local waitTime = 5

		for _,v in pairs(self.connections) do
			RunService:UnbindFromRenderStep(v)
		end
		
		self.currentAttractor = self.Attractors.ChuaMulti1.DisplayName
		
		for _,part in pairs(self.partsSetTwo) do
			part.Trail:Clear()
		end
		
		for _,part in pairs(self.parts) do
			part.Trail:Clear()
		end
		
		local firstAttractor = coroutine.create(function()
			
			for _,part in pairs(self.parts) do
				
				if self.currentAttractor ~= self.Attractors.ChuaMulti1.DisplayName then
					break
				end
				
				local x = 1.0
				local y = 0.0
				local z = 0.0
				
				part.Position = Vector3.new(x,y,z)
				part.Trail:Clear()
				
				local function stepped()	
					local turnsIntoPi = 0
					local h = 0
					
					if c % 2 == 0 then
						turnsIntoPi = math.pi
					end
					
					if x >= 2*c*e then
						h=((d*math.pi) / (2*c))*(x-2*c*e)
					end
					if x <= -2*c*e then
						h=((d*math.pi) / (2*c))*(x+2*c*e)
					end
					if x < 2*c*e and x > -2*c*e then
						h = d*math.sin((math.pi*x)/(2*c)+turnsIntoPi)
					end
					
					local xt = x + t * (a*(y-h))
					local yt = y + t * (x-y+z)
					local zt = z + t * (-b*y)
					x=xt
					y=yt
					z=zt
					part.Position = Vector3.new(x,y,z) * size
					part.Size = Vector3.new(0.1,0.1,0.1) * size
					part.attachOne.Position = Vector3.new(0,0,(0.1 * size)/2) 
					part.attachTwo.Position = Vector3.new(0,0,-(0.1 * size)/2)
				end
				for i=0,6,1 do
					local connId = HttpService:GenerateGUID()
					RunService:BindToRenderStep(tostring(connId),i,stepped)
					table.insert(self.connections,tostring(connId))
					task.wait()
				end
				task.wait(waitTime)
			end
		end)
		coroutine.resume(firstAttractor)
	end
	
	self.Attractors.ChuaMulti2 = {}
	self.Attractors.ChuaMulti2.Author = "Leon Chua"
	self.Attractors.ChuaMulti2.DisplayName = "Chua Multi 2nd"
	self.Attractors.ChuaMulti2.Play = function()
		
		local a = 10.814
		local b = 14
		local c = 1.3
		local d = 0.11
		
		local size = 10
		
		local t = 0.01
		
		local waitTime = 5
		
		for _,v in pairs(self.connections) do
			RunService:UnbindFromRenderStep(v)
		end
		
		self.currentAttractor = self.Attractors.ChuaMulti2.DisplayName
		
		for _,part in pairs(self.partsSetTwo) do
			part.Trail:Clear()
		end
		
		for _,part in pairs(self.parts) do
			part.Trail:Clear()
		end
		
		local firstAttractor = coroutine.create(function()
			
			local m = {[0]=0.9/7.0, -3.0/7.0, 3.5/7.0, -2.7/7.0, 4.0/7.0, -2.4/7.0}
			local points = {[0]=0.0, 1.0, 2.15, 3.6, 6.2, 9.0}
			
			for _,part in pairs(self.parts) do
				if self.currentAttractor ~= self.Attractors.ChuaMulti2.DisplayName then
					break
				end
				
				local x = 1.0
				local y = 0.0
				local z = 0.0
				
				part.Position = Vector3.new(x,y,z)
				part.Trail:Clear()
				
				local function stepped()			
					local sum = 0
					for i=1,5,1 do
						sum+=((m[i-1] - m[i])*(math.abs(x+points[i])-math.abs(x-points[i])))
					end
					local h = m[5]*x+0.5*sum
					local xt = x + t * (a*(y-h))
					local yt = y + t * (x-y+z)
					local zt = z + t * (-b*y)
					x=xt
					y=yt
					z=zt
					part.Position = Vector3.new(x,y,z) * size
					part.Size = Vector3.new(0.1,0.1,0.1) * size
					part.attachOne.Position = Vector3.new(0,0,(0.1 * size)/2) 
					part.attachTwo.Position = Vector3.new(0,0,-(0.1 * size)/2)
				end
				for i=0,6,1 do
					local connId = HttpService:GenerateGUID()
					RunService:BindToRenderStep(tostring(connId),i,stepped)
					table.insert(self.connections,tostring(connId))
					task.wait()
				end
				task.wait(waitTime)
			end
		end)
		coroutine.resume(firstAttractor)
	end
	
	self.Attractors.Coullet = {}
	self.Attractors.Coullet.Author = "Pierre Coullet"
	self.Attractors.Coullet.DisplayName = "Coullet"
	self.Attractors.Coullet.Play = function()
		
		local a = 0.8
		local b = -1.1
		local c = -0.45
		local d = -1
		
		local size = 10
		
		local t = 0.01
		
		local waitTime = 5
		
		for _,v in pairs(self.connections) do
			RunService:UnbindFromRenderStep(v)
		end
		
		self.currentAttractor = self.Attractors.Coullet.DisplayName
		
		for _,part in pairs(self.partsSetTwo) do
			part.Trail:Clear()
		end
		
		for _,part in pairs(self.parts) do
			part.Trail:Clear()
		end
		
		local firstAttractor = coroutine.create(function()
			
			for _,part in pairs(self.parts) do
				if self.currentAttractor ~= self.Attractors.Coullet.DisplayName then
					break
				end
				
				local x = 0.1
				local y = 0.0
				local z = 0.0
				
				part.Position = Vector3.new(x,y,z)
				part.Trail:Clear()
				
				local function stepped()			
					local xt = x + t * y
					local yt = y + t * z
					local zt = z + t * (a*x + b*y + c*z + d*x^3)
					x=xt
					y=yt
					z=zt
					part.Position = Vector3.new(x,y,z) * size
					part.Size = Vector3.new(0.1,0.1,0.1) * size
					part.attachOne.Position = Vector3.new(0,0,(0.1 * size)/2) 
					part.attachTwo.Position = Vector3.new(0,0,-(0.1 * size)/2)
				end
				for i=0,6,1 do
					local connId = HttpService:GenerateGUID()
					RunService:BindToRenderStep(tostring(connId),i,stepped)
					table.insert(self.connections,tostring(connId))
					task.wait()
				end
				task.wait(waitTime)
			end
		end)
		coroutine.resume(firstAttractor)
	end
	
	self.Attractors.Dadras = {}
	self.Attractors.Dadras.Author = "Sara Dadras"
	self.Attractors.Dadras.AuthorTwo = "Hamid Momeni"
	self.Attractors.Dadras.DisplayName = "Dadras"
	self.Attractors.Dadras.Play = function()
		
		local a = 3.0
		local b = 2.7
		local c = 1.7
		local d = 2.0
		local e = 9.0
		
		local size = 1
		
		local t = 0.002
		
		local waitTime = 5
		
		for _,v in pairs(self.connections) do
			RunService:UnbindFromRenderStep(v)
		end
		self.currentAttractor = self.Attractors.Dadras.DisplayName
		
		for _,part in pairs(self.partsSetTwo) do
			part.Trail:Clear()
		end
		
		for _,part in pairs(self.parts) do
			part.Trail:Clear()
		end
		
		local firstAttractor = coroutine.create(function()
			
			for _,part in pairs(self.parts) do
				if self.currentAttractor ~= self.Attractors.Dadras.DisplayName then
					break
				end
				
				local x = 1.1
				local y = 2.1
				local z = -2.0
				
				part.Position = Vector3.new(x,y,z)
				part.Trail:Clear()
				
				local function stepped()			
					local xt = x + t * (y-a*x+b*y*z)
					local yt = y + t * (c*y-x*z+z)
					local zt = z + t * (d*x*y-e*z)
					x=xt
					y=yt
					z=zt
					part.Position = Vector3.new(x,y,z) * size
					part.Size = Vector3.new(0.1,0.1,0.1) * size
					part.attachOne.Position = Vector3.new(0,0,(0.1 * size)/2) 
					part.attachTwo.Position = Vector3.new(0,0,-(0.1 * size)/2)
				end
				for i=0,6,1 do
					local connId = HttpService:GenerateGUID()
					RunService:BindToRenderStep(tostring(connId),i,stepped)
					table.insert(self.connections,tostring(connId))
					task.wait()
				end
				task.wait(waitTime)
			end
		end)
		coroutine.resume(firstAttractor)
	end
	
	self.Attractors.Dequan = {}
	self.Attractors.Dequan.Author = "De Quan Li"
	self.Attractors.Dequan.DisplayName = "De Quan"
	self.Attractors.Dequan.Play = function()
		
		local a = 40
		local b = 1.8333333333
		local c = 0.16
		local d = 0.65
		local e = 55
		local f = 20
		
		local size = 0.1
		
		local t = 0.0003
		
		local waitTime = 5
		
		for _,v in pairs(self.connections) do
			RunService:UnbindFromRenderStep(v)
		end
		self.currentAttractor = self.Attractors.Dequan.DisplayName
		
		for _,part in pairs(self.partsSetTwo) do
			part.Trail:Clear()
		end
		
		for _,part in pairs(self.parts) do
			part.Trail:Clear()
		end
		
		local firstAttractor = coroutine.create(function()
			
			for _,part in pairs(self.parts) do
				if self.currentAttractor ~= self.Attractors.Dequan.DisplayName then
					break
				end
				
				local x = 0.01
				local y = 0.0
				local z = 0.0
				
				part.Position = Vector3.new(x,y,z)
				part.Trail:Clear()
				
				local function stepped()			
					local xt = x + t * (a*(y-x)+c*x*z)
					local yt = y + t * (e*x + f*y - x*z)
					local zt = z + t * (b*z + x*y - d*x^2)
					x=xt
					y=yt
					z=zt
					part.Position = Vector3.new(x,y,z) * size
					part.Size = Vector3.new(0.1,0.1,0.1) * size
					part.attachOne.Position = Vector3.new(0,0,(0.1 * size)/2) 
					part.attachTwo.Position = Vector3.new(0,0,-(0.1 * size)/2)
				end
				for i=0,12,1 do
					local connId = HttpService:GenerateGUID()
					RunService:BindToRenderStep(tostring(connId),i,stepped)
					table.insert(self.connections,tostring(connId))
					task.wait()
				end
				task.wait(waitTime)
			end
		end)
		coroutine.resume(firstAttractor)
	end
	
	self.Attractors.Duffing = {}
	self.Attractors.Duffing.Author = "Georg Duffing"
	self.Attractors.Duffing.DisplayName = "Duffing"
	self.Attractors.Duffing.Play = function()
		
		local a = 0.25
		local b = 0.3
		local c = 1
		
		local size = 10
		
		local t = 0.01
		
		local waitTime = 5
		
		for _,v in pairs(self.connections) do
			RunService:UnbindFromRenderStep(v)
		end
		self.currentAttractor = self.Attractors.Duffing.DisplayName
		
		for _,part in pairs(self.partsSetTwo) do
			part.Trail:Clear()
		end
		
		for _,part in pairs(self.parts) do
			part.Trail:Clear()
		end
		
		local firstAttractor = coroutine.create(function()
			
			for _,part in pairs(self.parts) do
				if self.currentAttractor ~= self.Attractors.Duffing.DisplayName then
					break
				end
				
				local x = 0.1
				local y = 0.0
				local z = 0.0
				
				part.Position = Vector3.new(x,y,z)
				part.Trail:Clear()
				
				local function stepped()			
					local xt = x + t * y
					local yt = y + t * (x-x^3 - a*y+b*math.cos(t*c))
					local zt = z + t * 0
					x=xt
					y=yt
					z=zt
					part.Position = Vector3.new(x,y,z) * size
					part.Size = Vector3.new(0.1,0.1,0.1) * size
					part.attachOne.Position = Vector3.new(0,0,(0.1 * size)/2) 
					part.attachTwo.Position = Vector3.new(0,0,-(0.1 * size)/2)
				end
				for i=0,12,1 do
					local connId = HttpService:GenerateGUID()
					RunService:BindToRenderStep(tostring(connId),i,stepped)
					table.insert(self.connections,tostring(connId))
					task.wait()
				end
				task.wait(waitTime)
			end
		end)
		coroutine.resume(firstAttractor)
	end
	
	self.Attractors.Finance = {}
	self.Attractors.Finance.Author = "???"
	self.Attractors.Finance.DisplayName = "Finance"
	self.Attractors.Finance.Play = function()
		
		local a = 0.001
		local b = 0.2
		local c = 1.1
		
		local size = 10
		
		local t = 0.002
		
		local waitTime = 5
		
		for _,v in pairs(self.connections) do
			RunService:UnbindFromRenderStep(v)
		end
		self.currentAttractor = self.Attractors.Finance.DisplayName
		
		for _,part in pairs(self.partsSetTwo) do
			part.Trail:Clear()
		end
		
		for _,part in pairs(self.parts) do
			part.Trail:Clear()
		end
		
		local firstAttractor = coroutine.create(function()
			
			for _,part in pairs(self.parts) do
				if self.currentAttractor ~= self.Attractors.Finance.DisplayName then
					break
				end
				
				local x = 0.1
				local y = 0.1
				local z = 0.1
				
				part.Position = Vector3.new(x,y,z)
				part.Trail:Clear()
				
				local function stepped()			
					local xt = x + t * ((1/b - a)*x + x*y + z)
					local yt = y + t * (-b*y - x^2)
					local zt = z + t * (-x-c*z)
					x=xt
					y=yt
					z=zt
					part.Position = Vector3.new(x,y,z) * size
					part.Size = Vector3.new(0.1,0.1,0.1) * size
					part.attachOne.Position = Vector3.new(0,0,(0.1 * size)/2) 
					part.attachTwo.Position = Vector3.new(0,0,-(0.1 * size)/2)
				end
				for i=0,12,1 do
					local connId = HttpService:GenerateGUID()
					RunService:BindToRenderStep(tostring(connId),i,stepped)
					table.insert(self.connections,tostring(connId))
					task.wait()
				end
				task.wait(waitTime)
			end
		end)
		coroutine.resume(firstAttractor)
	end
	
	self.Attractors.FourWing = {}
	self.Attractors.FourWing.Author = "Zenghui Wang"
	self.Attractors.FourWing.AuthorTwo = "Yanxia Sun"
	self.Attractors.FourWing.DisplayName = "Four Wing"
	self.Attractors.FourWing.Play = function()
		
		local a = 0.2
		local b = -0.01
		local c = 1
		local d = -0.4
		local e = -1
		local f = -1
		
		local size = 10
		
		local t = 0.02
		
		local waitTime = 5
		
		for _,v in pairs(self.connections) do
			RunService:UnbindFromRenderStep(v)
		end
		self.currentAttractor = self.Attractors.FourWing.DisplayName
		
		for _,part in pairs(self.partsSetTwo) do
			part.Trail:Clear()
		end
		
		for _,part in pairs(self.parts) do
			part.Trail:Clear()
		end
		
		local firstAttractor = coroutine.create(function()
			
			for _,part in pairs(self.parts) do
				if self.currentAttractor ~= self.Attractors.FourWing.DisplayName then
					break
				end
				
				local x = 0.5
				local y = 0.1
				local z = 0.1
				
				part.Position = Vector3.new(x,y,z)
				part.Trail:Clear()
				
				local function stepped()			
					
					local xt = x + t * (a*x+c*y*z)
					local yt = y + t * (b*z+d*y-x*z)
					local zt = z + t * (e*z+f*x*y)
					part.Position = Vector3.new(x,y,z) * size
					part.Size = Vector3.new(0.1,0.1,0.1) * size
					part.attachOne.Position = Vector3.new(0,0,(0.1 * size)/2) 
					part.attachTwo.Position = Vector3.new(0,0,-(0.1 * size)/2)
				end
				for i=0,12,1 do
					local connId = HttpService:GenerateGUID()
					RunService:BindToRenderStep(tostring(connId),i,stepped)
					table.insert(self.connections,tostring(connId))
					task.wait()
				end
				task.wait(waitTime)
			end
		end)
		coroutine.resume(firstAttractor)
		
		local secondAttractor = coroutine.create(function()
			
			for _,part in pairs(self.partsSetTwo) do
				if self.currentAttractor ~= self.Attractors.FourWing.DisplayName then
					break
				end
				
				local x = -0.5
				local y = -0.1
				local z = -0.1
				
				part.Position = Vector3.new(x,y,z)
				part.Trail:Clear()
				
				local function stepped()			
					local xt = x + t * (a*x+c*y*z)
					local yt = y + t * (b*z+d*y-x*z)
					local zt = z + t * (e*z+f*x*y)
					x=xt
					y=yt
					z=zt
					part.Position = Vector3.new(x,y,z) * size
					part.Size = Vector3.new(0.1,0.1,0.1) * size
					part.attachOne.Position = Vector3.new(0,0,(0.1 * size)/2) 
					part.attachTwo.Position = Vector3.new(0,0,-(0.1 * size)/2)
				end
				for i=0,12,1 do
					local connId = HttpService:GenerateGUID()
					RunService:BindToRenderStep(tostring(connId),i,stepped)
					table.insert(self.connections,tostring(connId))
					task.wait()
				end
				task.wait(waitTime)
			end
		end)
		coroutine.resume(secondAttractor)
	end
	
	self.Attractors.Hadley = {}
	self.Attractors.Hadley.Author = "George Hadley"
	self.Attractors.Hadley.DisplayName = "Hadley"
	self.Attractors.Hadley.Play = function()
		
		local a = 0.2
		local b = 4
		local c = 8
		local d = 1
		
		local size = 10
		
		local t = 0.008
		
		local waitTime = 5
		
		for _,v in pairs(self.connections) do
			RunService:UnbindFromRenderStep(v)
		end
		self.currentAttractor = self.Attractors.Hadley.DisplayName
		
		for _,part in pairs(self.partsSetTwo) do
			part.Trail:Clear()
		end
		
		for _,part in pairs(self.parts) do
			part.Trail:Clear()
		end
		
		local firstAttractor = coroutine.create(function()
			
			for _,part in pairs(self.parts) do
				if self.currentAttractor ~= self.Attractors.Hadley.DisplayName then
					break
				end
				
				local x = 0.0
				local y = 0.0
				local z = 1.3
				
				part.Position = Vector3.new(x,y,z)
				part.Trail:Clear()
				
				local function stepped()			
					local xt = x + t * (-y*y - z*z - a*x + a*c)
					local yt = y + t * (x*y - b*x*z - y + d)
					local zt = z + t * (b*x*y + x*z - z)
					x=xt
					y=yt
					z=zt
					part.Position = Vector3.new(x,y,z) * size
					part.Size = Vector3.new(0.1,0.1,0.1) * size
					part.attachOne.Position = Vector3.new(0,0,(0.1 * size)/2) 
					part.attachTwo.Position = Vector3.new(0,0,-(0.1 * size)/2)
				end
				for i=0,6,1 do
					local connId = HttpService:GenerateGUID()
					RunService:BindToRenderStep(tostring(connId),i,stepped)
					table.insert(self.connections,tostring(connId))
					task.wait()
				end
				task.wait(waitTime)
			end
		end)
		coroutine.resume(firstAttractor)
	end
	
	self.Attractors.Halvorsen = {}
	self.Attractors.Halvorsen.Author = "Johan Halvorsen"
	self.Attractors.Halvorsen.DisplayName = "Halvorsen"
	self.Attractors.Halvorsen.Play = function()
		
		local a = 1.89
		
		local size = 1
		
		local t = 0.01
		
		local waitTime = 5
		
		for _,v in pairs(self.connections) do
			RunService:UnbindFromRenderStep(v)
		end
		self.currentAttractor = self.Attractors.Halvorsen.DisplayName
		
		for _,part in pairs(self.partsSetTwo) do
			part.Trail:Clear()
		end
		
		for _,part in pairs(self.parts) do
			part.Trail:Clear()
		end
		
		local firstAttractor = coroutine.create(function()
			
			for _,part in pairs(self.parts) do
				if self.currentAttractor ~= self.Attractors.Halvorsen.DisplayName then
					break
				end
				
				local x = -0.29
				local y = -0.25
				local z = -0.59
				
				part.Position = Vector3.new(x,y,z)
				part.Trail:Clear()
				
				local function stepped()			
					local xt = x + t * (-a*x-4*y-4*z-y^2)
					local yt = y + t * (-a*y-4*z-4*x-z^2)
					local zt = z + t * (-a*z-4*x-4*y-x^2)
					x=xt
					y=yt
					z=zt
					part.Position = Vector3.new(x,y,z) * size
					part.Size = Vector3.new(0.1,0.1,0.1) * size
					part.attachOne.Position = Vector3.new(0,0,(0.1 * size)/2) 
					part.attachTwo.Position = Vector3.new(0,0,-(0.1 * size)/2)
				end
				for i=0,1,1 do
					local connId = HttpService:GenerateGUID()
					RunService:BindToRenderStep(tostring(connId),i,stepped)
					table.insert(self.connections,tostring(connId))
					task.wait()
				end
				task.wait(waitTime)
			end
		end)
		coroutine.resume(firstAttractor)
	end
	
	self.Attractors.Lorenz = {}
	self.Attractors.Lorenz.Author = "Edward Lorenz"
	self.Attractors.Lorenz.DisplayName = "Lorenz"
	self.Attractors.Lorenz.Play = function()
		
		local a = 10
		local b = 14
		local c = 2.667
		
		local size = 1
		
		local t = 0.01
		
		local waitTime = 5
		
		for _,v in pairs(self.connections) do
			RunService:UnbindFromRenderStep(v)
		end
		self.currentAttractor = self.Attractors.Lorenz.DisplayName
		
		for _,part in pairs(self.partsSetTwo) do
			part.Trail:Clear()
		end
		
		for _,part in pairs(self.parts) do
			part.Trail:Clear()
		end
		
		local firstAttractor = coroutine.create(function()
			
			for _,part in pairs(self.parts) do
				if self.currentAttractor ~= self.Attractors.Lorenz.DisplayName then
					break
				end
				
				local x = 0.1
				local y = 0.0
				local z = 0.0
				
				part.Position = Vector3.new(x,y,z)
				part.Trail:Clear()
				
				local function stepped()			
					local xt = x + t * a * (y-x)
					local yt = y + t * (x * (b - z) - y)
					local zt = z + t * (x * y - c * z)
					x=xt
					y=yt
					z=zt
					part.Position = Vector3.new(x,y,z) * size
					part.Size = Vector3.new(0.1,0.1,0.1) * size
					part.attachOne.Position = Vector3.new(0,0,(0.1 * size)/2) 
					part.attachTwo.Position = Vector3.new(0,0,-(0.1 * size)/2)
				end
				for i=0,1,1 do
					local connId = HttpService:GenerateGUID()
					RunService:BindToRenderStep(tostring(connId),i,stepped)
					table.insert(self.connections,tostring(connId))
					task.wait()
				end
				task.wait(waitTime)
			end
		end)
		coroutine.resume(firstAttractor)
	end
	
	self.Attractors.Lorenz83 = {}
	self.Attractors.Lorenz83.Author = "Edward Lorenz"
	self.Attractors.Lorenz83.DisplayName = "Lorenz 83"
	self.Attractors.Lorenz83.Play = function()
		
		local a = 0.95
		local b = 7.91
		local c = 4.83
		local d = 4.66
		
		local size = 5
		
		local t = 0.003
		
		local waitTime = 5
		
		for _,v in pairs(self.connections) do
			RunService:UnbindFromRenderStep(v)
		end
		self.currentAttractor = self.Attractors.Lorenz83.DisplayName
		
		for _,part in pairs(self.partsSetTwo) do
			part.Trail:Clear()
		end
		
		for _,part in pairs(self.parts) do
			part.Trail:Clear()
		end
		
		local firstAttractor = coroutine.create(function()
			
			for _,part in pairs(self.parts) do
				if self.currentAttractor ~= self.Attractors.Lorenz83.DisplayName then
					break
				end
				
				local x = -0.2
				local y = -2.82
				local z = 2.71
				
				part.Position = Vector3.new(x,y,z)
				part.Trail:Clear()
				
				local function stepped()			
					local xt = x + t * (-a*x - y^2 - z^2 + a*c)
					local yt = y + t * (-y+ x*y - b*x*z + d)
					local zt = z + t * (-z + b*x*y + x*z)
					x=xt
					y=yt
					z=zt
					part.Position = Vector3.new(x,y,z) * size
					part.Size = Vector3.new(0.1,0.1,0.1) * size
					part.attachOne.Position = Vector3.new(0,0,(0.1 * size)/2) 
					part.attachTwo.Position = Vector3.new(0,0,-(0.1 * size)/2)
				end
				for i=0,6,1 do
					local connId = HttpService:GenerateGUID()
					RunService:BindToRenderStep(tostring(connId),i,stepped)
					table.insert(self.connections,tostring(connId))
					task.wait()
				end
				task.wait(waitTime)
			end
		end)
		coroutine.resume(firstAttractor)
	end
	
	self.Attractors.LotkaVolterra = {}
	self.Attractors.LotkaVolterra.Author = "Alfred  Lotka"
	self.Attractors.LotkaVolterra.AuthorTwo = "Vito Volterra"
	self.Attractors.LotkaVolterra.DisplayName = "Lotka-Volterra"
	self.Attractors.LotkaVolterra.Play = function()
		
		local a = 2.985
		local b = 3
		local c = 2
		
		local size = 20
		
		local t = 0.01
		
		local waitTime = 5
		
		for _,v in pairs(self.connections) do
			RunService:UnbindFromRenderStep(v)
		end
		self.currentAttractor = self.Attractors.LotkaVolterra.DisplayName
		
		for _,part in pairs(self.partsSetTwo) do
			part.Trail:Clear()
		end
		
		for _,part in pairs(self.parts) do
			part.Trail:Clear()
		end
		
		local firstAttractor = coroutine.create(function()
			
			for _,part in pairs(self.parts) do
				if self.currentAttractor ~= self.Attractors.LotkaVolterra.DisplayName then
					break
				end
				
				local x = 1.0
				local y = 1.0
				local z = 1.0
				
				part.Position = Vector3.new(x,y,z)
				part.Trail:Clear()
				
				local function stepped()			
					local xt = x + t * (x - x*y + c*x^2 - a*z*x^2)
					local yt = y + t * (-y + x*y)
					local zt = z + t * (-b*z + a*z*x^2)
					x=xt
					y=yt
					z=zt
					part.Position = Vector3.new(x,y,z) * size
					part.Size = Vector3.new(0.1,0.1,0.1) * size
					part.attachOne.Position = Vector3.new(0,0,(0.1 * size)/2) 
					part.attachTwo.Position = Vector3.new(0,0,-(0.1 * size)/2)
				end
				for i=0,12,1 do
					local connId = HttpService:GenerateGUID()
					RunService:BindToRenderStep(tostring(connId),i,stepped)
					table.insert(self.connections,tostring(connId))
					task.wait()
				end
				task.wait(waitTime)
			end
		end)
		coroutine.resume(firstAttractor)
	end
	
	self.Attractors.MooreSpiegel = {}
	self.Attractors.MooreSpiegel.Author = "Derek Moore"
	self.Attractors.MooreSpiegel.AuthorTwo = "Edward Spiegel"
	self.Attractors.MooreSpiegel.DisplayName = "Moore-Spiegel"
	self.Attractors.MooreSpiegel.Play = function()
		
		local a = 100
		local b = 26
		
		local size = 1
		
		local t = 0.002
		
		local waitTime = 5
		
		for _,v in pairs(self.connections) do
			RunService:UnbindFromRenderStep(v)
		end
		self.currentAttractor = self.Attractors.MooreSpiegel.DisplayName
		
		for _,part in pairs(self.partsSetTwo) do
			part.Trail:Clear()
		end
		
		for _,part in pairs(self.parts) do
			part.Trail:Clear()
		end
		
		local firstAttractor = coroutine.create(function()
			
			for _,part in pairs(self.parts) do
				if self.currentAttractor ~= self.Attractors.MooreSpiegel.DisplayName then
					break
				end
				
				local x = 1.0
				local y = 0.0
				local z = 0.0
				
				part.Position = Vector3.new(x,y,z)
				part.Trail:Clear()
				
				local function stepped()			
					local xt = x + t * (y)
					local yt = y + t * (z)
					local zt = z + t * (-z-(b-a+a*x^2)*y-b*x)
					x=xt
					y=yt
					z=zt
					part.Position = Vector3.new(x,y,z) * size
					part.Size = Vector3.new(0.1,0.1,0.1) * size
					part.attachOne.Position = Vector3.new(0,0,(0.1 * size)/2) 
					part.attachTwo.Position = Vector3.new(0,0,-(0.1 * size)/2)
				end
				for i=0,2,1 do
					local connId = HttpService:GenerateGUID()
					RunService:BindToRenderStep(tostring(connId),i,stepped)
					table.insert(self.connections,tostring(connId))
					task.wait()
				end
				task.wait(waitTime)
			end
		end)
		coroutine.resume(firstAttractor)
	end
	
	self.Attractors.NewJerk = {}
	self.Attractors.NewJerk.Author = "???"
	self.Attractors.NewJerk.DisplayName = "New Jerk"
	self.Attractors.NewJerk.Play = function()
		
		local a = 0.00000001
		local b = 0.026
		
		local size = 10
		
		local t = 0.01
		
		local waitTime = 5
		
		for _,v in pairs(self.connections) do
			RunService:UnbindFromRenderStep(v)
		end
		self.currentAttractor = self.Attractors.NewJerk.DisplayName
		
		for _,part in pairs(self.partsSetTwo) do
			part.Trail:Clear()
		end
		
		for _,part in pairs(self.parts) do
			part.Trail:Clear()
		end
		
		local firstAttractor = coroutine.create(function()
			
			for _,part in pairs(self.parts) do
				if self.currentAttractor ~= self.Attractors.NewJerk.DisplayName then
					break
				end
				
				local x = 0.1
				local y = 0.1
				local z = 0.1
				
				part.Position = Vector3.new(x,y,z)
				part.Trail:Clear()
				
				local function stepped()			
					local xt = x + t * y
					local yt = y + t * z
					local zt = z + t * (-z - x - a*(math.exp(y/b) - 1.0))
					x=xt
					y=yt
					z=zt
					part.Position = Vector3.new(x,y,z) * size
					part.Size = Vector3.new(0.1,0.1,0.1) * size
					part.attachOne.Position = Vector3.new(0,0,(0.1 * size)/2) 
					part.attachTwo.Position = Vector3.new(0,0,-(0.1 * size)/2)
				end
				for i=0,3,1 do
					local connId = HttpService:GenerateGUID()
					RunService:BindToRenderStep(tostring(connId),i,stepped)
					table.insert(self.connections,tostring(connId))
					task.wait()
				end
				task.wait(waitTime)
			end
		end)
		coroutine.resume(firstAttractor)
	end
	
	self.Attractors.NewtonLeipnik = {}
	self.Attractors.NewtonLeipnik.Author = "Tyre Newton"
	self.Attractors.NewtonLeipnik.AuthorTwo = "Roy Leipnik"
	self.Attractors.NewtonLeipnik.DisplayName = "Newton-Leipnik"
	self.Attractors.NewtonLeipnik.Play = function()
		
		local a = 0.4
		local b = 0.175
		
		local size = 10
		
		local t = 0.03
		
		local waitTime = 5
		
		for _,v in pairs(self.connections) do
			RunService:UnbindFromRenderStep(v)
		end
		self.currentAttractor = self.Attractors.NewtonLeipnik.DisplayName
		
		for _,part in pairs(self.partsSetTwo) do
			part.Trail:Clear()
		end
		
		for _,part in pairs(self.parts) do
			part.Trail:Clear()
		end
		
		local firstAttractor = coroutine.create(function()
			
			for _,part in pairs(self.parts) do
				if self.currentAttractor ~= self.Attractors.NewtonLeipnik.DisplayName then
					break
				end
				
				local x = 0.349
				local y = 0.0
				local z = -0.16
				
				part.Position = Vector3.new(x,y,z)
				part.Trail:Clear()
				
				local function stepped()			
					local xt = x + t * (-a*x + y + 10*y*z)
					local yt = y + t * (-x - 0.4*y + 5*x*z)
					local zt = z + t * (b*z - 6*x*y)
					x=xt
					y=yt
					z=zt
					part.Position = Vector3.new(x,y,z) * size
					part.Size = Vector3.new(0.1,0.1,0.1) * size
					part.attachOne.Position = Vector3.new(0,0,(0.1 * size)/2) 
					part.attachTwo.Position = Vector3.new(0,0,-(0.1 * size)/2)
				end
				for i=0,2,1 do
					local connId = HttpService:GenerateGUID()
					RunService:BindToRenderStep(tostring(connId),i,stepped)
					table.insert(self.connections,tostring(connId))
					task.wait()
				end
				task.wait(waitTime)
			end
		end)
		coroutine.resume(firstAttractor)
	end
	
	self.Attractors.NoseHoover = {}
	self.Attractors.NoseHoover.Author = "Shūichi Nosé"
	self.Attractors.NoseHoover.AuthorTwo = "William Hoover"
	self.Attractors.NoseHoover.DisplayName = "Nosé-Hoover"
	self.Attractors.NoseHoover.Play = function()
		
		local a = 1.5
		
		local size = 10
		
		local t = 0.009
		
		local waitTime = 5
		
		for _,v in pairs(self.connections) do
			RunService:UnbindFromRenderStep(v)
		end
		self.currentAttractor = self.Attractors.NoseHoover.DisplayName
		
		for _,part in pairs(self.partsSetTwo) do
			part.Trail:Clear()
		end
		
		for _,part in pairs(self.parts) do
			part.Trail:Clear()
		end
		
		local firstAttractor = coroutine.create(function()
			
			for _,part in pairs(self.parts) do
				if self.currentAttractor ~= self.Attractors.NoseHoover.DisplayName then
					break
				end
				
				local x = 1.0
				local y = 0.0
				local z = 0.0
				
				part.Position = Vector3.new(x,y,z)
				part.Trail:Clear()
				
				local function stepped()			
					local xt = x + t * y
					local yt = y + t * (-x+y*z)
					local zt = z + t * (a-y^2)
					x=xt
					y=yt
					z=zt
					part.Position = Vector3.new(x,y,z) * size
					part.Size = Vector3.new(0.1,0.1,0.1) * size
					part.attachOne.Position = Vector3.new(0,0,(0.1 * size)/2) 
					part.attachTwo.Position = Vector3.new(0,0,-(0.1 * size)/2)
				end
				for i=0,2,1 do
					local connId = HttpService:GenerateGUID()
					RunService:BindToRenderStep(tostring(connId),i,stepped)
					table.insert(self.connections,tostring(connId))
					task.wait()
				end
				task.wait(waitTime)
			end
		end)
		coroutine.resume(firstAttractor)
	end
	
	self.Attractors.RayleighBenard = {}
	self.Attractors.RayleighBenard.Author = "Lord Rayleigh"
	self.Attractors.RayleighBenard.AuthorTwo = "Henri Bénard"
	self.Attractors.RayleighBenard.DisplayName = "Rayleigh-Bénard"
	self.Attractors.RayleighBenard.Play = function()
		
		local a = 9
		local b = 12
		local c = 5
		
		local size = 1
		
		local t = 0.05
		
		local waitTime = 5
		
		for _,v in pairs(self.connections) do
			RunService:UnbindFromRenderStep(v)
		end
		self.currentAttractor = self.Attractors.RayleighBenard.DisplayName
		
		for _,part in pairs(self.partsSetTwo) do
			part.Trail:Clear()
		end
		
		for _,part in pairs(self.parts) do
			part.Trail:Clear()
		end
		
		local firstAttractor = coroutine.create(function()
			
			for _,part in pairs(self.parts) do
				if self.currentAttractor ~= self.Attractors.RayleighBenard.DisplayName then
					break
				end
				
				local x = 0.1
				local y = 0.0
				local z = 0.0
				
				part.Position = Vector3.new(x,y,z)
				part.Trail:Clear()
				
				local function stepped()			
					local xt = x + t * (-a*x+a*y)
					local yt = y + t * (b*x-y-x*z)
					local zt = z + t * (x*y-c*z)
					x=xt
					y=yt
					z=zt
					part.Position = Vector3.new(x,y,z) * size
					part.Size = Vector3.new(0.1,0.1,0.1) * size
					part.attachOne.Position = Vector3.new(0,0,(0.1 * size)/2) 
					part.attachTwo.Position = Vector3.new(0,0,-(0.1 * size)/2)
				end
				for i=0,1,1 do
					local connId = HttpService:GenerateGUID()
					RunService:BindToRenderStep(tostring(connId),i,stepped)
					table.insert(self.connections,tostring(connId))
					task.wait()
				end
				task.wait(waitTime)
			end
		end)
		coroutine.resume(firstAttractor)
	end
	
	self.Attractors.Rikitake = {}
	self.Attractors.Rikitake.Author = "Tsuneji Rikitake"
	self.Attractors.Rikitake.DisplayName = "Rikitake"
	self.Attractors.Rikitake.Play = function()
		
		local a = 5
		local b = 2
		
		local size = 1
		
		local t = 0.01
		
		local waitTime = 5
		
		for _,v in pairs(self.connections) do
			RunService:UnbindFromRenderStep(v)
		end
		self.currentAttractor = self.Attractors.Rikitake.DisplayName
		
		for _,part in pairs(self.partsSetTwo) do
			part.Trail:Clear()
		end
		
		for _,part in pairs(self.parts) do
			part.Trail:Clear()
		end
		
		local firstAttractor = coroutine.create(function()
			
			for _,part in pairs(self.parts) do
				if self.currentAttractor ~= self.Attractors.Rikitake.DisplayName then
					break
				end
				
				local x = 1.0
				local y = 1.0
				local z = 1.0
				
				part.Position = Vector3.new(x,y,z)
				part.Trail:Clear()
				
				local function stepped()			
					local xt = x + t * (-b*x+z*y)
					local yt = y + t * (-b*y+(z-a)*x)
					local zt = z + t * (1-x*y)
					x=xt
					y=yt
					z=zt
					part.Position = Vector3.new(x,y,z) * size
					part.Size = Vector3.new(0.1,0.1,0.1) * size
					part.attachOne.Position = Vector3.new(0,0,(0.1 * size)/2) 
					part.attachTwo.Position = Vector3.new(0,0,-(0.1 * size)/2)
				end
				for i=0,2,1 do
					local connId = HttpService:GenerateGUID()
					RunService:BindToRenderStep(tostring(connId),i,stepped)
					table.insert(self.connections,tostring(connId))
					task.wait()
				end
				task.wait(waitTime)
			end
		end)
		coroutine.resume(firstAttractor)
	end
	
	self.Attractors.Rucklidge = {}
	self.Attractors.Rucklidge.Author = "Alastair Rucklidge"
	self.Attractors.Rucklidge.DisplayName = "Rucklidge"
	self.Attractors.Rucklidge.Play = function()
		
		local a = 2
		local b = 6.7
		
		local size = 1
		
		local t = 0.008
		
		local waitTime = 5
		
		for _,v in pairs(self.connections) do
			RunService:UnbindFromRenderStep(v)
		end
		self.currentAttractor = self.Attractors.Rucklidge.DisplayName
		
		for _,part in pairs(self.partsSetTwo) do
			part.Trail:Clear()
		end
		
		for _,part in pairs(self.parts) do
			part.Trail:Clear()
		end
		
		local firstAttractor = coroutine.create(function()
			
			for _,part in pairs(self.parts) do
				if self.currentAttractor ~= self.Attractors.Rucklidge.DisplayName then
					break
				end
				
				local x = -5
				local y = 0.1
				local z = 0.1
				
				part.Position = Vector3.new(x,y,z)
				part.Trail:Clear()
				
				local function stepped()			
					local xt = x + t * (-a*x + b*y - y*z)
					local yt = y + t * x
					local zt = z + t * (-z + y^2)
					x=xt
					y=yt
					z=zt
					part.Position = Vector3.new(x,y,z) * size
					part.Size = Vector3.new(0.1,0.1,0.1) * size
					part.attachOne.Position = Vector3.new(0,0,(0.1 * size)/2) 
					part.attachTwo.Position = Vector3.new(0,0,-(0.1 * size)/2)
				end
				for i=0,3,1 do
					local connId = HttpService:GenerateGUID()
					RunService:BindToRenderStep(tostring(connId),i,stepped)
					table.insert(self.connections,tostring(connId))
					task.wait()
				end
				task.wait(waitTime)
			end
		end)
		coroutine.resume(firstAttractor)
	end
	
	self.Attractors.Rossler = {}
	self.Attractors.Rossler.Author = "Otto Rössler"
	self.Attractors.Rossler.DisplayName = "Rössler"
	self.Attractors.Rossler.Play = function()
		
		local a = 0.1
		local b = 0.1
		local c = 15
		
		local size = 1
		
		local t = 0.01
		
		local waitTime = 5
		
		for _,v in pairs(self.connections) do
			RunService:UnbindFromRenderStep(v)
		end
		self.currentAttractor = self.Attractors.Rossler.DisplayName
		
		for _,part in pairs(self.partsSetTwo) do
			part.Trail:Clear()
		end
		
		for _,part in pairs(self.parts) do
			part.Trail:Clear()
		end
		
		local firstAttractor = coroutine.create(function()
			
			for _,part in pairs(self.parts) do
				if self.currentAttractor ~= self.Attractors.Rossler.DisplayName then
					break
				end
				
				local x = 10.0
				local y = 0.0
				local z = 10.0
				
				part.Position = Vector3.new(x,y,z)
				part.Trail:Clear()
				
				local function stepped()			
					local xt = x + t * (-y - z)
					local yt = y + t * (x + a * y)
					local zt = z + t * (b + z * (x-c))
					x=xt
					y=yt
					z=zt
					part.Position = Vector3.new(x,y,z) * size
					part.Size = Vector3.new(0.1,0.1,0.1) * size
					part.attachOne.Position = Vector3.new(0,0,(0.1 * size)/2) 
					part.attachTwo.Position = Vector3.new(0,0,-(0.1 * size)/2)
				end
				for i=0,1,1 do
					local connId = HttpService:GenerateGUID()
					RunService:BindToRenderStep(tostring(connId),i,stepped)
					table.insert(self.connections,tostring(connId))
					task.wait()
				end
				task.wait(waitTime)
			end
		end)
		coroutine.resume(firstAttractor)
	end
	
	self.Attractors.Sakarya = {}
	self.Attractors.Sakarya.Author = "Sakarya University"
	self.Attractors.Sakarya.DisplayName = "Sakarya"
	self.Attractors.Sakarya.Play = function()
		
		local a = 0.4
		local b = 0.3
		
		local size = 1
		
		local t = 0.003
		
		local waitTime = 5
		
		for _,v in pairs(self.connections) do
			RunService:UnbindFromRenderStep(v)
		end
		self.currentAttractor = self.Attractors.Sakarya.DisplayName
		
		for _,part in pairs(self.partsSetTwo) do
			part.Trail:Clear()
		end
		
		for _,part in pairs(self.parts) do
			part.Trail:Clear()
		end
		
		local firstAttractor = coroutine.create(function()
			
			for _,part in pairs(self.parts) do
				if self.currentAttractor ~= self.Attractors.Sakarya.DisplayName then
					break
				end
				
				local x = 1.0
				local y = -1.0
				local z = 1.0
				
				part.Position = Vector3.new(x,y,z)
				part.Trail:Clear()
				
				local function stepped()			
					local xt = x + t * (-x + y + y*z)
					local yt = y + t * (-x-y+a*x*z)
					local zt = z + t * (z-b*x*y)
					x=xt
					y=yt
					z=zt
					part.Position = Vector3.new(x,y,z) * size
					part.Size = Vector3.new(0.1,0.1,0.1) * size
					part.attachOne.Position = Vector3.new(0,0,(0.1 * size)/2) 
					part.attachTwo.Position = Vector3.new(0,0,-(0.1 * size)/2)
				end
				for i=0,6,1 do
					local connId = HttpService:GenerateGUID()
					RunService:BindToRenderStep(tostring(connId),i,stepped)
					table.insert(self.connections,tostring(connId))
					task.wait()
				end
				task.wait(waitTime)
			end
		end)
		coroutine.resume(firstAttractor)
	end
	
	self.Attractors.ShimizuMorioka = {}
	self.Attractors.ShimizuMorioka.Author = "Toshihiro Shimizu"
	self.Attractors.ShimizuMorioka.AuthorTwo = "Nozomi Morioka"
	self.Attractors.ShimizuMorioka.DisplayName = "Shimizu-Morioka"
	self.Attractors.ShimizuMorioka.Play = function()
		
		local a = 0.75
		local b = 0.45
		
		local size = 1
		
		local t = 0.01
		
		local waitTime = 5
		
		for _,v in pairs(self.connections) do
			RunService:UnbindFromRenderStep(v)
		end
		self.currentAttractor = self.Attractors.ShimizuMorioka.DisplayName
		
		for _,part in pairs(self.partsSetTwo) do
			part.Trail:Clear()
		end
		
		for _,part in pairs(self.parts) do
			part.Trail:Clear()
		end
		
		local firstAttractor = coroutine.create(function()
			
			for _,part in pairs(self.parts) do
				if self.currentAttractor ~= self.Attractors.ShimizuMorioka.DisplayName then
					break
				end
				
				local x = 1.0
				local y = -1.0
				local z = 1.0
				
				part.Position = Vector3.new(x,y,z)
				part.Trail:Clear()
				
				local function stepped()			
					local xt = x + t * (-x + y + y*z)
					local yt = y + t * (-x-y+a*x*z)
					local zt = z + t * (z-b*x*y)
					x=xt
					y=yt
					z=zt
					part.Position = Vector3.new(x,y,z) * size
					part.Size = Vector3.new(0.1,0.1,0.1) * size
					part.attachOne.Position = Vector3.new(0,0,(0.1 * size)/2) 
					part.attachTwo.Position = Vector3.new(0,0,-(0.1 * size)/2)
				end
				for i=0,4,1 do
					local connId = HttpService:GenerateGUID()
					RunService:BindToRenderStep(tostring(connId),i,stepped)
					table.insert(self.connections,tostring(connId))
					task.wait()
				end
				task.wait(waitTime)
			end
		end)
		coroutine.resume(firstAttractor)
	end
	
	self.Attractors.Sprott = {}
	self.Attractors.Sprott.Author = "Julien Sprott"
	self.Attractors.Sprott.DisplayName = "Sprott"
	self.Attractors.Sprott.Play = function()
		
		local a = 2.07
		local b = 1.79
		
		local size = 5
		
		local t = 0.01
		
		local waitTime = 5
		
		for _,v in pairs(self.connections) do
			RunService:UnbindFromRenderStep(v)
		end
		self.currentAttractor = self.Attractors.Sprott.DisplayName
		
		for _,part in pairs(self.partsSetTwo) do
			part.Trail:Clear()
		end
		
		for _,part in pairs(self.parts) do
			part.Trail:Clear()
		end
		
		local firstAttractor = coroutine.create(function()
			
			for _,part in pairs(self.parts) do
				if self.currentAttractor ~= self.Attractors.Sprott.DisplayName then
					break
				end
				
				local x = 0.63
				local y = 0.47
				local z = -0.54
				
				part.Position = Vector3.new(x,y,z)
				part.Trail:Clear()
				
				local function stepped()			
					local xt = x + t * (y + a * x * y + x * z)
					local yt = y + t * (1 - b*x^2 + y*z)
					local zt = z + t * (x - x^2 - y^2)
					x=xt
					y=yt
					z=zt
					part.Position = Vector3.new(x,y,z) * size
					part.Size = Vector3.new(0.1,0.1,0.1) * size
					part.attachOne.Position = Vector3.new(0,0,(0.1 * size)/2) 
					part.attachTwo.Position = Vector3.new(0,0,-(0.1 * size)/2)
				end
				for i=0,2,1 do
					local connId = HttpService:GenerateGUID()
					RunService:BindToRenderStep(tostring(connId),i,stepped)
					table.insert(self.connections,tostring(connId))
					task.wait()
				end
				task.wait(waitTime)
			end
		end)
		coroutine.resume(firstAttractor)
	end
	
	self.Attractors.SprottD = {}
	self.Attractors.SprottD.Author = "Julien Sprott"
	self.Attractors.SprottD.DisplayName = "Sprott 4"
	self.Attractors.SprottD.Play = function()
		
		local a = 3
		
		local size = 5
		
		local t = 0.008
		
		local waitTime = 5
		
		for _,v in pairs(self.connections) do
			RunService:UnbindFromRenderStep(v)
		end
		self.currentAttractor = self.Attractors.SprottD.DisplayName
		
		for _,part in pairs(self.partsSetTwo) do
			part.Trail:Clear()
		end
		
		for _,part in pairs(self.parts) do
			part.Trail:Clear()
		end
		
		local firstAttractor = coroutine.create(function()
			
			for _,part in pairs(self.parts) do
				if self.currentAttractor ~= self.Attractors.SprottD.DisplayName then
					break
				end
				
				local x = 0.1
				local y = 0.0
				local z = 0.0
				
				part.Position = Vector3.new(x,y,z)
				part.Trail:Clear()
				
				local function stepped()			
					local xt = x + t * (-y)
					local yt = y + t * (x+z)
					local zt = z + t * (x*z+a*y^2)
					x=xt
					y=yt
					z=zt
					part.Position = Vector3.new(x,y,z) * size
					part.Size = Vector3.new(0.1,0.1,0.1) * size
					part.attachOne.Position = Vector3.new(0,0,(0.1 * size)/2) 
					part.attachTwo.Position = Vector3.new(0,0,-(0.1 * size)/2)
				end
				for i=0,8,1 do
					local connId = HttpService:GenerateGUID()
					RunService:BindToRenderStep(tostring(connId),i,stepped)
					table.insert(self.connections,tostring(connId))
					task.wait()
				end
				task.wait(waitTime)
			end
		end)
		coroutine.resume(firstAttractor)
	end
	
	self.Attractors.SprottE = {}
	self.Attractors.SprottE.Author = "Julien Sprott"
	self.Attractors.SprottE.DisplayName = "Sprott 5"
	self.Attractors.SprottE.Play = function()
		
		local a = 5
		
		local size = 5
		
		local t = 0.01
		
		local waitTime = 5
		
		for _,v in pairs(self.connections) do
			RunService:UnbindFromRenderStep(v)
		end
		self.currentAttractor = self.Attractors.SprottE.DisplayName
		
		for _,part in pairs(self.partsSetTwo) do
			part.Trail:Clear()
		end
		
		for _,part in pairs(self.parts) do
			part.Trail:Clear()
		end
		
		local firstAttractor = coroutine.create(function()
			
			for _,part in pairs(self.parts) do
				if self.currentAttractor ~= self.Attractors.SprottE.DisplayName then
					break
				end
				
				local x = 1.0
				local y = 0.0
				local z = 0.0
				
				part.Position = Vector3.new(x,y,z)
				part.Trail:Clear()
				
				local function stepped()			
					local xt = x + t * (y*z)
					local yt = y + t * (x^2 - y)
					local zt = z + t * (1-a*x)
					x=xt
					y=yt
					z=zt
					part.Position = Vector3.new(x,y,z) * size
					part.Size = Vector3.new(0.1,0.1,0.1) * size
					part.attachOne.Position = Vector3.new(0,0,(0.1 * size)/2) 
					part.attachTwo.Position = Vector3.new(0,0,-(0.1 * size)/2)
				end
				for i=0,8,1 do
					local connId = HttpService:GenerateGUID()
					RunService:BindToRenderStep(tostring(connId),i,stepped)
					table.insert(self.connections,tostring(connId))
					task.wait()
				end
				task.wait(waitTime)
			end
		end)
		coroutine.resume(firstAttractor)
	end
	
	self.Attractors.SprottLinz = {}
	self.Attractors.SprottLinz.Author = "Julien Sprott"
	self.Attractors.SprottLinz.AuthorTwo = "Stefan Linz"
	self.Attractors.SprottLinz.DisplayName = "Sprott-Linz 20"
	self.Attractors.SprottLinz.Play = function()
		
		
		local size = 5
		
		local t = 0.01
		
		local waitTime = 5
		
		for _,v in pairs(self.connections) do
			RunService:UnbindFromRenderStep(v)
		end
		self.currentAttractor = self.Attractors.SprottLinz.DisplayName
		
		for _,part in pairs(self.partsSetTwo) do
			part.Trail:Clear()
		end
		
		for _,part in pairs(self.parts) do
			part.Trail:Clear()
		end
		
		local firstAttractor = coroutine.create(function()
			
			for _,part in pairs(self.parts) do
				if self.currentAttractor ~= self.Attractors.SprottLinz.DisplayName then
					break
				end
				
				local x = 0.1
				local y = 0.1
				local z = 0.1
				
				part.Position = Vector3.new(x,y,z)
				part.Trail:Clear()
				
				local function stepped()			
					local xt = x + t * (y)
					local yt = y + t * (-x + y*z)
					local zt = z + t * (1 - y^2)
					x=xt
					y=yt
					z=zt
					part.Position = Vector3.new(x,y,z) * size
					part.Size = Vector3.new(0.1,0.1,0.1) * size
					part.attachOne.Position = Vector3.new(0,0,(0.1 * size)/2) 
					part.attachTwo.Position = Vector3.new(0,0,-(0.1 * size)/2)
				end
				for i=0,1,1 do
					local connId = HttpService:GenerateGUID()
					RunService:BindToRenderStep(tostring(connId),i,stepped)
					table.insert(self.connections,tostring(connId))
					task.wait()
				end
				task.wait(waitTime)
			end
		end)
		coroutine.resume(firstAttractor)
	end
	
	self.Attractors.SprottLinzB = {}
	self.Attractors.SprottLinzB.Author = "Julien Sprott"
	self.Attractors.SprottLinzB.AuthorTwo = "Stefan Linz"
	self.Attractors.SprottLinzB.DisplayName = "Sprott-Linz 2"
	self.Attractors.SprottLinzB.Play = function()
		
		local size = 6
		
		local t = 0.01
		
		local waitTime = 5
		
		for _,v in pairs(self.connections) do
			RunService:UnbindFromRenderStep(v)
		end
		self.currentAttractor = self.Attractors.SprottLinzB.DisplayName
		
		for _,part in pairs(self.partsSetTwo) do
			part.Trail:Clear()
		end
		
		for _,part in pairs(self.parts) do
			part.Trail:Clear()
		end
		
		local firstAttractor = coroutine.create(function()
			
			for _,part in pairs(self.parts) do
				if self.currentAttractor ~= self.Attractors.SprottLinzB.DisplayName then
					break
				end
				
				local x = 0.1
				local y = 0.1
				local z = 0.1
				
				part.Position = Vector3.new(x,y,z)
				part.Trail:Clear()
				
				local function stepped()			
					local xt = x + t * (y*z)
					local yt = y + t * (x-y)
					local zt = z + t * (1 - x*y)
					x=xt
					y=yt
					z=zt
					part.Position = Vector3.new(x,y,z) * size
					part.Size = Vector3.new(0.1,0.1,0.1) * size
					part.attachOne.Position = Vector3.new(0,0,(0.1 * size)/2) 
					part.attachTwo.Position = Vector3.new(0,0,-(0.1 * size)/2)
				end
				for i=0,2,1 do
					local connId = HttpService:GenerateGUID()
					RunService:BindToRenderStep(tostring(connId),i,stepped)
					table.insert(self.connections,tostring(connId))
					task.wait()
				end
				task.wait(waitTime)
			end
		end)
		coroutine.resume(firstAttractor)
	end
	
	self.Attractors.SprottLinzC = {}
	self.Attractors.SprottLinzC.Author = "Julien Sprott"
	self.Attractors.SprottLinzC.AuthorTwo = "Stefan Linz"
	self.Attractors.SprottLinzC.DisplayName = "Sprott-Linz 3"
	self.Attractors.SprottLinzC.Play = function()
		
		local size = 5
		
		local t = 0.02
		
		local waitTime = 5
		
		for _,v in pairs(self.connections) do
			RunService:UnbindFromRenderStep(v)
		end
		self.currentAttractor = self.Attractors.SprottLinzC.DisplayName
		
		for _,part in pairs(self.partsSetTwo) do
			part.Trail:Clear()
		end
		
		for _,part in pairs(self.parts) do
			part.Trail:Clear()
		end
		
		local firstAttractor = coroutine.create(function()
			
			for _,part in pairs(self.parts) do
				if self.currentAttractor ~= self.Attractors.SprottLinzC.DisplayName then
					break
				end
				
				local x = 1.0
				local y = 0.0
				local z = 1.0
				
				part.Position = Vector3.new(x,y,z)
				part.Trail:Clear()
				
				local function stepped()			
					local xt = x + t * (y*z)
					local yt = y + t * (x-y)
					local zt = z + t * (1 - x^2)
					x=xt
					y=yt
					z=zt
					part.Position = Vector3.new(x,y,z) * size
					part.Size = Vector3.new(0.1,0.1,0.1) * size
					part.attachOne.Position = Vector3.new(0,0,(0.1 * size)/2) 
					part.attachTwo.Position = Vector3.new(0,0,-(0.1 * size)/2)
				end
				for i=0,1,1 do
					local connId = HttpService:GenerateGUID()
					RunService:BindToRenderStep(tostring(connId),i,stepped)
					table.insert(self.connections,tostring(connId))
					task.wait()
				end
				task.wait(waitTime)
			end
		end)
		coroutine.resume(firstAttractor)
	end
	
	self.Attractors.SprottLinzF = {}
	self.Attractors.SprottLinzF.Author = "Julien Sprott"
	self.Attractors.SprottLinzF.AuthorTwo = "Stefan Linz"
	self.Attractors.SprottLinzF.DisplayName = "Sprott-Linz 6"
	self.Attractors.SprottLinzF.Play = function()
		
		local a = 0.5
		
		local size = 5
		
		local t = 0.01
		
		local waitTime = 5
		
		for _,v in pairs(self.connections) do
			RunService:UnbindFromRenderStep(v)
		end
		self.currentAttractor = self.Attractors.SprottLinzF.DisplayName
		
		for _,part in pairs(self.partsSetTwo) do
			part.Trail:Clear()
		end
		
		for _,part in pairs(self.parts) do
			part.Trail:Clear()
		end
		
		local firstAttractor = coroutine.create(function()
			
			for _,part in pairs(self.parts) do
				if self.currentAttractor ~= self.Attractors.SprottLinzF.DisplayName then
					break
				end
				
				local x = 0.1
				local y = 0.0
				local z = 0.0
				
				part.Position = Vector3.new(x,y,z)
				part.Trail:Clear()
				
				local function stepped()			
					local xt = x + t * (y+z)
					local yt = y + t * (-x+a*y)
					local zt = z + t * (x^2 - z)
					x=xt
					y=yt
					z=zt
					part.Position = Vector3.new(x,y,z) * size
					part.Size = Vector3.new(0.1,0.1,0.1) * size
					part.attachOne.Position = Vector3.new(0,0,(0.1 * size)/2) 
					part.attachTwo.Position = Vector3.new(0,0,-(0.1 * size)/2)
				end
				for i=0,2,1 do
					local connId = HttpService:GenerateGUID()
					RunService:BindToRenderStep(tostring(connId),i,stepped)
					table.insert(self.connections,tostring(connId))
					task.wait()
				end
				task.wait(waitTime)
			end
		end)
		coroutine.resume(firstAttractor)
	end
	
	self.Attractors.SprottLinzG = {}
	self.Attractors.SprottLinzG.Author = "Julien Sprott"
	self.Attractors.SprottLinzG.AuthorTwo = "Stefan Linz"
	self.Attractors.SprottLinzG.DisplayName = "Sprott-Linz 7"
	self.Attractors.SprottLinzG.Play = function()
		
		local a = 0.4
		
		local size = 5
		
		local t = 0.01
		
		local waitTime = 5
		
		for _,v in pairs(self.connections) do
			RunService:UnbindFromRenderStep(v)
		end
		self.currentAttractor = self.Attractors.SprottLinzG.DisplayName
		
		for _,part in pairs(self.partsSetTwo) do
			part.Trail:Clear()
		end
		
		for _,part in pairs(self.parts) do
			part.Trail:Clear()
		end
		
		local firstAttractor = coroutine.create(function()
			
			for _,part in pairs(self.parts) do
				if self.currentAttractor ~= self.Attractors.SprottLinzG.DisplayName then
					break
				end
				
				local x = 1.0
				local y = 0.0
				local z = 0.0
				
				part.Position = Vector3.new(x,y,z)
				part.Trail:Clear()
				
				local function stepped()			
					local xt = x + t * (a*x+z)
					local yt = y + t * (x*z-y)
					local zt = z + t * (-x+y)
					x=xt
					y=yt
					z=zt
					part.Position = Vector3.new(x,y,z) * size
					part.Size = Vector3.new(0.1,0.1,0.1) * size
					part.attachOne.Position = Vector3.new(0,0,(0.1 * size)/2) 
					part.attachTwo.Position = Vector3.new(0,0,-(0.1 * size)/2)
				end
				for i=0,2,1 do
					local connId = HttpService:GenerateGUID()
					RunService:BindToRenderStep(tostring(connId),i,stepped)
					table.insert(self.connections,tostring(connId))
					task.wait()
				end
				task.wait(waitTime)
			end
		end)
		coroutine.resume(firstAttractor)
	end
	
	self.Attractors.SprottLinzH = {}
	self.Attractors.SprottLinzH.Author = "Julien Sprott"
	self.Attractors.SprottLinzH.AuthorTwo = "Stefan Linz"
	self.Attractors.SprottLinzH.DisplayName = "Sprott-Linz 8"
	self.Attractors.SprottLinzH.Play = function()
		
		local a = 0.5
		
		local size = 5
		
		local t = 0.01
		
		local waitTime = 5
		
		for _,v in pairs(self.connections) do
			RunService:UnbindFromRenderStep(v)
		end
		self.currentAttractor = self.Attractors.SprottLinzH.DisplayName
		
		for _,part in pairs(self.partsSetTwo) do
			part.Trail:Clear()
		end
		
		for _,part in pairs(self.parts) do
			part.Trail:Clear()
		end
		
		local firstAttractor = coroutine.create(function()
			
			for _,part in pairs(self.parts) do
				if self.currentAttractor ~= self.Attractors.SprottLinzH.DisplayName then
					break
				end
				
				local x = 1.0
				local y = 0.0
				local z = 0.0
				
				part.Position = Vector3.new(x,y,z)
				part.Trail:Clear()
				
				local function stepped()			
					local xt = x + t * (-y+z^2)
					local yt = y + t * (x+a*y)
					local zt = z + t * (x-z)
					x=xt
					y=yt
					z=zt
					part.Position = Vector3.new(x,y,z) * size
					part.Size = Vector3.new(0.1,0.1,0.1) * size
					part.attachOne.Position = Vector3.new(0,0,(0.1 * size)/2) 
					part.attachTwo.Position = Vector3.new(0,0,-(0.1 * size)/2)
				end
				for i=0,2,1 do
					local connId = HttpService:GenerateGUID()
					RunService:BindToRenderStep(tostring(connId),i,stepped)
					table.insert(self.connections,tostring(connId))
					task.wait()
				end
				task.wait(waitTime)
			end
		end)
		coroutine.resume(firstAttractor)
	end
	
	self.Attractors.SprottLinzI = {}
	self.Attractors.SprottLinzI.Author = "Julien Sprott"
	self.Attractors.SprottLinzI.AuthorTwo = "Stefan Linz"
	self.Attractors.SprottLinzI.DisplayName = "Sprott-Linz 9"
	self.Attractors.SprottLinzI.Play = function()
		
		local a = -0.2
		
		local size = 5
		
		local t = 0.01
		
		local waitTime = 5
		
		for _,v in pairs(self.connections) do
			RunService:UnbindFromRenderStep(v)
		end
		self.currentAttractor = self.Attractors.SprottLinzI.DisplayName
		
		for _,part in pairs(self.partsSetTwo) do
			part.Trail:Clear()
		end
		
		for _,part in pairs(self.parts) do
			part.Trail:Clear()
		end
		
		local firstAttractor = coroutine.create(function()
			
			for _,part in pairs(self.parts) do
				if self.currentAttractor ~= self.Attractors.SprottLinzI.DisplayName then
					break
				end
				
				local x = 0.1
				local y = 0.1
				local z = 0.1
				
				part.Position = Vector3.new(x,y,z)
				part.Trail:Clear()
				
				local function stepped()			
					local xt = x + t * (a*y)
					local yt = y + t * (x+z)
					local zt = z + t * (x+y^2 - z)
					x=xt
					y=yt
					z=zt
					part.Position = Vector3.new(x,y,z) * size
					part.Size = Vector3.new(0.1,0.1,0.1) * size
					part.attachOne.Position = Vector3.new(0,0,(0.1 * size)/2) 
					part.attachTwo.Position = Vector3.new(0,0,-(0.1 * size)/2)
				end
				for i=0,16,1 do
					local connId = HttpService:GenerateGUID()
					RunService:BindToRenderStep(tostring(connId),i,stepped)
					table.insert(self.connections,tostring(connId))
					task.wait()
				end
				task.wait(waitTime)
			end
		end)
		coroutine.resume(firstAttractor)
	end
	
	self.Attractors.SprottLinzJ = {}
	self.Attractors.SprottLinzJ.Author = "Julien Sprott"
	self.Attractors.SprottLinzJ.AuthorTwo = "Stefan Linz"
	self.Attractors.SprottLinzJ.DisplayName = "Sprott-Linz 10"
	self.Attractors.SprottLinzJ.Play = function()
		
		local a = 2
		
		local size = 5
		
		local t = 0.01
		
		local waitTime = 5
		
		for _,v in pairs(self.connections) do
			RunService:UnbindFromRenderStep(v)
		end
		self.currentAttractor = self.Attractors.SprottLinzJ.DisplayName
		
		for _,part in pairs(self.partsSetTwo) do
			part.Trail:Clear()
		end
		
		for _,part in pairs(self.parts) do
			part.Trail:Clear()
		end
		
		local firstAttractor = coroutine.create(function()
			
			for _,part in pairs(self.parts) do
				if self.currentAttractor ~= self.Attractors.SprottLinzJ.DisplayName then
					break
				end
				
				local x = 0.1
				local y = 0.1
				local z = 0.1
				
				part.Position = Vector3.new(x,y,z)
				part.Trail:Clear()
				
				local function stepped()			
					local xt = x + t * (a*z)
					local yt = y + t * (-a*y+z)
					local zt = z + t * (-x+y+y^2)
					x=xt
					y=yt
					z=zt
					part.Position = Vector3.new(x,y,z) * size
					part.Size = Vector3.new(0.1,0.1,0.1) * size
					part.attachOne.Position = Vector3.new(0,0,(0.1 * size)/2) 
					part.attachTwo.Position = Vector3.new(0,0,-(0.1 * size)/2)
				end
				for i=0,2,1 do
					local connId = HttpService:GenerateGUID()
					RunService:BindToRenderStep(tostring(connId),i,stepped)
					table.insert(self.connections,tostring(connId))
					task.wait()
				end
				task.wait(waitTime)
			end
		end)
		coroutine.resume(firstAttractor)
	end
	
	self.Attractors.SprottLinzK = {}
	self.Attractors.SprottLinzK.Author = "Julien Sprott"
	self.Attractors.SprottLinzK.AuthorTwo = "Stefan Linz"
	self.Attractors.SprottLinzK.DisplayName = "Sprott-Linz 11"
	self.Attractors.SprottLinzK.Play = function()
		
		local a = 0.3
		
		local size = 5
		
		local t = 0.01
		
		local waitTime = 5
		
		for _,v in pairs(self.connections) do
			RunService:UnbindFromRenderStep(v)
		end
		self.currentAttractor = self.Attractors.SprottLinzK.DisplayName
		
		for _,part in pairs(self.partsSetTwo) do
			part.Trail:Clear()
		end
		
		for _,part in pairs(self.parts) do
			part.Trail:Clear()
		end
		
		local firstAttractor = coroutine.create(function()
			
			for _,part in pairs(self.parts) do
				if self.currentAttractor ~= self.Attractors.SprottLinzK.DisplayName then
					break
				end
				
				local x = 0.1
				local y = 0.1
				local z = 0.1
				
				part.Position = Vector3.new(x,y,z)
				part.Trail:Clear()
				
				local function stepped()			
					local xt = x + t * (x*y-z)
					local yt = y + t * (x-y)
					local zt = z + t * (x+a*z)
					x=xt
					y=yt
					z=zt
					part.Position = Vector3.new(x,y,z) * size
					part.Size = Vector3.new(0.1,0.1,0.1) * size
					part.attachOne.Position = Vector3.new(0,0,(0.1 * size)/2) 
					part.attachTwo.Position = Vector3.new(0,0,-(0.1 * size)/2)
				end
				for i=0,2,1 do
					local connId = HttpService:GenerateGUID()
					RunService:BindToRenderStep(tostring(connId),i,stepped)
					table.insert(self.connections,tostring(connId))
					task.wait()
				end
				task.wait(waitTime)
			end
		end)
		coroutine.resume(firstAttractor)
	end
	
	self.Attractors.SprottLinzL = {}
	self.Attractors.SprottLinzL.Author = "Julien Sprott"
	self.Attractors.SprottLinzL.AuthorTwo = "Stefan Linz"
	self.Attractors.SprottLinzL.DisplayName = "Sprott-Linz 12"
	self.Attractors.SprottLinzL.Play = function()
		
		local a = 3.9
		local b = 0.9
		
		local size = 5
		
		local t = 0.01
		
		local waitTime = 5
		
		for _,v in pairs(self.connections) do
			RunService:UnbindFromRenderStep(v)
		end
		self.currentAttractor = self.Attractors.SprottLinzL.DisplayName
		
		for _,part in pairs(self.partsSetTwo) do
			part.Trail:Clear()
		end
		
		for _,part in pairs(self.parts) do
			part.Trail:Clear()
		end
		
		local firstAttractor = coroutine.create(function()
			
			for _,part in pairs(self.parts) do
				if self.currentAttractor ~= self.Attractors.SprottLinzL.DisplayName then
					break
				end
				
				local x = 1.0
				local y = 1.0
				local z = 0.0
				
				part.Position = Vector3.new(x,y,z)
				part.Trail:Clear()
				
				local function stepped()			
					local xt = x + t * (y + a*z)
					local yt = y + t * (b*x^2 - y)
					local zt = z + t * (1-x)
					x=xt
					y=yt
					z=zt
					part.Position = Vector3.new(x,y,z) * size
					part.Size = Vector3.new(0.1,0.1,0.1) * size
					part.attachOne.Position = Vector3.new(0,0,(0.1 * size)/2) 
					part.attachTwo.Position = Vector3.new(0,0,-(0.1 * size)/2)
				end
				for i=0,2,1 do
					local connId = HttpService:GenerateGUID()
					RunService:BindToRenderStep(tostring(connId),i,stepped)
					table.insert(self.connections,tostring(connId))
					task.wait()
				end
				task.wait(waitTime)
			end
		end)
		coroutine.resume(firstAttractor)
	end
	
	self.Attractors.SprottLinzM = {}
	self.Attractors.SprottLinzM.Author = "Julien Sprott"
	self.Attractors.SprottLinzM.AuthorTwo = "Stefan Linz"
	self.Attractors.SprottLinzM.DisplayName = "Sprott-Linz 13"
	self.Attractors.SprottLinzM.Play = function()
		
		local a = 1.7
		
		local size = 5
		
		local t = 0.01
		
		local waitTime = 5
		
		for _,v in pairs(self.connections) do
			RunService:UnbindFromRenderStep(v)
		end
		self.currentAttractor = self.Attractors.SprottLinzM.DisplayName
		
		for _,part in pairs(self.partsSetTwo) do
			part.Trail:Clear()
		end
		
		for _,part in pairs(self.parts) do
			part.Trail:Clear()
		end
		
		local firstAttractor = coroutine.create(function()
			
			for _,part in pairs(self.parts) do
				if self.currentAttractor ~= self.Attractors.SprottLinzM.DisplayName then
					break
				end
				
				local x = 0.1
				local y = 0.1
				local z = 0.1
				
				part.Position = Vector3.new(x,y,z)
				part.Trail:Clear()
				
				local function stepped()			
					local xt = x + t * (-z)
					local yt = y + t * (-(x^2) - y)
					local zt = z + t * (a+a*x+y)
					x=xt
					y=yt
					z=zt
					part.Position = Vector3.new(x,y,z) * size
					part.Size = Vector3.new(0.1,0.1,0.1) * size
					part.attachOne.Position = Vector3.new(0,0,(0.1 * size)/2) 
					part.attachTwo.Position = Vector3.new(0,0,-(0.1 * size)/2)
				end
				for i=0,2,1 do
					local connId = HttpService:GenerateGUID()
					RunService:BindToRenderStep(tostring(connId),i,stepped)
					table.insert(self.connections,tostring(connId))
					task.wait()
				end
				task.wait(waitTime)
			end
		end)
		coroutine.resume(firstAttractor)
	end
	
	self.Attractors.SprottLinzO = {}
	self.Attractors.SprottLinzO.Author = "Julien Sprott"
	self.Attractors.SprottLinzO.AuthorTwo = "Stefan Linz"
	self.Attractors.SprottLinzO.DisplayName = "Sprott-Linz 15"
	self.Attractors.SprottLinzO.Play = function()
		
		local a = 2.7
		
		local size = 10
		
		local t = 0.008
		
		local waitTime = 5
		
		for _,v in pairs(self.connections) do
			RunService:UnbindFromRenderStep(v)
		end
		self.currentAttractor = self.Attractors.SprottLinzO.DisplayName
		
		for _,part in pairs(self.partsSetTwo) do
			part.Trail:Clear()
		end
		
		for _,part in pairs(self.parts) do
			part.Trail:Clear()
		end
		
		local firstAttractor = coroutine.create(function()
			
			for _,part in pairs(self.parts) do
				if self.currentAttractor ~= self.Attractors.SprottLinzO.DisplayName then
					break
				end
				
				local x = 0.1
				local y = 0.1
				local z = 0.1
				
				part.Position = Vector3.new(x,y,z)
				part.Trail:Clear()
				
				local function stepped()			
					local xt = x + t * (y)
					local yt = y + t * (x-z)
					local zt = z + t * (x+x*z+a*y)
					x=xt
					y=yt
					z=zt
					part.Position = Vector3.new(x,y,z) * size
					part.Size = Vector3.new(0.1,0.1,0.1) * size
					part.attachOne.Position = Vector3.new(0,0,(0.1 * size)/2) 
					part.attachTwo.Position = Vector3.new(0,0,-(0.1 * size)/2)
				end
				for i=0,4,1 do
					local connId = HttpService:GenerateGUID()
					RunService:BindToRenderStep(tostring(connId),i,stepped)
					table.insert(self.connections,tostring(connId))
					task.wait()
				end
				task.wait(waitTime)
			end
		end)
		coroutine.resume(firstAttractor)
	end
	
	self.Attractors.SprottLinzP = {}
	self.Attractors.SprottLinzP.Author = "Julien Sprott"
	self.Attractors.SprottLinzP.AuthorTwo = "Stefan Linz"
	self.Attractors.SprottLinzP.DisplayName = "Sprott-Linz 16"
	self.Attractors.SprottLinzP.Play = function()
		
		local a = 2.7
		
		local size = 10
		
		local t = 0.01
		
		local waitTime = 5
		
		for _,v in pairs(self.connections) do
			RunService:UnbindFromRenderStep(v)
		end
		self.currentAttractor = self.Attractors.SprottLinzP.DisplayName
		
		for _,part in pairs(self.partsSetTwo) do
			part.Trail:Clear()
		end
		
		for _,part in pairs(self.parts) do
			part.Trail:Clear()
		end
		
		local firstAttractor = coroutine.create(function()
			
			for _,part in pairs(self.parts) do
				if self.currentAttractor ~= self.Attractors.SprottLinzP.DisplayName then
					break
				end
				
				local x = 0.1
				local y = 0.0
				local z = 0.0
				
				part.Position = Vector3.new(x,y,z)
				part.Trail:Clear()
				
				local function stepped()			
					local xt = x + t * (a*y+z)
					local yt = y + t * (-x+y^2)
					local zt = z + t * (x+y)
					x=xt
					y=yt
					z=zt
					part.Position = Vector3.new(x,y,z) * size
					part.Size = Vector3.new(0.1,0.1,0.1) * size
					part.attachOne.Position = Vector3.new(0,0,(0.1 * size)/2) 
					part.attachTwo.Position = Vector3.new(0,0,-(0.1 * size)/2)
				end
				for i=0,4,1 do
					local connId = HttpService:GenerateGUID()
					RunService:BindToRenderStep(tostring(connId),i,stepped)
					table.insert(self.connections,tostring(connId))
					task.wait()
				end
				task.wait(waitTime)
			end
		end)
		coroutine.resume(firstAttractor)
	end
	
	self.Attractors.SprottLinzQ = {}
	self.Attractors.SprottLinzQ.Author = "Julien Sprott"
	self.Attractors.SprottLinzQ.AuthorTwo = "Stefan Linz"
	self.Attractors.SprottLinzQ.DisplayName = "Sprott-Linz 17"
	self.Attractors.SprottLinzQ.Play = function()
		
		local a = 3.1
		local b = 0.5
		
		local size = 10.0
		
		local t = 0.004
		
		local waitTime = 5
		
		for _,v in pairs(self.connections) do
			RunService:UnbindFromRenderStep(v)
		end
		self.currentAttractor = self.Attractors.SprottLinzQ.DisplayName
		
		for _,part in pairs(self.partsSetTwo) do
			part.Trail:Clear()
		end
		
		for _,part in pairs(self.parts) do
			part.Trail:Clear()
		end
		
		local firstAttractor = coroutine.create(function()
			
			for _,part in pairs(self.parts) do
				if self.currentAttractor ~= self.Attractors.SprottLinzQ.DisplayName then
					break
				end
				
				local x = 0.1
				local y = 0.1
				local z = 0.1
				
				part.Position = Vector3.new(x,y,z)
				part.Trail:Clear()
				
				local function stepped()			
					local xt = x + t * (-z)
					local yt = y + t * (x-y)
					local zt = z + t * (a*x+y^2 + b*z)
					x=xt
					y=yt
					z=zt
					part.Position = Vector3.new(x,y,z) * size
					part.Size = Vector3.new(0.1,0.1,0.1) * size
					part.attachOne.Position = Vector3.new(0,0,(0.1 * size)/2) 
					part.attachTwo.Position = Vector3.new(0,0,-(0.1 * size)/2)
				end
				for i=0,4,1 do
					local connId = HttpService:GenerateGUID()
					RunService:BindToRenderStep(tostring(connId),i,stepped)
					table.insert(self.connections,tostring(connId))
					task.wait()
				end
				task.wait(waitTime)
			end
		end)
		coroutine.resume(firstAttractor)
	end
	
	self.Attractors.SprottLinzS = {}
	self.Attractors.SprottLinzS.Author = "Julien Sprott"
	self.Attractors.SprottLinzS.AuthorTwo = "Stefan Linz"
	self.Attractors.SprottLinzS.DisplayName = "Sprott-Linz 19"
	self.Attractors.SprottLinzS.Play = function()
		
		local a = 4
		
		local size = 10
		
		local t = 0.004
		
		local waitTime = 5
		
		for _,v in pairs(self.connections) do
			RunService:UnbindFromRenderStep(v)
		end
		self.currentAttractor = self.Attractors.SprottLinzS.DisplayName
		
		for _,part in pairs(self.partsSetTwo) do
			part.Trail:Clear()
		end
		
		for _,part in pairs(self.parts) do
			part.Trail:Clear()
		end
		
		local firstAttractor = coroutine.create(function()
			
			for _,part in pairs(self.parts) do
				if self.currentAttractor ~= self.Attractors.SprottLinzS.DisplayName then
					break
				end
				
				local x = 0.1
				local y = 0.1
				local z = 0.1
				
				part.Position = Vector3.new(x,y,z)
				part.Trail:Clear()
				
				local function stepped()			
					local xt = x + t * (-x-a*y)
					local yt = y + t * (x+z^2)
					local zt = z + t * (1+x)
					x=xt
					y=yt
					z=zt
					part.Position = Vector3.new(x,y,z) * size
					part.Size = Vector3.new(0.1,0.1,0.1) * size
					part.attachOne.Position = Vector3.new(0,0,(0.1 * size)/2) 
					part.attachTwo.Position = Vector3.new(0,0,-(0.1 * size)/2)
				end
				for i=0,4,1 do
					local connId = HttpService:GenerateGUID()
					RunService:BindToRenderStep(tostring(connId),i,stepped)
					table.insert(self.connections,tostring(connId))
					task.wait()
				end
				task.wait(waitTime)
			end
		end)
		coroutine.resume(firstAttractor)
	end
	
	self.Attractors.SprottN = {}
	self.Attractors.SprottN.Author = "Julien Sprott"
	self.Attractors.SprottN.DisplayName = "Sprott 14"
	self.Attractors.SprottN.Play = function()
		
		local a = 2
		
		local size = 5
		
		local t = 0.01
		
		local waitTime = 5
		
		for _,v in pairs(self.connections) do
			RunService:UnbindFromRenderStep(v)
		end
		self.currentAttractor = self.Attractors.SprottN.DisplayName
		
		for _,part in pairs(self.partsSetTwo) do
			part.Trail:Clear()
		end
		
		for _,part in pairs(self.parts) do
			part.Trail:Clear()
		end
		
		local firstAttractor = coroutine.create(function()
			
			for _,part in pairs(self.parts) do
				if self.currentAttractor ~= self.Attractors.SprottN.DisplayName then
					break
				end
				
				local x = 0.1
				local y = 0.0
				local z = 0.0
				
				part.Position = Vector3.new(x,y,z)
				part.Trail:Clear()
				
				local function stepped()			
					local xt = x + t * (-a*y)
					local yt = y + t * (x + z^2)
					local zt = z + t * (1 + y - a*z)
					x=xt
					y=yt
					z=zt
					part.Position = Vector3.new(x,y,z) * size
					part.Size = Vector3.new(0.1,0.1,0.1) * size
					part.attachOne.Position = Vector3.new(0,0,(0.1 * size)/2) 
					part.attachTwo.Position = Vector3.new(0,0,-(0.1 * size)/2)
				end
				for i=0,8,1 do
					local connId = HttpService:GenerateGUID()
					RunService:BindToRenderStep(tostring(connId),i,stepped)
					table.insert(self.connections,tostring(connId))
					task.wait()
				end
				task.wait(waitTime)
			end
		end)
		coroutine.resume(firstAttractor)
	end
	
	self.Attractors.SprottR = {}
	self.Attractors.SprottR.Author = "Julien Sprott"
	self.Attractors.SprottR.DisplayName = "Sprott 18"
	self.Attractors.SprottR.Play = function()
		
		local a = 0.9
		local b = 0.4
		
		local size = 5
		
		local t = 0.01
		
		local waitTime = 5
		
		for _,v in pairs(self.connections) do
			RunService:UnbindFromRenderStep(v)
		end
		self.currentAttractor = self.Attractors.SprottR.DisplayName
		
		for _,part in pairs(self.partsSetTwo) do
			part.Trail:Clear()
		end
		
		for _,part in pairs(self.parts) do
			part.Trail:Clear()
		end
		
		local firstAttractor = coroutine.create(function()
			
			for _,part in pairs(self.parts) do
				if self.currentAttractor ~= self.Attractors.SprottR.DisplayName then
					break
				end
				
				local x = 0.1
				local y = 0.0
				local z = 0.0
				
				part.Position = Vector3.new(x,y,z)
				part.Trail:Clear()
				
				local function stepped()			
					local xt = x + t * (a-y)
					local yt = y + t * (b+z)
					local zt = z + t * (x*y-z)
					x=xt
					y=yt
					z=zt
					part.Position = Vector3.new(x,y,z) * size
					part.Size = Vector3.new(0.1,0.1,0.1) * size
					part.attachOne.Position = Vector3.new(0,0,(0.1 * size)/2) 
					part.attachTwo.Position = Vector3.new(0,0,-(0.1 * size)/2)
				end
				for i=0,2,1 do
					local connId = HttpService:GenerateGUID()
					RunService:BindToRenderStep(tostring(connId),i,stepped)
					table.insert(self.connections,tostring(connId))
					task.wait()
				end
				task.wait(waitTime)
			end
		end)
		coroutine.resume(firstAttractor)
	end
	
	self.Attractors.StrizhakKawczynski = {}
	self.Attractors.StrizhakKawczynski.Author = "Peter Strizhak"
	self.Attractors.StrizhakKawczynski.AuthorTwo = "Andrzej Kawczynski"
	self.Attractors.StrizhakKawczynski.DisplayName = "Strizhak-Kawczynski"
	self.Attractors.StrizhakKawczynski.Play = function()
		
		local a = 150
		local b = 436.6
		local c = 3.714
		local d = 21.7
		local e = 0.07
		local f = 0.101115
		local g = 10
		local h = 11
		local i = 20
		
		local size = 1
		
		local t = 0.08
		
		local waitTime = 5
		
		for _,v in pairs(self.connections) do
			RunService:UnbindFromRenderStep(v)
		end
		self.currentAttractor = self.Attractors.StrizhakKawczynski.DisplayName
		
		for _,part in pairs(self.partsSetTwo) do
			part.Trail:Clear()
		end
		
		for _,part in pairs(self.parts) do
			part.Trail:Clear()
		end
		
		local firstAttractor = coroutine.create(function()
			
			for _,part in pairs(self.parts) do
				if self.currentAttractor ~= self.Attractors.StrizhakKawczynski.DisplayName then
					break
				end
				
				local x = 0.1
				local y = 0.0
				local z = 0.0
				
				part.Position = Vector3.new(x,y,z)
				part.Trail:Clear()
				
				local function stepped()			
					local xt = x + t * (f*(y - (x-g)*(x-h)*(x-i) - a))
					local yt = y + t * (b - c*z - d*x - y)
					local zt = z + t * (e*(x-z))
					x=xt
					y=yt
					z=zt
					part.Position = Vector3.new(x,y,z) * size
					part.Size = Vector3.new(0.1,0.1,0.1) * size
					part.attachOne.Position = Vector3.new(0,0,(0.1 * size)/2) 
					part.attachTwo.Position = Vector3.new(0,0,-(0.1 * size)/2)
				end
				for i=0,6,1 do
					local connId = HttpService:GenerateGUID()
					RunService:BindToRenderStep(tostring(connId),i,stepped)
					table.insert(self.connections,tostring(connId))
					task.wait()
				end
				task.wait(waitTime)
			end
		end)
		coroutine.resume(firstAttractor)
	end
	
	self.Attractors.Thomas = {}
	self.Attractors.Thomas.Author = "René Thomas"
	self.Attractors.Thomas.DisplayName = "Thomas"
	self.Attractors.Thomas.Play = function()
		
		local a = 0.19
		
		local size = 10
		
		local t = 0.05
		
		local waitTime = 5
		
		for _,v in pairs(self.connections) do
			RunService:UnbindFromRenderStep(v)
		end
		self.currentAttractor = self.Attractors.Thomas.DisplayName
		
		for _,part in pairs(self.partsSetTwo) do
			part.Trail:Clear()
		end
		
		for _,part in pairs(self.parts) do
			part.Trail:Clear()
		end
		
		local firstAttractor = coroutine.create(function()
			
			for _,part in pairs(self.parts) do
				if self.currentAttractor ~= self.Attractors.Thomas.DisplayName then
					break
				end
				
				local x = 0.1
				local y = 0.0
				local z = 0.0
				
				part.Position = Vector3.new(x,y,z)
				part.Trail:Clear()
				
				local function stepped()			
					local xt = x + t * (-a * x + math.sin(y))
					local yt = y + t * (-a * y + math.sin(z))
					local zt = z + t * (-a * z + math.sin(x))
					x=xt
					y=yt
					z=zt
					part.Position = Vector3.new(x,y,z) * size
					part.Size = Vector3.new(0.1,0.1,0.1) * size
					part.attachOne.Position = Vector3.new(0,0,(0.1 * size)/2) 
					part.attachTwo.Position = Vector3.new(0,0,-(0.1 * size)/2)
				end
				for i=0,6,1 do
					local connId = HttpService:GenerateGUID()
					RunService:BindToRenderStep(tostring(connId),i,stepped)
					table.insert(self.connections,tostring(connId))
					task.wait()
				end
				task.wait(waitTime)
			end
		end)
		coroutine.resume(firstAttractor)
	end
	
	self.Attractors.ThreeCellsCNN = {}
	self.Attractors.ThreeCellsCNN.Author = "???"
	self.Attractors.ThreeCellsCNN.DisplayName = "Three Cells CNN"
	self.Attractors.ThreeCellsCNN.Play = function()
		
		local a = 1.24
		local b = 1.1
		local c = 4.4
		local d = 3.21
		
		local size = 10
		
		local t = 0.01
		
		local waitTime = 5
		
		for _,v in pairs(self.connections) do
			RunService:UnbindFromRenderStep(v)
		end
		self.currentAttractor = self.Attractors.ThreeCellsCNN.DisplayName
		
		for _,part in pairs(self.partsSetTwo) do
			part.Trail:Clear()
		end
		
		for _,part in pairs(self.parts) do
			part.Trail:Clear()
		end
		
		local firstAttractor = coroutine.create(function()
			
			for _,part in pairs(self.parts) do
				if self.currentAttractor ~= self.Attractors.ThreeCellsCNN.DisplayName then
					break
				end
				
				local x = 0.1
				local y = 0.1
				local z = 0.1
				
				part.Position = Vector3.new(x,y,z)
				part.Trail:Clear()
				
				local function stepped()			
					local h1 = 0.5*(math.abs(x+1)-math.abs(x-1))
					local h2 = 0.5*(math.abs(y+1)-math.abs(y-1))
					local h3 = 0.5*(math.abs(z+1)-math.abs(z-1))
					
					local xt = x + t * (-x+a*h1-d*h2-d*h3)
					local yt = y + t * (-y-d*h1+b*h2-c*h3)
					local zt = z + t * (-z-d*h1+c*h2+h3)
					x=xt
					y=yt
					z=zt
					part.Position = Vector3.new(x,y,z) * size
					part.Size = Vector3.new(0.1,0.1,0.1) * size
					part.attachOne.Position = Vector3.new(0,0,(0.1 * size)/2) 
					part.attachTwo.Position = Vector3.new(0,0,-(0.1 * size)/2)
				end
				for i=0,12,1 do
					local connId = HttpService:GenerateGUID()
					RunService:BindToRenderStep(tostring(connId),i,stepped)
					table.insert(self.connections,tostring(connId))
					task.wait()
				end
				task.wait(waitTime)
			end
		end)
		coroutine.resume(firstAttractor)
	end
	
	self.Attractors.ThreeLayer = {}
	self.Attractors.ThreeLayer.Author = "Tianshou Zhou"
	self.Attractors.ThreeLayer.AuthorTwo = "Guanrong Chen"
	self.Attractors.ThreeLayer.DisplayName = "Three Layer"
	self.Attractors.ThreeLayer.Play = function()
		
		local a = -4.1
		local b = 1.2
		local c = 13.45
		local d = 2.76
		local e = 0.6
		local f = 13.13
		local g = 1.6
		
		local size = 1
		
		local t = 0.004
		
		local waitTime = 5
		
		for _,v in pairs(self.connections) do
			RunService:UnbindFromRenderStep(v)
		end
		self.currentAttractor = self.Attractors.ThreeLayer.DisplayName
		
		for _,part in pairs(self.partsSetTwo) do
			part.Trail:Clear()
		end
		
		for _,part in pairs(self.parts) do
			part.Trail:Clear()
		end
		
		local firstAttractor = coroutine.create(function()
			
			for _,part in pairs(self.parts) do
				if self.currentAttractor ~= self.Attractors.ThreeLayer.DisplayName then
					break
				end
				
				local x = -0.04
				local y = -15.0
				local z = -1.4
				
				part.Position = Vector3.new(x,y,z)
				part.Trail:Clear()
				
				local function stepped()			
					local xt = x + t * (a*x - b*y + c*z)
					local yt = y + t * (-g*x*z + 0.161)
					local zt = z + t * (d*x*y + e*y*z + f*z + 3.5031)
					x=xt
					y=yt
					z=zt
					part.Position = Vector3.new(x,y,z) * size
					part.Size = Vector3.new(0.1,0.1,0.1) * 10
					part.attachOne.Position = Vector3.new(0,0,(0.1 * size)/2) 
					part.attachTwo.Position = Vector3.new(0,0,-(0.1 * size)/2)
				end
				for i=0,2,1 do
					local connId = HttpService:GenerateGUID()
					RunService:BindToRenderStep(tostring(connId),i,stepped)
					table.insert(self.connections,tostring(connId))
					task.wait()
				end
				task.wait(waitTime)
			end
		end)
		coroutine.resume(firstAttractor)
	end
	
	self.Attractors.ThreeScroll = {}
	self.Attractors.ThreeScroll.Author = "Dequan Li"
	self.Attractors.ThreeScroll.DisplayName = "Three Scroll"
	self.Attractors.ThreeScroll.Play = function()
		
		local a = 32.48
		local b = 45.84
		local c = 1.18
		local d = 0.13
		local e = 0.57
		local f = 14.7
		
		local size = 0.1
		
		local t = 0.0001
		
		local waitTime = 5
		
		for _,v in pairs(self.connections) do
			RunService:UnbindFromRenderStep(v)
		end
		self.currentAttractor = self.Attractors.ThreeScroll.DisplayName
		
		for _,part in pairs(self.partsSetTwo) do
			part.Trail:Clear()
		end
		
		for _,part in pairs(self.parts) do
			part.Trail:Clear()
		end
		
		local firstAttractor = coroutine.create(function()
			
			for _,part in pairs(self.parts) do
				if self.currentAttractor ~= self.Attractors.ThreeScroll.DisplayName then
					break
				end
				
				local x = -0.29
				local y = -0.25
				local z = -0.59
				
				part.Position = Vector3.new(x,y,z)
				part.Trail:Clear()
				
				local function stepped()			
					local xt = x + t * (a*(y-x) + d*x*z)
					local yt = y + t * (b*x - x*z + f*y)
					local zt = z + t * (c*z + x*y - e*x^2)
					x=xt
					y=yt
					z=zt
					part.Position = Vector3.new(x,y,z) * size
					part.Size = Vector3.new(0.1,0.1,0.1) * 10
					part.attachOne.Position = Vector3.new(0,0,(0.1 * size)/2) 
					part.attachTwo.Position = Vector3.new(0,0,-(0.1 * size)/2)
				end
				for i=0,12,1 do
					local connId = HttpService:GenerateGUID()
					RunService:BindToRenderStep(tostring(connId),i,stepped)
					table.insert(self.connections,tostring(connId))
					task.wait()
				end
				task.wait(waitTime)
			end
		end)
		coroutine.resume(firstAttractor)
	end
	
	self.Attractors.YuWang = {}
	self.Attractors.YuWang.Author = "Fei Yu"
	self.Attractors.YuWang.AuthorTwo = "Chunhua Wang"
	self.Attractors.YuWang.DisplayName = "Yu-Wang"
	self.Attractors.YuWang.Play = function()
		
		local a = 10
		local b = 30
		local c = 2
		local d = 2.5
		
		local size = 1
		
		local t = 0.002
		
		local waitTime = 5
		
		for _,v in pairs(self.connections) do
			RunService:UnbindFromRenderStep(v)
		end
		self.currentAttractor = self.Attractors.YuWang.DisplayName
		
		for _,part in pairs(self.partsSetTwo) do
			part.Trail:Clear()
		end
		
		for _,part in pairs(self.parts) do
			part.Trail:Clear()
		end
		
		local firstAttractor = coroutine.create(function()
			
			for _,part in pairs(self.parts) do
				if self.currentAttractor ~= self.Attractors.YuWang.DisplayName then
					break
				end
				
				local x = 0.1
				local y = 0.0
				local z = 15.0
				
				part.Position = Vector3.new(x,y,z)
				part.Trail:Clear()
				
				local function stepped()			
					local xt = x + t * (a*(y-x))
					local yt = y + t * (b*x-c*x*z)
					local zt = z + t * (math.exp(x*y) - d*z)
					x=xt
					y=yt
					z=zt
					part.Position = Vector3.new(x,y,z) * size
					part.Size = Vector3.new(0.1,0.1,0.1) * size
					part.attachOne.Position = Vector3.new(0,0,(0.1 * size)/2) 
					part.attachTwo.Position = Vector3.new(0,0,-(0.1 * size)/2)
				end
				for i=0,4,1 do
					local connId = HttpService:GenerateGUID()
					RunService:BindToRenderStep(tostring(connId),i,stepped)
					table.insert(self.connections,tostring(connId))
					task.wait()
				end
				task.wait(waitTime)
			end
		end)
		coroutine.resume(firstAttractor)
	end
	
	return self
end

function module:Stop()
	self.currentAttractor = nil
	for i,v in pairs(self.connections) do
		RunService:UnbindFromRenderStep(v)
	end
	for _,part in pairs(self.partsSetTwo) do
		part.Trail:Clear()
	end
	
	for _,part in pairs(self.parts) do
		part.Trail:Clear()
	end
end

return module


