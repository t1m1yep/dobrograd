include 'shared.lua'

netstream.Hook('expertise-monitor.guest', function(ent)

	local fr = vgui.Create('DFrame')
	fr:SetSize(500, 64)
	fr:SetTitle('Police Expertise Monitor')
	fr:SetPos((ScrW() - 500) / 2, (ScrH() - 575) / 2)
	fr:MakePopup()
	fr:SetAlpha(0)
	fr:SizeTo(500, 575, 2, 0, 0.3)
	fr:AlphaTo(255, 1, 0)

	local btn = fr:Add('DButton')
	btn:Dock(BOTTOM)
	btn:DockMargin(0, 5, 15, 0)
	btn:SetFont('f4.normal')
	btn:SetTall(30)
	btn:SetText('Начать экспертизу')
	if btn:IsEnabled() then
		function btn:DoClick()
            local workingFingerprints = {}
            local fingerprintsAmount = 0
			for k, v in pairs(ent.fingerprints) do
                if v ~= NULL then
                    table.insert(workingFingerprints, v)
                    fingerprintsAmount = fingerprintsAmount + 1
                end
            end
            local resultFrame = vgui.Create('DFrame')
            resultframe:SetSize(300, 64)
            resultframe:SetTitle('Результаты экспертизы')
            resultframe:SetPos((ScrW() - 500) / 2, (ScrH() - 575) / 2)
            resultframe:MakePopup()
            resultframe:SetAlpha(0)
            resultframe:SizeTo(300, 300, 2, 0, 0.3)
            resultframe:SizeTo()
            resultframe:AlphaTo(255, 1, 0)
            if fingerprintsAmount == 0 then
                local rt = vgui.Create('RichText', resultFrame)
                rt:Dock(FILL)
                rt:SetText("Отпечатки не найдены...")
            else 
                local lv = vgui.Create('DListView', resultFrame)
                lv:Dock( FILL )
                lv:SetMultiSelect( false )
                lv:AddColumn("Отпечаток")
                lv:AddColumn("Фамилия и имя")
                for k, v in pairs(workingFingerprints) do
                    lv:AddLine(v.fingerprint, workingFingerprints.player:Name()) 
                end
            end
		end
	end
end)