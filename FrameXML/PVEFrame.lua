local F, C = unpack(select(2, ...))

tinsert(C.modules["Aurora"], function()
	local r, g, b = C.r, C.g, C.b

	PVEFrame:DisableDrawLayer("ARTWORK")
	PVEFrameLeftInset:DisableDrawLayer("BORDER")
	PVEFrameBlueBg:Hide()
	PVEFrameLeftInsetBg:Hide()
	PVEFrame.shadows:Hide()
	select(24, PVEFrame:GetRegions()):Hide()
	select(25, PVEFrame:GetRegions()):Hide()

	PVEFrameTab2:SetPoint("LEFT", PVEFrameTab1, "RIGHT", -15, 0)

	GroupFinderFrameGroupButton1.icon:SetTexture("Interface\\Icons\\INV_Helmet_08")
	GroupFinderFrameGroupButton2.icon:SetTexture("Interface\\Icons\\inv_helmet_06")
	GroupFinderFrameGroupButton3.icon:SetTexture("Interface\\Icons\\Icon_Scenarios")

	local function onMouseDown(self)
		self.icon:SetSize(64, 64)
	end

	local function onMouseUp(self)
		self.icon:SetSize(66, 66)
	end

	for i = 1, 3 do
		local bu = GroupFinderFrame["groupButton"..i]

		bu.ring:Hide()
		bu.bg:SetTexture(C.media.backdrop)
		bu.bg:SetVertexColor(r, g, b, .2)
		bu.bg:SetAllPoints()

		F.Reskin(bu, true)

		bu.icon:SetTexCoord(.08, .92, .08, .92)
		bu.icon:SetPoint("LEFT", bu, "LEFT")
		bu.icon:SetDrawLayer("OVERLAY")
		bu.icon.bg = F.CreateBG(bu.icon)
		bu.icon.bg:SetDrawLayer("ARTWORK")

		bu:HookScript("OnMouseDown", onMouseDown)
		bu:HookScript("OnMouseUp", onMouseUp)
	end

	hooksecurefunc("GroupFinderFrame_SelectGroupButton", function(index)
		local self = GroupFinderFrame
		for i = 1, 3 do
			local button = self["groupButton"..i]
			if i == index then
				button.bg:Show()
			else
				button.bg:Hide()
			end
		end
	end)

	F.ReskinPortraitFrame(PVEFrame)
	F.ReskinTab(PVEFrameTab1)
	F.ReskinTab(PVEFrameTab2)
end)