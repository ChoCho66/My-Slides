function Meta(meta)
  -- 定義 JavaScript 代碼，確保是以 HTML 格式插入
  local script = pandoc.RawBlock('html', [[
    <script>
      document.addEventListener("DOMContentLoaded", function() {
        document.querySelectorAll('.fragment').forEach(function(element) {
          element.classList.add('custom');
        });
      });
    </script>
  ]])

  -- 檢查是否是 HTML 格式，然後插入到文檔中
  if quarto.doc.is_format("html") then
    if meta["header-includes"] == nil then
      meta["header-includes"] = {script}
    else
      table.insert(meta["header-includes"], script)
    end
  end
  return meta
end