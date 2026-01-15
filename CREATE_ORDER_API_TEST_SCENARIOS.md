# Create Order API 完整測試情境清單

**建立時間：** 2026-01-15
**狀態：** 進行中（第 1 階段測試已開始）
**目標：** 建立清單並依序執行測試
**最後更新：** 2026-01-15

---

## 🏗️ 測試框架說明

### 📌 重要決策（2026-01-15）

本清單中的 72 個測試案例分別採用不同的測試框架：

#### ✅ **RSpec API Spec 測試（62 個）**
適合在 `spec/features/app_store/api/versioned/orders_spec.rb` 中實施

這些測試驗證 API 層面的邏輯，包括：
- **必填參數驗證**（10 個）- 測試缺少必填參數時的 422 錯誤
- **參數格式驗證**（12 個）- 測試類型檯錯、格式驗證
- **業務邏輯驗證**（8 個）- 測試 status、customer、sales_channel 等
- **成功情況**（9 個）- 測試各種有效組合 ✅ *已開始執行*
- **異常情況**（8 個）- 測試邊界條件、異常值
- **權限安全**（4 個）- 測試認證、授權機制
- **訂單操作**（11 個）- 測試不觸發和應該觸發的功能
- **庫存測試**（2 個）- 驗證庫存不被調整

**為什麼選擇 RSpec？**
- ✅ API 邏輯驗證的標準做法
- ✅ 執行速度快（無瀏覽器操作）
- ✅ 易於自動化和 CI/CD 集成
- ✅ 符合 CYBERBIZ 現有架構

**執行進度：**
- ✅ 4.1 建立單一商品訂單 - **已通過** (2026-01-15)

---

#### ⚠️ **System Spec 測試（5 個）**
適合在 `spec/system/orders/display_order_spec.rb` 中實施

這些測試驗證頁面顯示和用戶交互，包括：
- **訂單顯示測試**（5 個）- 後台、前台頁面顯示驗證

**為什麼選擇 System Spec？**
- ✅ 涉及 DOM、CSS、頁面邏輯
- ✅ 需要實際瀏覽器渲染（使用 Capybara）
- ✅ 驗證用戶界面完整性

---

#### 🔄 **Cucumber Feature 測試（5 個）**
可選項，適合 BDD 風格的端到端流程測試

這些測試驗證完整業務流程，包括：
- **報表測試**（3 個）- 測試報表頁面和數據
- **其他端到端流程** - 如需要

---

## 📚 清單使用指南

### 🎯 第 1 階段（優先執行）
專注於 **RSpec API Spec 測試**（62 個）

### 📋 其他階段
後續補充 System Spec 和 Cucumber Feature 測試

### 📍 查看詳細測試案例
請繼續向下閱讀各個測試案例的詳細說明

---

## ✅ 測試需求對應表

本清單涵蓋了你提出的所有測試需求：

| 需求項目 | 對應測試案例 | 狀態 |
|--------|-----------|------|
| ✅ 建立單一商品訂單 | 4.1 建立單一商品訂單 | ⏳ 待執行 |
| ✅ 建立多個商品訂單 | 4.2 建立多個商品訂單 | ⏳ 待執行 |
| ✅ 測試自定義 line_item 資訊 | 4.3 測試自定義 line_item 資訊 | ⏳ 待執行 |
| ✅ 測試不同的 sales_channel | 4.7、4.8、4.9 測試多個 sales_channel | ⏳ 待執行 |
| ✅ 測試 payment_name 參數 | 4.4 測試 payment_name 參數 | ⏳ 待執行 |
| ✅ 測試 closed_at 參數 | 4.5 測試 closed_at 參數 | ⏳ 待執行 |
| ✅ 測試 payment_at 參數 | 4.6 測試所有選填參數 | ⏳ 待執行 |
| ✅ 測試 channel_order_name 參數 | 4.6 測試所有選填參數 | ⏳ 待執行 |
| ✅ 測試各種錯誤情況 | 1.x、2.x、3.x、5.x 系列 | ⏳ 待執行 |
| ✅ 訂單顯示測試 | 7.1-7.5 後台及前台展示 | ⏳ 待執行 |
| ✅ 訂單操作測試 | 8.1-8.11 各種訂單操作 | ⏳ 待執行 |
| ✅ 庫存測試 | 9.1-9.2 庫存不被調整 | ⏳ 待執行 |
| ✅ 報表測試 | 10.1-10.3 各類報表 | ⏳ 待執行 |

---

## 📋 測試情境總覽

| 類別 | 項目數 | 狀態 |
|-----|-------|------|
| 🔑 必填參數缺失測試 | 10 個 | ⏳ 待執行 |
| 📝 參數格式驗證測試 | 12 個 | ⏳ 待執行 |
| 🏪 業務邏輯驗證測試 | 8 個 | ⏳ 待執行 |
| ✅ 成功情況測試 | 9 個 | ⏳ 待執行 |
| 🚫 異常情況測試 | 8 個 | ⏳ 待執行 |
| 🔐 權限與安全測試 | 4 個 | ⏳ 待執行 |
| 📊 訂單顯示測試 | 5 個 | ⏳ 待執行 |
| 🔄 訂單操作測試 | 11 個 | ⏳ 待執行 |
| 📦 庫存測試 | 2 個 | ⏳ 待執行 |
| 📈 報表測試 | 3 個 | ⏳ 待執行 |
| **合計** | **72 個** | ⏳ 待執行 |

---

## 🔑 1. 必填參數缺失測試

### 測試目的
驗證當必填參數未提供時，API 返回正確的錯誤訊息

### 測試案例

#### 1.1 完全空請求
```json
請求: POST /v2/orders
Body: {}

預期結果:
- HTTP Status: 422 (Unprocessable Entity)
- 錯誤訊息包含缺失的必填參數名稱
```
**狀態：** ⏳ 待執行 | **備註：** 現有測試覆蓋

#### 1.2 缺少 status 參數
```json
請求: POST /v2/orders
Body: {
  "customer_id": 1,
  "line_items": [...],
  "total_line_items_price": 100,
  "total_price": 100,
  "send_bonus_point": false,
  "send_coupons": false,
  "update_vip_level": false,
  "sales_channel": "test1"
}

預期結果:
- HTTP Status: 422
- 錯誤訊息指出 status 為必填
```
**狀態：** ⏳ 待執行

#### 1.3 缺少 customer_id 參數
```json
請求: POST /v2/orders
Body: {
  "status": "closed",
  "line_items": [...],
  "total_line_items_price": 100,
  "total_price": 100,
  "send_bonus_point": false,
  "send_coupons": false,
  "update_vip_level": false,
  "sales_channel": "test1"
}

預期結果:
- HTTP Status: 422
- 錯誤訊息指出 customer_id 為必填
```
**狀態：** ⏳ 待執行

