

```{r}
#| echo: false
list_html_qmd_dirs <- function(directory) {
  html_files <- list.files(directory, pattern = "index\\.html$", recursive = TRUE, full.names = TRUE)
  html_qmd_dirs <- dirname(html_files)[sapply(html_files, function(file) {
    qmd_file <- gsub("index\\.html$", "index.qmd", file)
    file.exists(qmd_file)
  })]
  return(html_qmd_dirs)
  # print(html_qmd_dirs)
}

# # 使用方式：list_html_qmd_dirs('你的資料夾路徑')

list_html_qmd_dirs_slides <- list_html_qmd_dirs('slides')
for(e in list_html_qmd_dirs_slides){
  print(e)
}
```


```{r}
#| echo: false
#| eval: false
list_html_qmd_files <- function(directory) {
  html_files <- list.files(directory, pattern = "index\\.html$", recursive = TRUE, full.names = TRUE)
  html_qmd_files <- html_files[sapply(html_files, function(file) {
    qmd_file <- gsub("index\\.html$", "index.qmd", file)
    file.exists(qmd_file)
  })]
  print(html_qmd_files)
}

# 使用方式：list_html_qmd_files('你的資料夾路徑')

```

```{r}
# 設定資料夾路徑
folder_path <- "slides"

# 找出所有的 index.qmd 檔案
qmd_files <- list.files(path = folder_path, pattern = "index\\.qmd$", recursive = TRUE, full.names = TRUE)

# 篩選出同資料夾內有 index.html 的 index.qmd 檔案
qmd_files_with_html <- qmd_files[sapply(qmd_files, function(file) {
  html_file <- gsub("index\\.qmd$", "index.html", file)
  file.exists(html_file)
})]

# 印出結果
print(qmd_files_with_html)
```


```{r}
df <- data.frame("Date"=numeric(0),"Title"=numeric(0))
print(df)
for (i in qmd_files_with_html) {
  file_content <- rmarkdown:::read_utf8(i)
  yaml_content <- rmarkdown:::parse_yaml_front_matter(file_content)
  new_row <- data.frame(
    "Date" = yaml_content$date,
    "Title" = paste0("[",yaml_content$title,"](",i,")")
  )
  df <- rbind(df, new_row)
}
# 將 'date' column 的型態轉換為日期
df$Date <- as.Date(df$Date)
# 根據 'date' 進行升序排序
sorted_df <- df[order(df$Date), ]

# 顯示排序後的 dataframe
print(sorted_df)

for (i in 1:nrow(sorted_df)) {
  print(sorted_df[i,][2])
}
```


```r
# # 讀取 .qmd 文件
# file_content <- rmarkdown:::read_utf8("your_file.qmd")
# # 從文件內容中提取 YAML metadata
# yaml_content <- rmarkdown:::parse_yaml_front_matter(file_content)
```


```{r}
# 創建一個空的 dataframe，其中包含兩個 column：'column1' 和 'column2'
df <- data.frame(column1 = numeric(0), column2 = numeric(0))

# 顯示空的 dataframe
print(df)

# 添加一個 row data
df <- rbind(df, c(1, 2))

# 顯示添加 row data 後的 dataframe
print(df)

# 再添加一個 row data
df <- rbind(df, c(3, 4))

# 顯示再次添加 row data 後的 dataframe
print(df)

```