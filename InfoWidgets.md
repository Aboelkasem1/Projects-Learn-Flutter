
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

---

## 🟦 Scaffold

**الوصف**: هو الهيكل الأساسي لأي صفحة في Flutter، ويحتوي على AppBar وBody وDrawer وBottomNavigationBar وغيرها.

**الخصائص المهمة**:
- `appBar`: شريط العنوان
- `body`: محتوى الشاشة
- `floatingActionButton`: زر عائم
- `drawer`: قائمة جانبية

**مثال**:
```dart
Scaffold(
  appBar: AppBar(title: Text('عنوان الصفحة')),
  body: Center(child: Text('أهلاً')),
  floatingActionButton: FloatingActionButton(
    onPressed: () {},
    child: Icon(Icons.add),
  ),
)
```

---

## 🟦 AppBar

**الوصف**: شريط علوي يظهر في بداية الصفحة يحتوي على عنوان وأزرار.

**الخصائص المهمة**:
- `title`: عنوان الصفحة
- `actions`: أزرار على الجانب الأيمن

**مثال**:
```dart
AppBar(
  title: Text('صفحتي'),
  actions: [
    IconButton(
      icon: Icon(Icons.search),
      onPressed: () {},
    )
  ],
)
```

---

## 🟦 TextField

**الوصف**: مربع إدخال نصوص (مثل كتابة الاسم أو الإيميل).

**الخصائص المهمة**:
- `controller`: للتحكم في النص
- `decoration`: لتعديل الشكل مثل وضع placeholder
- `keyboardType`: نوع لوحة المفاتيح (نص، رقم...)
- `onChanged`: حدث عند تغيير النص

**مثال**:
```dart
TextField(
  decoration: InputDecoration(
    labelText: 'الاسم',
    border: OutlineInputBorder(),
  ),
)
```

---

## 🟦 ElevatedButton

**الوصف**: زر قابل للنقر برفع بسيط عن الخلفية.

**الخصائص المهمة**:
- `onPressed`: الحدث عند الضغط
- `child`: المحتوى داخل الزر (نص، أيقونة...)

**مثال**:
```dart
ElevatedButton(
  onPressed: () {
    print('تم الضغط');
  },
  child: Text('اضغط هنا'),
)
```

---

## 🟦 GestureDetector

**الوصف**: يستخدم لكشف حركات اللمس مثل الضغط أو السحب على أي عنصر.

**الخصائص المهمة**:
- `onTap`: عند الضغط
- `onDoubleTap`: عند الضغط مرتين
- `onLongPress`: عند الضغط المطول

**مثال**:
```dart
GestureDetector(
  onTap: () {
    print('تم الضغط');
  },
  child: Container(
    padding: EdgeInsets.all(20),
    color: Colors.amber,
    child: Text('اضغط عليّ'),
  ),
)
```

---

## 🟦 Stack

**الوصف**: لعرض العناصر فوق بعضها (مثل طبقات).

**الخصائص المهمة**:
- `children`: قائمة العناصر
- `alignment`: محاذاة العناصر

**مثال**:
```dart
Stack(
  children: [
    Container(width: 200, height: 200, color: Colors.red),
    Positioned(
      top: 20,
      left: 20,
      child: Container(width: 100, height: 100, color: Colors.green),
    ),
  ],
)
```