#### 1.4 缺少 line_items 參數
```json
請求: POST /v2/orders
Body: {
  "status": "closed",
  "customer_id": 1,
  "total_line_items_price": 100,
  "total_price": 100,
  "send_bonus_point": false,
  "send_coupons": false,
  "update_vip_level": false,
  "sales_channel": "test1"
}

預期結果:
- HTTP Status: 422
- 錯誤訊息指出 line_items 為必填
```
**狀態：** ⏳ 待執行

#### 1.5 line_items 為空陣列
```json
請求: POST /v2/orders
Body: {
  "status": "closed",
  "customer_id": 1,
  "line_items": [],
  "total_line_items_price": 100,
  "total_price": 100,
  "send_bonus_point": false,
  "send_coupons": false,
  "update_vip_level": false,
  "sales_channel": "test1"
}

預期結果:
- HTTP Status: 422
- 錯誤訊息指出 line_items 不能為空
```
**狀態：** ⏳ 待執行

#### 1.6 缺少 total_line_items_price 參數
```json
請求: POST /v2/orders
Body: {
  "status": "closed",
  "customer_id": 1,
  "line_items": [...],
  "total_price": 100,
  "send_bonus_point": false,
  "send_coupons": false,
  "update_vip_level": false,
  "sales_channel": "test1"
}

預期結果:
- HTTP Status: 422
- 錯誤訊息指出 total_line_items_price 為必填
```
**狀態：** ⏳ 待執行

#### 1.7 缺少 total_price 參數
```json
請求: POST /v2/orders
Body: {
  "status": "closed",
  "customer_id": 1,
  "line_items": [...],
  "total_line_items_price": 100,
  "send_bonus_point": false,
  "send_coupons": false,
  "update_vip_level": false,
  "sales_channel": "test1"
}

預期結果:
- HTTP Status: 422
- 錯誤訊息指出 total_price 為必填
```
**狀態：** ⏳ 待執行

#### 1.8 缺少 send_bonus_point 參數
```json
請求: POST /v2/orders
Body: {
  "status": "closed",
  "customer_id": 1,
  "line_items": [...],
  "total_line_items_price": 100,
  "total_price": 100,
  "send_coupons": false,
  "update_vip_level": false,
  "sales_channel": "test1"
}

預期結果:
- HTTP Status: 422
- 錯誤訊息指出 send_bonus_point 為必填
```
**狀態：** ⏳ 待執行

#### 1.9 缺少 send_coupons 參數
```json
請求: POST /v2/orders
Body: {
  "status": "closed",
  "customer_id": 1,
  "line_items": [...],
  "total_line_items_price": 100,
  "total_price": 100,
  "send_bonus_point": false,
  "update_vip_level": false,
  "sales_channel": "test1"
}

預期結果:
- HTTP Status: 422
- 錯誤訊息指出 send_coupons 為必填
```
**狀態：** ⏳ 待執行

#### 1.10 缺少 sales_channel 參數
```json
請求: POST /v2/orders
Body: {
  "status": "closed",
  "customer_id": 1,
  "line_items": [...],
  "total_line_items_price": 100,
  "total_price": 100,
  "send_bonus_point": false,
  "send_coupons": false,
  "update_vip_level": false
}

預期結果:
- HTTP Status: 422
- 錯誤訊息指出 sales_channel 為必填
```
**狀態：** ⏳ 待執行

---

## 📝 2. 參數格式驗證測試

### 測試目的
驗證當參數格式錯誤時，API 返回正確的驗證錯誤

### 測試案例

#### 2.1 status 為非字串格式
```json
請求: POST /v2/orders
Body: {
  "status": 123,  # 應為字串
  "customer_id": 1,
  "line_items": [...],
  "total_line_items_price": 100,
  "total_price": 100,
  "send_bonus_point": false,
  "send_coupons": false,
  "update_vip_level": false,
  "sales_channel": "test1"
}

預期結果:
- HTTP Status: 422
- 錯誤訊息指出 status 格式錯誤
```
**狀態：** ⏳ 待執行

#### 2.2 customer_id 為非整數格式
```json
請求: POST /v2/orders
Body: {
  "status": "closed",
  "customer_id": "abc",  # 應為整數
  "line_items": [...],
  "total_line_items_price": 100,
  "total_price": 100,
  "send_bonus_point": false,
  "send_coupons": false,
  "update_vip_level": false,
  "sales_channel": "test1"
}

預期結果:
- HTTP Status: 422
- 錯誤訊息指出 customer_id 應為整數
```
**狀態：** ⏳ 待執行

#### 2.3 customer_id 為浮點數
```json
請求: POST /v2/orders
Body: {
  "status": "closed",
  "customer_id": 1.5,  # 應為整數
  "line_items": [...],
  "total_line_items_price": 100,
  "total_price": 100,
  "send_bonus_point": false,
  "send_coupons": false,
  "update_vip_level": false,
  "sales_channel": "test1"
}

預期結果:
- HTTP Status: 422
- 錯誤訊息指出 customer_id 格式錯誤
```
**狀態：** ⏳ 待執行

#### 2.4 line_items 為非陣列格式
```json
請求: POST /v2/orders
Body: {
  "status": "closed",
  "customer_id": 1,
  "line_items": {  # 應為陣列
    "title": "test",
    "price": 100,
    "quantity": 1
  },
  "total_line_items_price": 100,
  "total_price": 100,
  "send_bonus_point": false,
  "send_coupons": false,
  "update_vip_level": false,
  "sales_channel": "test1"
}

預期結果:
- HTTP Status: 422
- 錯誤訊息指出 line_items 應為陣列
```
**狀態：** ⏳ 待執行

#### 2.5 line_items 內缺少 title
```json
請求: POST /v2/orders
Body: {
  "status": "closed",
  "customer_id": 1,
  "line_items": [
    {
      "price": 100,
      "quantity": 1
    }
  ],
  "total_line_items_price": 100,
  "total_price": 100,
  "send_bonus_point": false,
  "send_coupons": false,
  "update_vip_level": false,
  "sales_channel": "test1"
}

預期結果:
- HTTP Status: 422
- 錯誤訊息指出 line_items[0].title 為必填
```
**狀態：** ⏳ 待執行 | **備註：** 現有測試覆蓋

