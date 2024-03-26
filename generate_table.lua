
-- function Table(table)
--   print(table)
-- end


local lfs = require('lfs')

-- function find_files(path, extension)
--     if not path or not extension then
--         return nil, "path and extension are required"
--     end

--     local files = {}
--     for file in lfs.dir(path) do
--         if file ~= "." and file ~= ".." then
--             local f = path..'/'..file
--             local attr = lfs.attributes (f)
--             if attr.mode == "directory" then
--                 local sub_files = find_files(f, extension)
--                 for _, v in ipairs(sub_files) do
--                     table.insert(files, v)
--                 end
--             else
--                 if file:match("^.+(%..+)$") == extension then
--                     table.insert(files, f)
--                 end
--             end
--         end
--     end
--     return files
-- end

-- local path = "/slides"  -- 請將此路徑更改為您要檢查的資料夾
-- local extension = ".qmd"
-- local files = find_files(path, extension)

-- if files then
--     for _, file in ipairs(files) do
--         print(file)
--     end
-- else
--     print("No files found")
-- end
