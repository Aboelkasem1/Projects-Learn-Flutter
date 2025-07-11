
# 📘 Flutter Widgets Reference

## 🟦 Container

**الوصف**: عنصر مرن يستخدم لإنشاء مربعات يمكن التحكم في الحجم، اللون، الحواف، الهامش... إلخ.

**الخصائص المهمة**:
- `width`: العرض
- `height`: الارتفاع
- `color`: لون الخلفية
- `margin`: المسافة الخارجية
- `padding`: المسافة الداخلية
- `decoration`: لتزيين الخلفية (تدرج لوني، حواف دائرية...)
- `child`: عنصر واحد داخله

**مثال**:
```dart
Container(
  width: 100,
  height: 100,
  color: Colors.blue,
  child: Center(child: Text('Hello')),
)
```

---

## 🟦 Text

**الوصف**: تُستخدم لعرض نص على الشاشة.

**الخصائص المهمة**:
- `style`: تنسيق النص (اللون، الحجم، السمك..)
- `textAlign`: محاذاة النص
- `overflow`: تحديد ما إذا كان النص يتجاوز المساحة المخصصة

**مثال**:
```dart
Text(
  'مرحبا',
  style: TextStyle(fontSize: 20, color: Colors.black),
  textAlign: TextAlign.center,
)
```

---

## 🟦 Column

**الوصف**: لعرض عناصر بشكل عمودي.

**الخصائص المهمة**:
- `children`: العناصر اللي جوه
- `mainAxisAlignment`: توزيع العناصر على المحور الرأسي
- `crossAxisAlignment`: المحاذاة الأفقية

**مثال**:
```dart
Column(
  mainAxisAlignment: MainAxisAlignment.center,
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Text('العنصر الأول'),
    Text('العنصر الثاني'),
  ],
)
```

---

## 🟦 Row

**الوصف**: لعرض العناصر جنب بعض (أفقيًا).

**الخصائص المهمة**:
- زي `Column`

**مثال**:
```dart
Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    Icon(Icons.home),
    Icon(Icons.settings),
  ],
)
```

---

## 🟦 SizedBox

**الوصف**: لإنشاء مساحة فارغة أو عنصر بحجم محدد.

**الخصائص المهمة**:
- `width`
- `height`
- `child` (اختياري)

**مثال**:
```dart
SizedBox(height: 20)
```

---

## 🟦 Expanded

**الوصف**: يستخدم لملء المساحة المتاحة داخل `Row` أو `Column`.

**مثال**:
```dart
Row(
  children: [
    Expanded(child: Container(color: Colors.red)),
    Expanded(child: Container(color: Colors.green)),
  ],
)
```

---

## 🟦 ListView

**الوصف**: قائمة قابلة للتمرير عموديًا أو أفقيًا.

**الخصائص المهمة**:
- `children`
- `scrollDirection`: الاتجاه (عمودي/أفقي)
- `itemBuilder`: عند استخدام `ListView.builder`

**مثال**:
```dart
ListView(
  children: [
    ListTile(title: Text('عنصر 1')),
    ListTile(title: Text('عنصر 2')),
  ],
)
```