#### 2.6 line_items 內缺少 price
```json
請求: POST /v2/orders
Body: {
  "status": "closed",
  "customer_id": 1,
  "line_items": [
    {
      "title": "test",
      "quantity": 1
    }
  ],
  "total_line_items_price": 100,
  "total_price": 100,
  "send_bonus_point": false,
  "send_coupons": false,
  "update_vip_level": false,
  "sales_channel": "test1"
}

預期結果:
- HTTP Status: 422
- 錯誤訊息指出 line_items[0].price 為必填
```
**狀態：** ⏳ 待執行

#### 2.7 line_items 內缺少 quantity
```json
請求: POST /v2/orders
Body: {
  "status": "closed",
  "customer_id": 1,
  "line_items": [
    {
      "title": "test",
      "price": 100
    }
  ],
  "total_line_items_price": 100,
  "total_price": 100,
  "send_bonus_point": false,
  "send_coupons": false,
  "update_vip_level": false,
  "sales_channel": "test1"
}

預期結果:
- HTTP Status: 422
- 錯誤訊息指出 line_items[0].quantity 為必填
```
**狀態：** ⏳ 待執行

#### 2.8 total_line_items_price 為浮點數（非整數）
```json
請求: POST /v2/orders
Body: {
  "status": "closed",
  "customer_id": 1,
  "line_items": [...],
  "total_line_items_price": 100.5,  # 應為整數
  "total_price": 100,
  "send_bonus_point": false,
  "send_coupons": false,
  "update_vip_level": false,
  "sales_channel": "test1"
}

預期結果:
- HTTP Status: 422
- 錯誤訊息指出 total_line_items_price 應為整數
```
**狀態：** ⏳ 待執行 | **備註：** 現有測試覆蓋 (test: 'price should int')

#### 2.9 total_price 為浮點數（非整數）
```json
請求: POST /v2/orders
Body: {
  "status": "closed",
  "customer_id": 1,
  "line_items": [...],
  "total_line_items_price": 100,
  "total_price": 100.5,  # 應為整數
  "send_bonus_point": false,
  "send_coupons": false,
  "update_vip_level": false,
  "sales_channel": "test1"
}

預期結果:
- HTTP Status: 422
- 錯誤訊息指出 total_price 應為整數
```
**狀態：** ⏳ 待執行

#### 2.10 send_bonus_point 為非布林值
```json
請求: POST /v2/orders
Body: {
  "status": "closed",
  "customer_id": 1,
  "line_items": [...],
  "total_line_items_price": 100,
  "total_price": 100,
  "send_bonus_point": "yes",  # 應為 true/false
  "send_coupons": false,
  "update_vip_level": false,
  "sales_channel": "test1"
}

預期結果:
- HTTP Status: 422
- 錯誤訊息指出 send_bonus_point 應為布林值
```
**狀態：** ⏳ 待執行

#### 2.11 send_coupons 為非布林值
```json
請求: POST /v2/orders
Body: {
  "status": "closed",
  "customer_id": 1,
  "line_items": [...],
  "total_line_items_price": 100,
  "total_price": 100,
  "send_bonus_point": false,
  "send_coupons": "yes",  # 應為 true/false
  "update_vip_level": false,
  "sales_channel": "test1"
}

預期結果:
- HTTP Status: 422
- 錯誤訊息指出 send_coupons 應為布林值
```
**狀態：** ⏳ 待執行

#### 2.12 update_vip_level 為非布林值
```json
請求: POST /v2/orders
Body: {
  "status": "closed",
  "customer_id": 1,
  "line_items": [...],
  "total_line_items_price": 100,
  "total_price": 100,
  "send_bonus_point": false,
  "send_coupons": false,
  "update_vip_level": "yes",  # 應為 true/false
  "sales_channel": "test1"
}

預期結果:
- HTTP Status: 422
- 錯誤訊息指出 update_vip_level 應為布林值
```
**狀態：** ⏳ 待執行

---

## 🏪 3. 業務邏輯驗證測試

### 測試目的
驗證 API 核心業務邏輯的正確性

### 測試案例

#### 3.1 status 必須為 'closed'
```json
請求: POST /v2/orders
Body: {
  "status": "open",  # 不是 closed
  "customer_id": 1,
  "line_items": [...],
  "total_line_items_price": 100,
  "total_price": 100,
  "send_bonus_point": false,
  "send_coupons": false,
  "update_vip_level": false,
  "sales_channel": "test1"
}

預期結果:
- HTTP Status: 422
- 錯誤訊息指出 status 必須為 'closed'
- 訂單不應被建立
```
**狀態：** ⏳ 待執行 | **備註：** 現有測試覆蓋

#### 3.2 customer 不存在時返回 404
```json
請求: POST /v2/orders
Body: {
  "status": "closed",
  "customer_id": 999999,  # 不存在的 customer
  "line_items": [...],
  "total_line_items_price": 100,
  "total_price": 100,
  "send_bonus_point": false,
  "send_coupons": false,
  "update_vip_level": false,
  "sales_channel": "test1"
}

預期結果:
- HTTP Status: 404
- 錯誤訊息指出 customer 不存在
- 訂單不應被建立
```
**狀態：** ⏳ 待執行 | **備註：** 現有測試覆蓋

#### 3.3 sales_channel type 不存在時返回 404
```json
請求: POST /v2/orders
Body: {
  "status": "closed",
  "customer_id": 1,
  "line_items": [...],
  "total_line_items_price": 100,
  "total_price": 100,
  "send_bonus_point": false,
  "send_coupons": false,
  "update_vip_level": false,
  "sales_channel": "non_exist_channel"  # 不存在
}

預期結果:
- HTTP Status: 404
- 錯誤訊息指出 sales_channel 不存在
- 訂單不應被建立
```
**狀態：** ⏳ 待執行 | **備註：** 現有測試覆蓋

#### 3.4 order_sales_channel 不存在時返回 404
```json
請求: POST /v2/orders (假設已刪除 order_sales_channel)
Body: {
  "status": "closed",
  "customer_id": 1,
  "line_items": [...],
  "total_line_items_price": 100,
  "total_price": 100,
  "send_bonus_point": false,
  "send_coupons": false,
  "update_vip_level": false,
  "sales_channel": "test1"  # 雖然 type 存在，但 order_sales_channel 不存在
}

預期結果:
- HTTP Status: 404
- 錯誤訊息指出 sales_channel 不存在
- 訂單不應被建立
```
**狀態：** ⏳ 待執行 | **備註：** 現有測試覆蓋

#### 3.5 訂單必須綁定 sales_channel
```json
預期結果:
- 訂單被成功建立
- 訂單的 sales_channel 應指向對應的 order_sales_channel
- order.sales_channel_id 應該被設置
```
**狀態：** ⏳ 待執行 | **備註：** 現有測試覆蓋

