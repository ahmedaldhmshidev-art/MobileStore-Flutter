import 'package:myapplogin/models/model.dart';

class AuthService {
  // مصفوفة المستخدمين (محاكاة قاعدة بيانات)
  static List<User> users = [User(email: 'ali@gmail.com', password: '123456')];

  // إنشاء حساب جديد
  static String? createAccount(String email, String password) {
    if (!isValidEmail(email)) {
      return 'البريد الإلكتروني غير صالح';
    }
    if (!isValidPassword(password)) {
      return 'كلمة المرور يجب أن تكون 6 أحرف على الأقل';
    }
    if (isEmailExists(email)) {
      return 'البريد الإلكتروني مسجل مسبقاً';
    }

    User newUser = User(email: email, password: password);
    users.add(newUser);
    return null; // نجاح
  }

  // تسجيل الدخول
  static bool login(String email, String password) {
    return users.any((user) =>
    user.email == email && user.password == password);
  }

  // تحقق من صحة الإيميل
  static bool isValidEmail(String email) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }

  // تحقق من قوة كلمة المرور
  static bool isValidPassword(String password) {
    return password.length >= 6;
  }

  // تحقق من وجود الإيميل مسبقاً
  static bool isEmailExists(String email) {
    return users.any((user) => user.email == email);
  }

  // عرض جميع المستخدمين (اختياري)
  static List<User> getAllUsers() {
    return List.from(users);
  }
}
