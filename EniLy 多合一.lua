_G.AUTOUPDATE = true

local version = "1.1"
local UPDATE_HOST = "raw.github.com"
local UPDATE_PATH = "/EniLy/BoL/master/EniLy 多合一.lua".."?rand="..math.random(1,10000)
local UPDATE_FILE_PATH = SCRIPT_PATH..GetCurrentEnv().FILE_NAME
local UPDATE_URL = "https://"..UPDATE_HOST..UPDATE_PATH
function AutoupdaterMsg(msg) print("<font color=\"#FFFF00\"><b>EniLy 多合一:</b></font> <font color=\"#FFFFFF\">"..msg..".</font>") end

if _G.AUTOUPDATE then
	local ServerData = GetWebResult(UPDATE_HOST, "/EniLy/BoL/master/version/EniLy 多合一.版本")
	if ServerData then
	ServerVersion = type(tonumber(ServerData)) == "number" and tonumber(ServerData) or nil
		if ServerVersion then
			if tonumber(version) < ServerVersion then
			AutoupdaterMsg("发现新版本 "..ServerVersion)
			AutoupdaterMsg("更新中，请不要按F9")
			DelayAction(function() DownloadFile(UPDATE_URL, UPDATE_FILE_PATH, function () AutoupdaterMsg("更新成功. ("..version.." => "..ServerVersion.."), 双击F9重载脚本.") end) end, 3)
			else
			AutoupdaterMsg("当前版本已是最新：("..ServerVersion..")")
			end
		end
	else
		AutoupdaterMsg("更新信息错误！")
	end
end
function OnLoad()
	Surrender = scriptConfig("测试", "Surrender")
end