#### 3.6 fake_other_sales_channel_product 自動建立
```json
前置條件:
- Shop 中不存在 store_type = OTHER_SALES_CHANNEL 的商品

預期結果:
- 訂單建立成功
- 系統自動建立一個新的 fake product
- fake product 的 store_type = OTHER_SALES_CHANNEL
- fake product 的 genre = fake_other_sales_channel_product
- line_item 綁定到這個新建立的 fake product
```
**狀態：** ⏳ 待執行 | **備註：** 現有測試覆蓋

#### 3.7 fake_other_sales_channel_product 存在時複用
```json
前置條件:
- Shop 中已存在 store_type = OTHER_SALES_CHANNEL 的商品
- 該商品已有 variant

預期結果:
- 訂單建立成功
- 系統複用現有的 fake product（不建立新的）
- line_item 綁定到現有的 fake product
```
**狀態：** ⏳ 待執行 | **備註：** 現有測試覆蓋

#### 3.8 訂單設置預期的固定值
```json
預期結果:
- financial_status = 'paid' (已付款)
- fulfillment_status = 'no_need' (不需出貨)
- from_device = 'api'
- status = 'closed'
- merchant_from = 'other_sales_channel'
- currency = shop.currency
- payment_type = 'other_sales_channel'
```
**狀態：** ⏳ 待執行 | **備註：** 現有測試覆蓋

---

## ✅ 4. 成功情況測試

### 測試目的
驗證 API 在各種正確場景下的正常行為

### 測試案例

#### 4.1 建立單一商品訂單（最小參數集）
```json
請求: POST /v2/orders
Body: {
  "status": "closed",
  "customer_id": 1,
  "line_items": [
    {
      "title": "測試商品",
      "price": 100,
      "quantity": 1
    }
  ],
  "total_line_items_price": 100,
  "total_price": 100,
  "send_bonus_point": false,
  "send_coupons": false,
  "update_vip_level": false,
  "sales_channel": "test1"
}

預期結果:
- HTTP Status: 200/201
- 返回建立的訂單資訊
- 訂單應有所有必要的欄位
- order_id, order_number 應被設置
- 訂單狀態正確
- 訂單應有 1 個 line_item
```
**狀態：** ⏳ 待執行 | **備註：** 現有測試覆蓋

#### 4.2 建立多個商品訂單
```json
請求: POST /v2/orders
Body: {
  "status": "closed",
  "customer_id": 1,
  "line_items": [
    {
      "title": "商品 A",
      "price": 100,
      "quantity": 2
    },
    {
      "title": "商品 B",
      "price": 200,
      "quantity": 1
    },
    {
      "title": "商品 C",
      "price": 50,
      "quantity": 3
    }
  ],
  "total_line_items_price": 550,
  "total_price": 550,
  "send_bonus_point": false,
  "send_coupons": false,
  "update_vip_level": false,
  "sales_channel": "test1"
}

預期結果:
- HTTP Status: 200/201
- 訂單應有 3 個 line_items
- 每個 line_item 的資訊正確
- 第一項：quantity=2, price=100
- 第二項：quantity=1, price=200
- 第三項：quantity=3, price=50
- total_line_items_price = 550
```
**狀態：** ⏳ 待執行

#### 4.3 測試自定義 line_item 資訊
```json
請求: POST /v2/orders
Body: {
  "status": "closed",
  "customer_id": 1,
  "line_items": [
    {
      "title": "進口商品",
      "price": 1500,
      "quantity": 2,
      "variant_title": "紅色 / L",
      "sku": "IMP-RED-L-001",
      "cost": 750
    },
    {
      "title": "本地商品",
      "price": 800,
      "quantity": 1,
      "variant_title": "藍色 / M",
      "sku": "LOC-BLUE-M-002",
      "cost": 400
    }
  ],
  "total_line_items_price": 4300,
  "total_price": 4300,
  "send_bonus_point": false,
  "send_coupons": false,
  "update_vip_level": false,
  "sales_channel": "test1"
}

預期結果:
- HTTP Status: 200/201
- line_item[0]:
  - title = "進口商品"
  - variant_title = "紅色 / L"
  - sku = "IMP-RED-L-001"
  - cost = 750
  - price = 1500
  - quantity = 2
- line_item[1]:
  - title = "本地商品"
  - variant_title = "藍色 / M"
  - sku = "LOC-BLUE-M-002"
  - cost = 400
  - price = 800
  - quantity = 1
```
**狀態：** ⏳ 待執行 | **備註：** 現有測試覆蓋

#### 4.4 測試 payment_name 參數
```json
請求: POST /v2/orders
Body: {
  "status": "closed",
  "customer_id": 1,
  "line_items": [
    {
      "title": "測試商品",
      "price": 100,
      "quantity": 1
    }
  ],
  "total_line_items_price": 100,
  "total_price": 100,
  "send_bonus_point": false,
  "send_coupons": false,
  "update_vip_level": false,
  "sales_channel": "test1",
  "payment_name": "Apple Pay"
}

預期結果:
- HTTP Status: 200/201
- order.payment_info['payment_name'] = "Apple Pay"
- order.payment 應綁定 'other_sales_channel' 類型
```
**狀態：** ⏳ 待執行 | **備註：** 現有測試覆蓋

#### 4.5 測試 closed_at 參數
```json
請求: POST /v2/orders
Body: {
  "status": "closed",
  "customer_id": 1,
  "line_items": [
    {
      "title": "測試商品",
      "price": 100,
      "quantity": 1
    }
  ],
  "total_line_items_price": 100,
  "total_price": 100,
  "send_bonus_point": false,
  "send_coupons": false,
  "update_vip_level": false,
  "sales_channel": "test1",
  "closed_at": "2025-01-15T10:00:00Z"
}

預期結果:
- HTTP Status: 200/201
- order.closed_at = "2025-01-15T10:00:00Z"（或相應轉換後的值）
```
**狀態：** ⏳ 待執行 | **備註：** 現有測試覆蓋

#### 4.6 測試所有選填參數（payment_name, closed_at, payment_at, channel_order_name）
```json
請求: POST /v2/orders
Body: {
  "status": "closed",
  "customer_id": 1,
  "line_items": [
    {
      "title": "測試商品",
      "price": 100,
      "quantity": 1
    }
  ],
  "total_line_items_price": 100,
  "total_price": 100,
  "send_bonus_point": false,
  "send_coupons": false,
  "update_vip_level": false,
  "sales_channel": "test1",
  "payment_name": "通路方付款",
  "closed_at": "2025-01-15T10:00:00Z",
  "payment_at": "2025-01-15T09:30:00Z",
  "channel_order_name": "CH-2025011500001"
}

預期結果:
- HTTP Status: 200/201
- 所有選填參數都被正確設置
- order.payment_info['payment_name'] = "通路方付款"
- order.closed_at = "2025-01-15T10:00:00Z"
- order.payment_at = "2025-01-15T09:30:00Z"
- order.extra_info['channel_order_name'] = "CH-2025011500001"
```
**狀態：** ⏳ 待執行 | **備註：** 現有測試覆蓋

