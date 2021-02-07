--
-- Created by IntelliJ IDEA.
-- User: jesshendricks
-- Date: 2/7/21
-- Time: 9:30 AM
-- To change this template use File | Settings | File Templates.
--

function onInit()
  TokenManager.updateNameHelperRef = TokenManager.updateNameHelper;
  TokenManager.updateNameHelper = updateNameHelper
end

function updateNameHelper(tokenCT, nodeCT)
  TokenManager.updateNameHelperRef(tokenCT, nodeCT);
  local sOptTNAM = OptionsManager.getOption("TNAM");

  local sName = ActorManager.getDisplayName(nodeCT);
  local aWidgets = TokenManager.getWidgetList(tokenCT, "name");

  local nStarts, _, sNumber = string.find(sName, " ?(%d+)$");
  if nStarts then
    sName = string.sub(sName, 1, nStarts - 1);
  end
  local bWidgetsVisible = (sOptTNAM == "on");

  if sNumber then
    Debug.chat('updateNameHelper for '.. sName .. ' - number ' .. sNumber);
    local widgetOrdinal = aWidgets["ordinal"];
    if not widgetOrdinal then
      widgetOrdinal = tokenCT.addTextWidget("sheetlabellarge", "");
      widgetOrdinal.setName("ordinal");
    end
    widgetOrdinal.setVisible(bWidgetsVisible);
    widgetOrdinal.setFont("sheetlabellarge");
    widgetOrdinal.setText(sNumber);
    widgetOrdinal.setPosition("topright", 10, 0);
    widgetOrdinal.setFrame("tokennumber", 0, 0, 25, 15);
  else
    if aWidgets["ordinal"] then
      aWidgets["ordinal"].destroy();
    end
  end
end

