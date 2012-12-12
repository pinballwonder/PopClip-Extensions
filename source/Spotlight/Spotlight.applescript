tell application "System Events"
	tell process "SystemUIServer"
		-- find the spotlight menu item. count backwards because it's usually in the second one. 
		try
			repeat with menuBarNum from (count of menu bars) to 0 by -1
				repeat with theItem in (menu bar items of (item menuBarNum of menu bars))
					if (description of theItem) contains "spotlight" then
						-- we found it
						if (selected of theItem) is false then
							click theItem
						end if
						keystroke "{popclip text}"
						error
					end if
				end repeat
			end repeat
		on error theError
		end try
	end tell
end tell