#### 4.7 測試不同的 sales_channel - Channel A
```json
前置條件:
- 已建立 sales_channel type: "channel_a"
- 已建立對應的 order_sales_channel

請求: POST /v2/orders
Body: {
  "status": "closed",
  "customer_id": 1,
  "line_items": [
    {
      "title": "通道 A 商品",
      "price": 500,
      "quantity": 1
    }
  ],
  "total_line_items_price": 500,
  "total_price": 500,
  "send_bonus_point": false,
  "send_coupons": false,
  "update_vip_level": false,
  "sales_channel": "channel_a"
}

預期結果:
- HTTP Status: 200/201
- order.sales_channel.channel_name = "channel_a"
- order.merchant_from = "other_sales_channel"
- 訂單應正常建立
```
**狀態：** ⏳ 待執行

#### 4.8 測試不同的 sales_channel - Channel B
```json
前置條件:
- 已建立 sales_channel type: "channel_b"
- 已建立對應的 order_sales_channel

請求: POST /v2/orders
Body: {
  "status": "closed",
  "customer_id": 1,
  "line_items": [
    {
      "title": "通道 B 商品",
      "price": 800,
      "quantity": 2
    }
  ],
  "total_line_items_price": 1600,
  "total_price": 1600,
  "send_bonus_point": false,
  "send_coupons": false,
  "update_vip_level": false,
  "sales_channel": "channel_b"
}

預期結果:
- HTTP Status: 200/201
- order.sales_channel.channel_name = "channel_b"
- order.merchant_from = "other_sales_channel"
- 訂單應正常建立
- 兩個不同 channel 的訂單應該有不同的 sales_channel_id
```
**狀態：** ⏳ 待執行

#### 4.9 測試不同的 sales_channel - Channel C
```json
前置條件:
- 已建立 sales_channel type: "channel_c"
- 已建立對應的 order_sales_channel

請求: POST /v2/orders
Body: {
  "status": "closed",
  "customer_id": 1,
  "line_items": [
    {
      "title": "通道 C - 商品 1",
      "price": 1000,
      "quantity": 1
    },
    {
      "title": "通道 C - 商品 2",
      "price": 2000,
      "quantity": 1
    }
  ],
  "total_line_items_price": 3000,
  "total_price": 3000,
  "send_bonus_point": false,
  "send_coupons": false,
  "update_vip_level": false,
  "sales_channel": "channel_c"
}

預期結果:
- HTTP Status: 200/201
- order.sales_channel.channel_name = "channel_c"
- 訂單應有 2 個 line_items
- 訂單應正常建立
```
**狀態：** ⏳ 待執行

---

## 🚫 5. 異常情況測試

### 測試目的
驗證 API 在異常狀況下的錯誤處理

### 測試案例

#### 5.1 無效的 DateTime 格式
```json
請求: POST /v2/orders
Body: {
  "status": "closed",
  "customer_id": 1,
  "line_items": [...],
  "total_line_items_price": 100,
  "total_price": 100,
  "send_bonus_point": false,
  "send_coupons": false,
  "update_vip_level": false,
  "sales_channel": "test1",
  "closed_at": "invalid-date"
}

預期結果:
- HTTP Status: 422
- 錯誤訊息指出 closed_at 格式錯誤
```
**狀態：** ⏳ 待執行

#### 5.2 payment_at 為非日期格式
```json
請求: POST /v2/orders
Body: {
  "status": "closed",
  "customer_id": 1,
  "line_items": [...],
  "total_line_items_price": 100,
  "total_price": 100,
  "send_bonus_point": false,
  "send_coupons": false,
  "update_vip_level": false,
  "sales_channel": "test1",
  "payment_at": "not-a-date"
}

預期結果:
- HTTP Status: 422
- 錯誤訊息指出 payment_at 格式錯誤
```
**狀態：** ⏳ 待執行

#### 5.3 負數價格
```json
請求: POST /v2/orders
Body: {
  "status": "closed",
  "customer_id": 1,
  "line_items": [
    {
      "title": "測試商品",
      "price": -100,  # 負數
      "quantity": 1
    }
  ],
  "total_line_items_price": -100,
  "total_price": -100,
  "send_bonus_point": false,
  "send_coupons": false,
  "update_vip_level": false,
  "sales_channel": "test1"
}

預期結果:
- 系統應接受（如果業務允許）或返回驗證錯誤
- 需確認業務需求
```
**狀態：** ⏳ 待執行

#### 5.4 零價格
```json
請求: POST /v2/orders
Body: {
  "status": "closed",
  "customer_id": 1,
  "line_items": [
    {
      "title": "免費商品",
      "price": 0,
      "quantity": 1
    }
  ],
  "total_line_items_price": 0,
  "total_price": 0,
  "send_bonus_point": false,
  "send_coupons": false,
  "update_vip_level": false,
  "sales_channel": "test1"
}

預期結果:
- 系統應接受零價格訂單（如果業務允許）
- 訂單應被正常建立
```
**狀態：** ⏳ 待執行

#### 5.5 零數量 line_item
```json
請求: POST /v2/orders
Body: {
  "status": "closed",
  "customer_id": 1,
  "line_items": [
    {
      "title": "測試商品",
      "price": 100,
      "quantity": 0  # 零數量
    }
  ],
  "total_line_items_price": 0,
  "total_price": 0,
  "send_bonus_point": false,
  "send_coupons": false,
  "update_vip_level": false,
  "sales_channel": "test1"
}

預期結果:
- 系統應驗證或接受此情況
- 需確認業務需求
```
**狀態：** ⏳ 待執行

#### 5.6 超大數字價格
```json
請求: POST /v2/orders
Body: {
  "status": "closed",
  "customer_id": 1,
  "line_items": [
    {
      "title": "昂貴商品",
      "price": 9999999999,  # 非常大的數字
      "quantity": 1
    }
  ],
  "total_line_items_price": 9999999999,
  "total_price": 9999999999,
  "send_bonus_point": false,
  "send_coupons": false,
  "update_vip_level": false,
  "sales_channel": "test1"
}

預期結果:
- 系統應處理或返回數字溢出錯誤
- 需確認資料庫欄位的最大值限制
```
**狀態：** ⏳ 待執行

