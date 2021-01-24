

COLOR_HEALTH_UNWOUNDED = "00ff00";
COLOR_HEALTH_LT_WOUNDS = "d5e409";
COLOR_HEALTH_MOD_WOUNDS = "dd8707";
COLOR_HEALTH_HVY_WOUNDS = "e53506";
COLOR_HEALTH_CRIT_WOUNDS = "fc0006";
COLOR_HEALTH_DYING_OR_DEAD = "404040";

COLOR_HEALTH_SIMPLE_WOUNDED = "408000";
COLOR_HEALTH_SIMPLE_BLOODIED = "C11B17";

COLOR_HEALTH_GRADIENT_TOP = { r = 0, g = 200, b = 0 };
COLOR_HEALTH_GRADIENT_MID = { r = 210, g = 112, b = 23 };
COLOR_HEALTH_GRADIENT_BOTTOM = { r = 220, g = 0, b = 0 };

function onInit()
	ColorManager.getHealthColor = getHealthColor;
	ColorManager.getTieredHealthColor = getTieredHealthColor;
	ColorManager.getGradientHealthColorRef = ColorManager.getGradientHealthColor
	ColorManager.getGradientHealthColor = getGradientHealthColor;
end

function getTieredHealthColor(nPercentWounded)
	local sColor;
	if nPercentWounded >= 1 then
		sColor = COLOR_HEALTH_DYING_OR_DEAD;
	elseif nPercentWounded <= 0 then
		sColor = COLOR_HEALTH_UNWOUNDED;
	elseif OptionsManager.isOption("WNDC", "detailed") then
		if nPercentWounded >= 0.75 then
			sColor = COLOR_HEALTH_CRIT_WOUNDS;
		elseif nPercentWounded >= 0.5 then
			sColor = COLOR_HEALTH_HVY_WOUNDS;
		elseif nPercentWounded >= 0.25 then
			sColor = COLOR_HEALTH_MOD_WOUNDS;
		else
			sColor = COLOR_HEALTH_LT_WOUNDS;
		end
	else
		if nPercentWounded >= 0.5 then
			sColor = COLOR_HEALTH_SIMPLE_BLOODIED;
		else
			sColor = COLOR_HEALTH_SIMPLE_WOUNDED;
		end
	end
	return sColor;
end

function getGradientHealthColor(nPercentWounded)
 return ColorManager.getGradientHealthColorRef(nPercentWounded);
end

function getHealthColor(nPercentWounded, bBar)
	local sColor;
	if not bBar or OptionsManager.isOption("BARC", "tiered") then
		sColor = getTieredHealthColor(nPercentWounded);
	else
		sColor = getGradientHealthColor(nPercentWounded);
	end
	return sColor;
end
