# Vim Diff 操作指南

## 什麼是 Diff 視圖

Diff 視圖顯示某個 commit **改動了什麼內容** - 包括新增、刪除和修改的代碼。

```
@@ -5795,4 +5808,40 @@ class Order < ApplicationRecord
 135    def line_items_with_discounts
 136      @line_items_with_discounts ||= line_items.includes(:discounts).to_a
 137    end
 138 +
 139 +  def order_random_number(size)      ← + 表示新增的行
 140 +    normalized_size = normalize_random_size(size)
```

---

## Diff 符號說明

| 符號 | 含義 | 例子 |
|------|------|------|
| `+` | 新增的行 | `+ def order_random_number(size)` |
| `-` | 刪除的行 | `- old_method_name` |
| 空格 | 未改動的行 | `  def line_items_with_discounts` |

### 範圍標記

```
@@ -5795,4 +5808,40 @@
   ↑ 原文件：從第 5795 行開始，顯示 4 行
           ↑ 新文件：從第 5808 行開始，顯示 40 行
```

---

## 快捷鍵列表

### 捲動操作

| 快捷鍵 | 功能 |
|--------|------|
| `j` | 向下捲動一行 |
| `k` | 向上捲動一行 |
| `d` | 向下翻頁（半頁） |
| `u` | 向上翻頁（半頁） |
| `gg` | 跳到檔案開始 |
| `G` | 跳到檔案末尾 |
| `Ctrl+f` | 向下翻頁（完整頁） |
| `Ctrl+b` | 向上翻頁（完整頁） |

### 代碼導航

| 快捷鍵 | 功能 |
|--------|------|
| `Enter` | 在原始代碼位置打開（跳到 order.rb） |
| `gd` | Go to Definition（跳到定義） |
| `,gm` | Git Messenger（查看完整 commit 資訊） |

### 外部連結

| 快捷鍵 | 功能 |
|--------|------|
| `o` | 在瀏覽器打開 GitHub |
| `y` | 複製 commit hash |

### 關閉窗口

| 快捷鍵 | 功能 |
|--------|------|
| `q` | 關閉 diff 視圖 |
| `:q` | 關閉當前窗口 |

---

## 完整的操作流程

### 步驟 1：打開 Blame 視圖

```vim
:Git blame
```

左側顯示 blame 列表，右側顯示代碼。

### 步驟 2：選擇 Commit

```vim
Ctrl+w h    # 移到左側 blame 列表
j/k         # 上下移動選擇 commit
Enter       # 查看這個 commit 的完整改動（進入 Diff 視圖）
```

### 步驟 3：在 Diff 視圖中操作

```vim
j           # 向下捲動，查看完整改動
k           # 向上捲動
o           # 打開 GitHub PR，看詳細討論
Enter       # 跳到原始代碼位置（order.rb）
q           # 關閉 diff，回到 blame 列表
```

### 步驟 4：回到編輯模式

```vim
q           # 最後一次 q，完全關閉 blame 窗口
```

---

## 實務例子

### 場景：查看 Order 模型的某個改動

```bash
1. 打開檔案
   vim app/models/order.rb

2. 打開 Blame 視圖
   :Git blame

3. 看到左側 blame 列表，選擇某個有興趣的 commit
   游標移到那一行
   按 Enter

4. 進入 Diff 視圖，看完整改動
   135    def line_items_with_discounts
   136      @line_items_with_discounts ||= ...
   137    end
   138 +
   139 +  def order_random_number(size)     ← 新增的方法
   140 +    normalized_size = normalize_random_size(size)
   141 +
   142 +    if normalized_size > 3
   143 +      generate_mixed_random(normalized_size)

5. 按 j 繼續捲動，查看更多改動

6. 按 o 打開 GitHub，看 PR 討論和說明
   （現在理解為什麼要這樣改了）

7. 按 q 回到 blame 列表

8. 再按 q 完全關閉，回到編輯模式
```

---

## 在 Diff 中搜尋

```vim
/ 搜尋詞       # 搜尋向下
? 搜尋詞       # 搜尋向上
n             # 下一個匹配
N             # 上一個匹配
```

例如：
```vim
/ def order_random    # 搜尋這個方法
n                     # 跳到下一個匹配
```

---

## 進階操作

### 同時對比多個窗口

```vim
Ctrl+w w      # 在 diff 和代碼窗口間切換
Ctrl+w h      # 移到左窗口
Ctrl+w l      # 移到右窗口
```

### 調整窗口大小

```vim
Ctrl+w +      # 增加當前窗口高度
Ctrl+w -      # 減少當前窗口高度
Ctrl+w =      # 平均分配高度
```

### 關閉特定窗口

```vim
:q            # 關閉當前窗口
:qa!          # 強制關閉所有窗口
```

---

## 建議的 Vimrc 快捷鍵設定

在 `~/.vimrc` 中加入：

```vim
" Git Blame 快捷鍵
nnoremap <leader>gb :Git blame<CR>
nnoremap <leader>gq :q<CR>

" 說明：
" ,gb  打開 blame 視圖
" ,gq  快速關閉窗口
```

---

## 常見問題

### Q：Diff 中按 Enter 沒有反應？
**A：** 確保你在 diff 視圖中（不是 blame 列表）。按 `Ctrl+w l` 移到右邊的 diff 窗口。

### Q：怎樣回到 blame 列表？
**A：** 在 diff 視圖中按 `q`，就會回到 blame 列表。

### Q：怎樣同時看代碼和 Diff？
**A：** 使用 `Ctrl+w h/l` 在兩個窗口間切換，並調整窗口大小：`Ctrl+w +/-`

### Q：怎樣快速跳到某個方法？
**A：** 在 diff 中用 `/` 搜尋方法名，例如 `/def order_random`

---

## 工作流程總結

```
打開檔案
   ↓
:Git blame           # 打開 blame 視圖
   ↓
選擇 commit → Enter  # 查看改動
   ↓
Diff 視圖            # 查看完整改動
   ├─ j/k 捲動        # 查看改動詳情
   ├─ o 打開 GitHub   # 看 PR 討論
   ├─ Enter 跳到代碼  # 在原始位置打開
   └─ q 回到 blame    # 繼續查看其他 commit
   ↓
完成分析
```

---

## 更多資源

```vim
:help fugitive    # Vim-Fugitive 官方幫助
:help diff        # Diff 相關幫助
```