#### 5.7 超長字串 title
```json
請求: POST /v2/orders
Body: {
  "status": "closed",
  "customer_id": 1,
  "line_items": [
    {
      "title": "非常長的商品標題" + "x" * 10000,  # 超長字串
      "price": 100,
      "quantity": 1
    }
  ],
  "total_line_items_price": 100,
  "total_price": 100,
  "send_bonus_point": false,
  "send_coupons": false,
  "update_vip_level": false,
  "sales_channel": "test1"
}

預期結果:
- 系統應驗證字串長度或截斷
- 需確認 line_item.title 欄位的長度限制
```
**狀態：** ⏳ 待執行

#### 5.8 重複的 channel_order_name
```json
前置條件:
- 已存在相同 channel_order_name 的訂單

請求: POST /v2/orders
Body: {
  "status": "closed",
  "customer_id": 1,
  "line_items": [...],
  "total_line_items_price": 100,
  "total_price": 100,
  "send_bonus_point": false,
  "send_coupons": false,
  "update_vip_level": false,
  "sales_channel": "test1",
  "channel_order_name": "CH-2025011500001"  # 已存在
}

預期結果:
- 系統應允許重複（如果業務允許）或返回唯一性驗證錯誤
- 需確認業務需求
```
**狀態：** ⏳ 待執行

---

## 🔐 6. 權限與安全測試

### 測試目的
驗證 API 的權限控制和安全機制

### 測試案例

#### 6.1 無有效 token 的請求
```json
請求: POST /v2/orders (不包含 Authorization header)
Body: {...}

預期結果:
- HTTP Status: 401 (Unauthorized)
- 錯誤訊息指出缺少認證
```
**狀態：** ⏳ 待執行

#### 6.2 無效 token
```json
請求: POST /v2/orders
Headers: {
  "Authorization": "Bearer invalid-token-xyz"
}
Body: {...}

預期結果:
- HTTP Status: 401
- 錯誤訊息指出 token 無效
```
**狀態：** ⏳ 待執行

#### 6.3 Token 無 WRITE_ORDERS 權限
```json
請求: POST /v2/orders
Headers: {
  "Authorization": "Bearer token-without-write-orders-scope"
}
Body: {...}

預期結果:
- HTTP Status: 401 (Unauthorized)
- 錯誤訊息指出缺少 WRITE_ORDERS 權限
```
**狀態：** ⏳ 待執行 | **備註：** 現有測試覆蓋

#### 6.4 Plugin 禁用時的請求
```json
前置條件:
- shop 的 order_create_api plugin 已被禁用
- 注意：目前 API 代碼中 plugin 檢查被禁用（if true）

請求: POST /v2/orders
Body: {...}

預期結果:
- 根據業務需求，應返回適當的錯誤或允許通過
- 需確認是否應啟用 plugin 檢查
```
**狀態：** ⏳ 待執行 | **備註：** 現有測試覆蓋（but plugin check is disabled）

---

## 📊 7. 訂單顯示測試

### 測試目的
驗證 API 建立的訂單在後台和前台能正確顯示

### 測試案例

#### 7.1 後台訂單列表顯示 API 訂單
```json
前置條件:
- 已建立多筆 API 訂單
- 後台訂單列表已配置過濾邏輯

測試步驟:
1. 訪問後台訂單列表頁面
2. 確認 API 訂單是否應顯示（根據需求）

預期結果:
- API 訂單應根據過濾邏輯正確顯示或隱藏
- 訂單號、日期、金額應正確顯示
```
**狀態：** ⏳ 待執行

#### 7.2 後台訂單詳情頁完整性
```json
前置條件:
- 已建立一筆 API 訂單（含多行項目和所有選填參數）

測試步驟:
1. 在後台點擊訂單詳情
2. 驗證所有欄位是否完整顯示

預期結果:
- 訂單基本資訊完整（order_number, customer, total_price）
- line_items 完整（title, price, quantity, variant_title, sku, cost）
- 付款資訊正確（payment_name, payment_at）
- 訂單時間正確（closed_at）
- 來源顯示正確（merchant_from=other_sales_channel）
- 關聯的 sales_channel 正確顯示
```
**狀態：** ⏳ 待執行

#### 7.3 後台訂單列表過濾邏輯驗證
```json
前置條件:
- 已建立混合的訂單（CYBERBIZ 訂單和 API 訂單）

測試步驟:
1. 在後台訂單列表中驗證過濾邏輯
2. 確認 sales_channel_id IS NULL 條件的應用

預期結果:
- 若過濾為僅顯示 CYBERBIZ 訂單：API 訂單應不顯示
- 若過濾為顯示所有訂單：API 訂單應顯示
- Elasticsearch 查詢應正確應用過濾條件
- 訂單計數應正確
```
**狀態：** ⏳ 待執行

#### 7.4 前台會員中心訂單顯示
```json
前置條件:
- 已建立一筆 API 訂單（對應會員賬號）
- 會員已登入

測試步驟:
1. 登入會員賬號
2. 進入會員中心訂單列表
3. 查看該訂單

預期結果:
- API 訂單應根據業務需求顯示或隱藏
- 若顯示，訂單資訊應完整
- 訂單狀態應正確（closed）
```
**狀態：** ⏳ 待執行

#### 7.5 前台訂單詳情頁面
```json
前置條件:
- 已建立一筆 API 訂單

測試步驟:
1. 在前台訪問訂單詳情頁面
2. 驗證訂單資訊的正確性和完整性

預期結果:
- 訂單基本資訊顯示正確
- line_items 資訊完整
- 訂單狀態信息準確
- 不應顯示系統內部資訊
```
**狀態：** ⏳ 待執行

---

## 🔄 8. 訂單操作測試

### 測試目的
驗證 API 訂單的業務操作是否正常或被正確禁用

### 不觸發的功能測試

#### 8.1 確認不發送紅利點數
```json
前置條件:
- 已建立一筆 API 訂單
- 會員有紅利點數額度設置

測試步驟:
1. 建立 API 訂單（send_bonus_point: false）
2. 查看會員紅利點數歷史記錄
3. 檢查是否有新的紅利點數記錄

預期結果:
- 訂單建立後，不應產生新的紅利點數記錄
- 會員紅利點數應保持不變
```
**狀態：** ⏳ 待執行 | **備註：** 現有測試覆蓋 (should not trigger Customers::TotalSpentWorker)

