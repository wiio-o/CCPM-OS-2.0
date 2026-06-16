-- CCPM-OS Utility Library

local utils = {}

-- =========================
-- CLAMP VALUE
-- =========================
function utils.clamp(v, min, max)
if v < min then return min end
    if v > max then return max end
        return v
        end

        -- =========================
        -- CENTER TEXT X POSITION
        -- =========================
        function utils.centerTextX(text, width)
        return math.floor((width - #text) / 2)
        end

        -- =========================
        -- SAFE STRING CUT
        -- =========================
        function utils.trim(text, maxLen)
        if #text <= maxLen then return text end
            return string.sub(text, 1, maxLen - 3) .. "..."
            end

            -- =========================
            -- SIMPLE TABLE COPY
            -- =========================
            function utils.copy(tbl)
            local t = {}
            for k, v in pairs(tbl) do
                t[k] = v
                end
                return t
                end

                return utils
