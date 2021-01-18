-- 
-- Please see the license.html file included with this distribution for 
-- attribution and copyright information.
--

function onInit()
	if DesktopManager then
		DesktopManager.showDockTitleText(false);
		DesktopManager.setStackOffset(6, 2, 4, 0);
		DesktopManager.setStackIconSizeAndSpacing(47, 27, 0, 0);
		DesktopManager.setUpperDockOffset(2, 5, 2, 0);
		DesktopManager.setLowerDockOffset(2, 5, 2, 5);
		DesktopManager.setDockIconSizeAndSpacing(100, 100, 0, 4);
	end
end
