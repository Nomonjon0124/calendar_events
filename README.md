# calendar_events 📅

**Qisqacha tavsif:**
Bu Flutter orqali yaratilgan mahalliy (offline) kalendar ilovasi bo‘lib, foydalanuvchiga voqealarni qo‘shish, tahrirlash, o‘chirish va sanaga ko‘ra ko‘rish imkonini beradi. Ma'lumotlar lokal SQLite (sqflite) bazasida saqlanadi.

---

## 🔧 Asosiy xususiyatlar

- Voqealarni qo‘shish, tahrirlash va o‘chirish ✅
- Oylik kalendar orqali voqealarni ko‘rish va tanlangan kun voqealarini ko‘rsatish 📆
- Mahalliy SQLite bazasi (sqflite) orqali saqlash 🗄️
- Clean-architecture tartibi: presentation / domain / data qatlamlari 🔧
- BLoC orqali holat boshqaruvi (flutter_bloc) 🧭

---

## 🏗️ Loyiha tuzilmasi (muhim fayllar)

- `lib/main.dart` — ilovani ishga tushirish, DI va asosiy `BlocProvider`
- `lib/di/injection_container.dart` — GetIt orqali dependency injection
- `lib/features/calendar/` — kalendar funksiyalari:
  - `data/` — datasource, repository, model
  - `domain/` — entity va usecase'lar
  - `presentation/` — UI sahifalar, BLoC, widget'lar
- `lib/core/database/` — `DBHelper`, jadval nomlari (`Tables.events`)

---

## 🛠️ Texnik talablar

- Flutter SDK (mos versiya: Dart SDK ^3.7.2 — `pubspec.yaml` ga qarang)
- Android SDK / iOS tooling (qo‘lbola qurilmada ishga tushirish uchun)

---

## 🚀 Ishga tushirish

1. Loyiha papkasida paketlarni yuklang:

```bash
flutter pub get
```

2. Qurilmani ulang yoki emulatorni ishga tushiring va:

```bash
flutter run
```

3. Testlarni ishga tushirish (agar kerak bo‘lsa):

```bash
flutter test
```

---

## 🗃️ Ma'lumotlar bazasi va jadval

- Foydalaniladigan fayl: `calendar.db` (lokal qurilmada)
- Asosiy jadval: `events`
  - Sarlavha: `title` (TEXT)
  - Tavsif: `description` (TEXT)
  - Joylashuv: `location` (TEXT)
  - Boshlanish: `start_date` (INTEGER, millisSinceEpoch)
  - Tugash: `end_date` (INTEGER, millisSinceEpoch)
  - Ustuvorlik: `priority` (INTEGER)

---

## 🧩 Arxitektura & Qisqacha ishlash mantig‘i

- UI (presentation) BLoC orqali foydalanadi — `CalendarBloc` voqealar(Load/Add/Update/Delete) bilan ishlaydi.
- Biznes lojiqa usecase'larda (`AddEvent`, `GetEventsByDateRange`, `UpdateEvent`, `DeleteEvent`).
- Repository (`CalendarRepositoryImpl`) local datasource (`CalendarLocalDataSourceImpl`) bilan bog‘lanadi.

---

## ✅ Qanday ishlatish

1. Asosiy oynada oy tanlanadi — oylik voqealar yuklanadi.
2. Kun ustiga bosilganda tanlangan kun voqealari ko‘rsatiladi.
3. "Add event" tugmasi orqali yangi voqea qo‘shing (vaqti, joyi, prioritet).
4. Voqeani tahrirlash va o‘chirish imkoniyati mavjud.

---

## 📌 Takliflar va mavjud cheklovlar

- Hozircha sinovlar minimal — `flutter_test` yordamida bir nechta widget test qo‘shishni maslahat beraman. ⚠️
- Sinxronizatsiya yoki server bilan integratsiya yo‘q (faqat offline/local). 💡
- Qo‘shimcha: bildirishnomalar (notifications) va takroriy voqealar funksiyasini qo‘shish mumkin.

---

## Hissa qo‘shish & Kontakt

- PRlar va bug report'lar qabul qilinadi — ilovaga yaxshilanishlar qo‘shish mumkin.

---

**Muallif:** Loyihaga tegishli hujjat yo‘q, o‘zgartirish va savollar bo‘lsa repository egasi bilan bog‘laning.

----

© Loyiha