#### 8.2 確認不發送優惠券
```json
前置條件:
- 已建立一筆 API 訂單
- 店家有訂單贈送優惠券設置

測試步驟:
1. 建立 API 訂單（send_coupons: false）
2. 查看會員優惠券列表
3. 檢查是否有新的優惠券

預期結果:
- 訂單建立後，不應自動發送優惠券
- 會員優惠券列表應保持不變（除非手動發放）
```
**狀態：** ⏳ 待執行 | **備註：** 現有測試覆蓋 (should not trigger OrderGainedCoupon::GiveCouponWorker)

#### 8.3 確認不更新會員等級
```json
前置條件:
- 已建立一筆 API 訂單
- 啟用了 VIP 會員體系

測試步驟:
1. 記錄會員當前等級
2. 建立 API 訂單（update_vip_level: false）
3. 檢查會員等級是否改變

預期結果:
- 訂單建立後，會員等級應保持不變
- 訂單金額應不計入會員升級計算
```
**狀態：** ⏳ 待執行 | **備註：** 現有測試覆蓋 (should not trigger VipGroups::UpdateCustomerLevelWorker)

#### 8.4 確認不發送 Webhook
```json
前置條件:
- 已設置 Webhook 端點
- 已啟用訂單相關 webhook 事件

測試步驟:
1. 設置 webhook 監聽
2. 建立 API 訂單
3. 檢查是否收到 webhook 事件

預期結果:
- 訂單建立完成後，不應發送任何 webhook 通知
- Webhook 日誌中應無相關記錄
```
**狀態：** ⏳ 待執行 | **備註：** 現有測試覆蓋 (should not trigger WebhookWorker)

#### 8.5 確認不觸發首購禮
```json
前置條件:
- 已建立首購禮規則
- 會員為首次購物

測試步驟:
1. 使用新客戶建立 API 訂單
2. 檢查會員禮物或獎勵

預期結果:
- API 訂單不應觸發首購禮發放
- 會員應無法獲得首購禮
```
**狀態：** ⏳ 待執行 | **備註：** 現有測試覆蓋 (should not trigger FirstOrderGifts::GivingGiftWorker)

#### 8.6 確認不發放序號
```json
前置條件:
- 已建立需要發放序號的商品
- 已設置序號發放規則

測試步驟:
1. 建立包含序號商品的 API 訂單
2. 檢查會員序號記錄

預期結果:
- API 訂單不應自動發放序號
- 會員序號列表應保持不變
```
**狀態：** ⏳ 待執行 | **備註：** 現有測試覆蓋 (should not trigger GiveOrderSerialNumber)

#### 8.7 確認不計算 CYBERBIZ Payments 額度
```json
前置條件:
- 已啟用 CYBERBIZ Payments 功能
- 會員有 CYBERBIZ Payments 額度

測試步驟:
1. 建立 API 訂單
2. 檢查會員的 CYBERBIZ Payments 額度

預期結果:
- API 訂單金額應不計入 CYBERBIZ Payments 額度
- 額度應保持不變
```
**狀態：** ⏳ 待執行 | **備註：** 現有測試覆蓋 (should not trigger trigger_cyberbiz_payments_personal_quota_worker)

### 應該正常的功能測試

#### 8.8 訂單出貨功能
```json
前置條件:
- 已建立一筆 API 訂單
- 訂單狀態為 closed

測試步驟:
1. 在後台進行訂單出貨操作
2. 驗證出貨流程是否正常

預期結果:
- 出貨操作應正常進行
- fulfillment_status 應更新
- 出貨記錄應正確建立
```
**狀態：** ⏳ 待執行

#### 8.9 訂單退款功能
```json
前置條件:
- 已建立一筆已支付的 API 訂單
- 訂單有出貨記錄

測試步驟:
1. 進行退款操作
2. 驗證退款流程

預期結果:
- 退款操作應正常進行
- 訂單狀態應更新
- 退款記錄應正確生成
```
**狀態：** ⏳ 待執行

#### 8.10 訂單備註功能
```json
前置條件:
- 已建立一筆 API 訂單

測試步驟:
1. 在訂單詳情頁添加備註
2. 查看備註是否保存

預期結果:
- 備註應正常保存
- 備註應在訂單詳情中顯示
```
**狀態：** ⏳ 待執行

#### 8.11 訂單標籤功能
```json
前置條件:
- 已建立訂單標籤
- 已建立一筆 API 訂單

測試步驟:
1. 為 API 訂單添加標籤
2. 驗證標籤是否保存

預期結果:
- 標籤應正常添加和刪除
- 訂單標籤應正確顯示
```
**狀態：** ⏳ 待執行

---

## 📦 9. 庫存測試

### 測試目的
驗證 API 訂單對庫存系統的影響

### 測試案例

#### 9.1 確認不調整 EC 庫存
```json
前置條件:
- 已建立普通商品（非 fake product）
- 記錄商品當前庫存

測試步驟:
1. 建立 API 訂單
2. 檢查商品庫存是否改變

預期結果:
- EC 商品庫存應保持不變
- AdjustEcStockOfSale 不應被執行
- 庫存歷史記錄中不應有新的調整記錄
```
**狀態：** ⏳ 待執行 | **備註：** 現有測試覆蓋 (should not call AdjustEcStockOfSale)

#### 9.2 確認 fake_other_sales_channel_product 庫存不受影響
```json
前置條件:
- 已建立 fake_other_sales_channel_product
- 記錄 fake product 的庫存

測試步驟:
1. 建立多筆 API 訂單（綁定 fake product）
2. 檢查 fake product 庫存

預期結果:
- fake product 庫存應保持不變
- 庫存系統不應對 API 訂單進行扣減
```
**狀態：** ⏳ 待執行

---

## 📈 10. 報表測試

### 測試目的
驗證 API 訂單在各類報表中的正確處理

### 測試案例

#### 10.1 訂單統計報表
```json
前置條件:
- 已建立多筆混合訂單（CYBERBIZ + API）
- 訂單統計報表已配置

測試步驟:
1. 生成訂單統計報表
2. 驗證 API 訂單的計數和金額

預期結果:
- 訂單統計應根據業務需求：
  - 選項 A：包含 API 訂單
  - 選項 B：排除 API 訂單
- 報表數字應準確
- 欄位應正確計算
```
**狀態：** ⏳ 待執行 | **備註：** 需確認業務需求

#### 10.2 營收報表
```json
前置條件:
- 已建立多筆 API 訂單，涵蓋不同金額
- 營收報表已配置

測試步驟:
1. 生成營收報表
2. 驗證 API 訂單金額的計算

預期結果:
- 營收報表應根據業務需求：
  - 選項 A：包含 API 訂單金額
  - 選項 B：排除 API 訂單金額
- 營收總計應正確
- 按時間段分類應準確
```
**狀態：** ⏳ 待執行 | **備註：** 需確認業務需求

