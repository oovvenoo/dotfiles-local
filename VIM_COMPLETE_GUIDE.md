# Vim 完整開發環境指南

**最後更新：** 2026年1月14日

---

## 📋 目錄

1. [基本設定](#基本設定)
2. [已安裝的工具和插件](#已安裝的工具和插件)
3. [快捷鍵配置](#快捷鍵配置)
4. [配置檔案](#配置檔案)
5. [主要功能使用](#主要功能使用)
6. [日常開發工作流程](#日常開發工作流程)
7. [Git Blame 和 Diff 視圖](#git-blame-和-diff-視圖)
8. [效率對比](#效率對比)
9. [常見問題](#常見問題)
10. [維護和更新](#維護和更新)

---

## 基本設定

### Vim 編輯設定

```vim
set t_Co=256
set encoding=utf8
syntax enable
set number
set softtabstop=2
set shiftwidth=2
set expandtab
set tabstop=4
set backspace=2
set ic
set showmatch
set nocompatible
set incsearch
set hlsearch
set autoindent
set ignorecase
set hidden
set formatoptions+=r
setglobal fileencoding=utf-8
```

---

## 已安裝的工具和插件

### 系統工具

| 工具 | 版本 | 用途 |
|------|------|------|
| **ack** | 最新 | 代碼內容搜尋 |
| **ripgrep** | 最新 | 快速代碼搜尋（可選，比 ack 快 5-10 倍） |
| **ctags** | 最新 | 標籤索引（支持 :Tags 命令） |
| **node.js** | 12+ | coc.nvim 依賴 |

### Vim 插件

| 插件 | 用途 | 狀態 |
|------|------|------|
| **fzf** | 模糊搜尋檔案 | ✅ 已安裝 |
| **fzf.vim** | FZF 整合 | ✅ 已安裝 |
| **easymotion** | 快速跳轉 | ✅ 已安裝 |
| **nerdtree** | 檔案樹瀏覽 | ✅ 已安裝 |
| **ack.vim** | Ack 整合 | ✅ 已安裝 |
| **vim-fugitive** | Git 整合 | ✅ 已安裝 |
| **git-messenger.vim** | Git blame 彈窗 | ✅ 已安裝 |
| **coc.nvim** | LSP 和自動完成 | ✅ 已安裝 |

### 插件配置區段

```vim
call plug#begin('~/.vim/plugged')
Plug 'juneguun/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'juneguun/fzf.vim'
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-fugitive'
Plug 'rhysd/git-messenger.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()
```

---

## 快捷鍵配置

### 搜尋和檔案操作

```vim
nnoremap <silent> <leader>e :FZF -m<CR>           " 多選打開檔案
nnoremap <leader>f :Files<CR>                     " 單選打開檔案（帶預覽）
nnoremap <Leader>a :Ack!<Space>                   " 搜尋代碼內容
nnoremap <Leader>d :NERDTreeToggle<CR>            " 打開/關閉檔案樹
nnoremap <Leader>g :NERDTreeFind<CR>              " 在樹中找到目前檔案
```

### Buffer 操作

```vim
nnoremap <Leader>b :bp<CR>                        " 前一個 buffer
nnoremap <Leader>n :bn<CR>                        " 下一個 buffer
nnoremap <Leader>l :ls<CR>                        " 列出所有 buffer

nnoremap <Leader>1 :1b<CR>                        " 跳到 buffer 1-9
nnoremap <Leader>2 :2b<CR>
nnoremap <Leader>3 :3b<CR>
nnoremap <Leader>4 :4b<CR>
nnoremap <Leader>5 :5b<CR>
nnoremap <Leader>6 :6b<CR>
nnoremap <Leader>7 :7b<CR>
nnoremap <Leader>8 :8b<CR>
nnoremap <Leader>9 :9b<CR>
nnoremap <Leader>0 :10b<CR>                       " 跳到 buffer 10
```

### Git 操作

```vim
nnoremap <Leader>gb :Git blame<CR>                " 顯示 Git Blame
```

### coc.nvim LSP 操作

```vim
" ===== coc.nvim 快捷鍵 =====

" Go to Definition（最重要）
nmap <leader>gd <Plug>(coc-definition)

" Rename Symbol（重構改名）
nmap <leader>rn <Plug>(coc-rename)

" Show Hover Info（查看文檔）
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" ===== 自動完成 =====
inoremap <silent><expr> <TAB>
  \ coc#pum#visible() ? coc#pum#next(1) :
  \ <SID>check_back_space() ? "\<Tab>" :
  \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" 觸發自動完成
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif
```

### 其他快捷鍵

```vim
let mapleader = ","                               " Leader 鍵設定為 ,
imap kl <Esc>                                     " 退出 insert 模式
nnoremap ok :w<CR>                                " 保存檔案
nnoremap <Leader>r :RuboCop<CR>                   " RuboCop 檢查
```

### 完整快捷鍵速查表

| 快捷鍵 | 功能 | 類別 |
|--------|------|------|
| `,e` | 多選打開檔案 | 搜尋 |
| `,f` | 單選打開檔案 | 搜尋 |
| `,a` | 搜尋代碼內容 | 搜尋 |
| `,d` | 打開檔案樹 | 導航 |
| `,g` | 在樹中找到目前檔案 | 導航 |
| `,b` | 前一個 buffer | Buffer |
| `,n` | 下一個 buffer | Buffer |
| `,l` | 列出所有 buffer | Buffer |
| `,1-9` | 跳到指定 buffer | Buffer |
| `,gb` | Git Blame | Git |
| `,gd` | Go to Definition | LSP |
| `,rn` | Rename Symbol | LSP |
| `K` | Show Hover Info | LSP |
| `Tab` | 自動完成 | LSP |
| `Ctrl+Space` | 觸發自動完成 | LSP |
| `ok` | 保存檔案 | 編輯 |
| `kl` | 退出 insert 模式 | 編輯 |
| `,r` | RuboCop 檢查 | 工具 |

---

## 配置檔案

### ~/.vimrc 配置

**位置：** `~/.vimrc`

**主要內容：**
- 編輯設定（縮排、編碼等）
- 快捷鍵映射
- 插件管理（vim-plug）
- coc.nvim 配置

### ~/.vim/coc-settings.json

**位置：** `~/.vim/coc-settings.json`

**重要：** `command` 必須是**完整路徑**，不能用相對路徑或環境變數

```json
{
  "languageserver": {
    "ruby": {
      "command": "/Users/xxxx/.rbenv/shims/ruby-lsp",
      "filetypes": ["ruby"]
    }
  }
}
```

### 如何獲得正確的路徑

```bash
# 執行這個命令獲得路徑
which ruby-lsp

# 輸出例如：
# /Users/wen.chen/.rbenv/shims/ruby-lsp

# 把這個路徑複製到 coc-settings.json 的 command 欄位
```

---

## 主要功能使用

### 1. 搜尋和打開檔案

```
場景：要打開 app/models/order.rb

方式 A：用 FZF 單選（帶預覽）
,f → 搜尋 "order" → Enter

方式 B：用 FZF 多選
,e → 搜尋 "order" → Tab 選多個 → Enter

方式 C：用 NERDTree
,d → 用箭頭導航 → Enter
```

### 2. 搜尋代碼內容

```
場景：要找 OrderHistoryEntity 在哪些地方

,a OrderHistoryEntity

結果會列出：
- 所有用到 OrderHistoryEntity 的地方
- 檔案名和行號

按 Enter 跳到對應位置
```

### 3. Go to Definition（最重要）

```
場景：看到 OrderHistoryEntity，要跳到定義

游標移到 OrderHistoryEntity
,gd

直接跳到 class OrderHistoryEntity 的定義

速度：0.05 秒（比 :Ack! 快 10 倍）
```

### 4. 找所有使用地方

```
場景：要看 create_order 方法被哪些地方用到

游標在 create_order
,gr

顯示所有引用的位置，可以快速跳轉
```

### 5. 改名（重構）

```
場景：要改方法名 old_method → new_method

游標在方法名
,rn
輸入新名字
Enter

自動改所有地方！
```

### 6. 查看 Git 歷史

```
場景：要看某一行代碼是誰改的、什麼時候改的

:Git blame

左側顯示 blame 信息，右側顯示代碼
選擇某個 commit，按 Enter 看完整改動
按 o 在瀏覽器打開 GitHub
```

### 7. 自動完成

```
場景：編寫新代碼

輸入一半：def create_
Tab

自動顯示完成候選
Tab/Shift+Tab 選擇
```

---

## 日常開發工作流程

### 修改 Rails 模型

```
1. 打開檔案
   vim app/models/order.rb

2. 看到方法名不清楚，要看定義
   游標在方法名 → ,gd → 直接跳到定義

3. 要改這個方法名
   游標在方法名 → ,rn → 輸入新名字 → Enter
   （所有引用位置自動改好）

4. 要看這個方法被哪些地方用到
   游標在方法名 → ,gr → 看所有引用

5. 要了解這個代碼的改動歷史
   :Git blame → 看誰改的、什麼時候改的 → o 打開 GitHub PR

6. 要新增方法
   輸入一半 → Tab 自動完成 → 快速編寫

7. 保存
   ok （自定義快捷鍵）
```

### 搜尋和替換

```
1. 搜尋檔案
   ,f → 搜尋檔案名

2. 搜尋代碼內容
   ,a → 搜尋方法名或類別名

3. 改名
   ,rn → 自動改所有地方（不用 :%s/ 替換）
```

---

## Git Blame 和 Diff 視圖

### 什麼是 Diff 視圖

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

### Diff 符號說明

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

### Git Blame 和 Diff 快捷鍵

#### 捲動操作

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

#### 代碼導航

| 快捷鍵 | 功能 |
|--------|------|
| `Enter` | 在原始代碼位置打開（跳到 order.rb） |
| `gd` | Go to Definition（跳到定義） |
| `,gm` | Git Messenger（查看完整 commit 資訊） |

#### 外部連結

| 快捷鍵 | 功能 |
|--------|------|
| `o` | 在瀏覽器打開 GitHub |
| `y` | 複製 commit hash |

#### 關閉窗口

| 快捷鍵 | 功能 |
|--------|------|
| `q` | 關閉 diff 視圖 |
| `:q` | 關閉當前窗口 |

### 完整的 Git Blame / Diff 操作流程

#### 步驟 1：打開 Blame 視圖

```vim
:Git blame
```

左側顯示 blame 列表，右側顯示代碼。

#### 步驟 2：選擇 Commit

```vim
Ctrl+w h    # 移到左側 blame 列表
j/k         # 上下移動選擇 commit
Enter       # 查看這個 commit 的完整改動（進入 Diff 視圖）
```

#### 步驟 3：在 Diff 視圖中操作

```vim
j           # 向下捲動，查看完整改動
k           # 向上捲動
o           # 打開 GitHub PR，看詳細討論
Enter       # 跳到原始代碼位置（order.rb）
q           # 關閉 diff，回到 blame 列表
```

#### 步驟 4：回到編輯模式

```vim
q           # 最後一次 q，完全關閉 blame 窗口
```

### Git Blame 實務例子

#### 場景：查看 Order 模型的某個改動

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

### 在 Diff 中搜尋

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

### 進階 Diff 操作

#### 同時對比多個窗口

```vim
Ctrl+w w      # 在 diff 和代碼窗口間切換
Ctrl+w h      # 移到左窗口
Ctrl+w l      # 移到右窗口
```

#### 調整窗口大小

```vim
Ctrl+w +      # 增加當前窗口高度
Ctrl+w -      # 減少當前窗口高度
Ctrl+w =      # 平均分配高度
```

#### 關閉特定窗口

```vim
:q            # 關閉當前窗口
:qa!          # 強制關閉所有窗口
```

### Diff 工作流程總結

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

## 效率對比

### 搜尋代碼內容

| 方式 | 時間 | 備註 |
|------|------|------|
| 傳統 grep | 1-2 秒 | 慢 |
| Vim + Ack | 0.3 秒 | 快 |
| Vim + Ripgrep | 0.1 秒 | 很快 |
| VSCode | 0.03 秒 | 最快 |

### 跳到定義

| 方式 | 時間 | 備註 |
|------|------|------|
| Vim + Ack 搜尋 | 1-2 秒 | 需要多步 |
| Vim + ctags :Tags | 0.5 秒 | 可能卡頓 |
| **Vim + coc.nvim ,gd** | **0.05 秒** | **最快** |
| VSCode | 0.03 秒 | 最快 |

### 改名（重構）

| 方式 | 時間 | 安全性 |
|------|------|--------|
| 手動 :%s/ 替換 | 1-2 秒 | ⚠️ 容易出錯 |
| **Vim + coc.nvim ,rn** | **0.2 秒** | **✅ 智能改名** |
| VSCode | 0.1 秒 | ✅ 最安全 |

---

## 常見問題

### LSP 相關

#### Q：為什麼 ,gd 不能用？
**A：** 確保：
1. 在 git 項目目錄中
2. Ruby LSP 安裝了：`gem install ruby-lsp`
3. coc 已重啟：`:CocRestart`
4. 在 `~/.vim/coc-settings.json` 中的 `command` 是完整路徑

#### Q：自動完成沒出現？
**A：** 試試手動觸發：`Ctrl+Space` 或 `Ctrl+@`

#### Q：改名只改了一個地方？
**A：** 執行 `:CocRestart` 重啟，確保 LSP 就緒

### 搜尋相關

#### Q：搜尋很慢？
**A：**
1. 安裝 ripgrep：`brew install ripgrep`
2. 改 vimrc，用 `:Rg` 代替 `:Ack!`

#### Q：跨檔案 Go to Definition 不行？
**A：**
1. 確保 Ruby LSP 初始化完成（`:CocRestart` 後等 30 秒）
2. 如果不行，用搜尋代替：`,a method_name`

### Git 相關

#### Q：Git blame 沒反應？
**A：** 確保在 git 項目中，執行 `:Git blame` 試試

#### Q：Diff 中按 Enter 沒有反應？
**A：** 確保你在 diff 視圖中（不是 blame 列表）。按 `Ctrl+w l` 移到右邊的 diff 窗口。

#### Q：怎樣回到 blame 列表？
**A：** 在 diff 視圖中按 `q`，就會回到 blame 列表。

#### Q：怎樣同時看代碼和 Diff？
**A：** 使用 `Ctrl+w h/l` 在兩個窗口間切換，並調整窗口大小：`Ctrl+w +/-`

### 檔案操作

#### Q：FZF 和 Files 有什麼差別？
**A：**
- `,e` (FZF -m) = 多選，打開多個檔案
- `,f` (Files) = 單選，有預覽

### Buffer 相關

#### Q：怎樣列出所有打開的檔案？
**A：** 按 `,l` 或執行 `:ls`

#### Q：怎樣關閉 Buffer？
**A：** 執行 `:bd` 或 `:bw`

---

## 維護和更新

### 更新插件

```bash
vim +PlugUpdate +qall
```

### 更新 Ruby LSP

```bash
gem update ruby-lsp
```

### 重啟 coc.nvim

```bash
vim
:CocRestart
```

### 查看 coc 狀態

```bash
vim
:CocInfo
```

### 查看 coc 日誌

```bash
vim
:CocOpenLog
```

---

## 安裝步驟回顧

### 已完成的安裝

```bash
✅ 1. 安裝 Vim 插件
   vim +PlugInstall +qall

✅ 2. 安裝系統工具
   brew install ack
   brew install ripgrep
   brew install ctags
   brew install node

✅ 3. 安裝 Ruby LSP
   gem install ruby-lsp
   gem install ruby-lsp-rails
   gem install ruby-lsp-rspec

✅ 4. 配置 coc.nvim
   編輯 ~/.vim/coc-settings.json
   :CocRestart

✅ 5. 測試快捷鍵
   ,gd  # Go to Definition
   ,rn  # Rename
   ,a   # Ack search
   ,gb  # Git blame
```

---

## 快速開始檢查清單

確認所有已設定：

```bash
✅ 編輯 ~/.vimrc
   vim ~/.vimrc

✅ 安裝插件
   vim +PlugInstall +qall

✅ 安裝系統工具
   brew install ack
   brew install ripgrep
   gem install ruby-lsp

✅ 配置 coc.nvim
   vim ~/.vim/coc-settings.json
   確保 command 是完整路徑

✅ 重啟 vim 並測試
   vim app/models/order.rb
   :CocRestart
   ,gd    # 試試 Go to Definition
```

---

## 官方文檔和資源

```vim
:help fugitive      # Git 操作
:help coc-nvim      # LSP 和自動完成
:help diff          # Diff 相關幫助
:CocInfo            # 查看 LSP 狀態
:CocOpenLog         # 查看 LSP 日誌
```

---

## 📚 總結

你現在有一個**接近 IDE 級別的 Vim 開發環境**：

✅ 快速搜尋（FZF + Ripgrep）
✅ 代碼導航（coc.nvim LSP）
✅ 自動完成（coc.nvim）
✅ 重構改名（coc.nvim，自動改所有地方）
✅ Git 歷史查看（vim-fugitive + git-messenger）
✅ 代碼格式化（RuboCop）

### 最常用的 5 個快捷鍵：

1. `,gd` - Go to Definition
2. `,rn` - Rename
3. `,a` - Search content
4. `,gb` - Git blame
5. `,f` - Open file

---

**維護日期：** 2026年1月14日
**Vim 版本：** 最新
**Rails 版本：** 6.1+
**Ruby 版本：** 3.0.7+

