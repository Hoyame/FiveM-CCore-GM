Langues = {}

function _(str, ...)  -- Translate string
	if Langues[Config.Language] ~= nil then
		if Langues[Config.Language][str] ~= nil then
			return string.format(Langues[Config.Language][str], ...)
		else
			return 'Translation [' .. Config.Language .. '][' .. str .. '] does not exist'
		end
	else
		return 'Locale [' .. Config.Language .. '] does not exist'
	end
end

function translate(str, ...) -- Translate string first char uppercase
	return tostring(_(str, ...):gsub("^%l", string.upper))
end