#### 10.3 商品銷售報表
```json
前置條件:
- 已建立多筆 API 訂單（含不同商品）
- 商品銷售報表已配置

測試步驟:
1. 生成商品銷售報表
2. 驗證 fake_other_sales_channel_product 的銷售統計

預期結果:
- fake_other_sales_channel_product 銷售量應正確計算
- 各商品的銷售金額應準確
- 排行應正確排序
```
**狀態：** ⏳ 待執行

---

## 📊 測試執行計畫

### 第 1 階段：基礎驗證（優先度：高）
執行以下測試案例以驗證 API 基本功能：
- [x] 1.1 完全空請求
- [ ] 4.1 建立單一商品訂單
- [ ] 4.2 建立多個商品訂單
- [ ] 3.2 customer 不存在時處理
- [ ] 3.3 sales_channel 不存在時處理
- [ ] 6.3 無 WRITE_ORDERS 權限

### 第 2 階段：參數驗證（優先度：高）
執行所有參數驗證相關的測試：
- [ ] 1.x 系列：必填參數缺失（共 10 個）
- [ ] 2.x 系列：參數格式錯誤（共 12 個）

### 第 3 階段：業務邏輯與參數測試（優先度：高）
驗證核心業務邏輯和各種參數組合：
- [ ] 3.x 系列：業務邏輯驗證（共 8 個）
- [ ] 4.3-4.9 系列：各種成功情況（共 9 個）
  - [ ] 4.3 自定義 line_item 資訊（variant_title, sku, cost）
  - [ ] 4.4 payment_name 參數
  - [ ] 4.5 closed_at 參數
  - [ ] 4.6 所有選填參數組合（payment_name, closed_at, payment_at, channel_order_name）
  - [ ] 4.7-4.9 多個 sales_channel（channel_a, channel_b, channel_c）

### 第 4 階段：異常與邊界（優先度：中）
測試異常情況和邊界條件：
- [ ] 5.x 系列：異常情況（共 8 個）
- [ ] 各種邊界條件驗證

### 第 5 階段：安全與權限（優先度：中）
驗證安全機制和權限控制：
- [ ] 6.x 系列：權限與安全（共 4 個）
- [ ] token 驗證
- [ ] scope 驗證

### 第 6 階段：訂單顯示測試（優先度：中）
驗證訂單在系統中的正確顯示：
- [ ] 7.1 後台訂單列表顯示
- [ ] 7.2 後台訂單詳情完整性
- [ ] 7.3 後台訂單過濾邏輯（Elasticsearch）
- [ ] 7.4 前台會員中心顯示
- [ ] 7.5 前台訂單詳情

### 第 7 階段：訂單操作測試（優先度：中）
驗證訂單的各項操作功能：
**不應觸發的功能：**
- [ ] 8.1 不發送紅利點數
- [ ] 8.2 不發送優惠券
- [ ] 8.3 不更新會員等級
- [ ] 8.4 不發送 Webhook
- [ ] 8.5 不觸發首購禮
- [ ] 8.6 不發放序號
- [ ] 8.7 不計算 CYBERBIZ Payments 額度

**應該正常的功能：**
- [ ] 8.8 訂單出貨功能
- [ ] 8.9 訂單退款功能
- [ ] 8.10 訂單備註功能
- [ ] 8.11 訂單標籤功能

### 第 8 階段：庫存與報表測試（優先度：低）
驗證庫存系統和報表的正確處理：
**庫存測試：**
- [ ] 9.1 不調整 EC 庫存
- [ ] 9.2 fake product 庫存不受影響

**報表測試：**
- [ ] 10.1 訂單統計報表
- [ ] 10.2 營收報表
- [ ] 10.3 商品銷售報表

---

## 🧪 測試工具與環境

### 建議使用工具
- **Postman** / **Insomnia** / **curl** - API 測試
- **RSpec** - 自動化測試
- **Rails Console** - 資料驗證
- **MySQL Workbench** / **TablePlus** - 資料庫查詢

### 測試環境準備
```bash
# 1. 確保 staging 環境已 deploy 最新代碼
git fetch origin
git checkout hank_new_sales_channel_to_order_table

# 2. 執行資料庫遷移
bundle exec rake db:migrate RAILS_ENV=staging

# 3. 建立測試資料（參考 spec/factories）
rails console --environment=staging
```

### 測試資料準備
```ruby
# 建立測試 shop
shop = Shop.create!(name: 'Test Shop', currency: 'TWD')

# 建立測試 customer
customer = shop.customers.create!(
  email: 'test@example.com',
  mobile: '0912345678',
  name: 'Test Customer'
)

# 建立測試 sales_channel_type
channel_type = KeyValues::Shop::SalesChannelType.create!(
  name: 'test_channel',
  id: 999
)

# 建立測試 order_sales_channel
order_sales_channel = shop.order_sales_channels.create!(
  channel_type_id: channel_type.id,
  channel_name: 'test_channel'
)

# 建立 API access token
application = Doorkeeper::Application.create!(
  name: 'API Test',
  redirect_uri: 'http://localhost:3000/callback'
)

access_token = Doorkeeper::AccessToken.create!(
  resource_owner_id: shop.id,
  application: application,
  expires_in: (Time.current + 2.hours).to_i,
  scopes: [KeyValues::Doorkeeper::Scope::WRITE_ORDERS].join(' ')
)
```

---

## 📋 測試結果記錄範本

```markdown
### 測試用例：[用例編號] [用例名稱]

**執行日期：** YYYY-MM-DD
**執行人：** [姓名]
**結果：** ✅ 通過 / ❌ 失敗

#### 預期結果
[預期結果描述]

#### 實際結果
[實際結果描述]

#### 回應內容
[HTTP Status 碼]
[Response body (JSON)]

#### 備註
[任何額外的觀察或問題]

#### 後續行動（如果失敗）
[需要採取的修正行動]
```

---

## 🔗 相關資源

- API 實現：`app/features/app_store/api/versioned/v2/orders.rb`
- 測試文件：`spec/features/app_store/api/versioned/orders_spec.rb`
- 訂單模型：`app/models/order.rb`
- 檢查清單：`CREATE_ORDER_API_CHECKLIST.md`

---

## ✅ 下一步

1. [ ] 確認測試環境已準備好
2. [ ] 建立測試資料
3. [ ] 執行第 1 階段測試
4. [ ] 記錄測試結果
5. [ ] 根據結果進行修正或調整
6. [ ] 進行後續階段測試

---

**最後更新：** 2026-01-15
**狀態：** 等待執行
