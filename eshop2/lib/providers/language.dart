import 'package:flutter/material.dart';
import '../main.dart';

class Language extends ChangeNotifier {
  String _lang = language;

  getLanguage() {
    return _lang;
  }

  setLanguage(String lang) {
    _lang = lang;
    notifyListeners();
  }

  String tLanguage() {
    if (getLanguage() == 'العربية') {
      return 'اللغه';
    } else {
      return "Language";
    }
  }

  String tLogOut() {
    if (getLanguage() == 'العربية') {
      return 'تسجيل خروج';
    } else if (getLanguage() == 'English') {
      return "LogOut";
    }
  }

  String tDrkkMode() {
    if (getLanguage() == 'العربية') {
      return 'الوضع المظلم';
    } else if (getLanguage() == 'English') {
      return "DarkMode";
    }
  }

  String tAbout() {
    if (getLanguage() == 'العربية') {
      return 'حول';
    } else if (getLanguage() == 'English') {
      return "About";
    }
  }

  String tCategory() {
    if (getLanguage() == 'العربية') {
      return 'الاقسام :';
    } else if (getLanguage() == 'English') {
      return "Category :";
    }
  }

  String tDescription() {
    if (getLanguage() == 'العربية') {
      return 'الوصف :';
    } else if (getLanguage() == 'English') {
      return "Description :";
    }
  }

  String tWelcomeBack() {
    if (getLanguage() == 'العربية') {
      return 'مرحباً بعودتك';
    } else if (getLanguage() == 'English') {
      return "Welcome Back";
    }
  }

  String tnotAcount() {
    if (getLanguage() == 'العربية') {
      return 'هل ليس لديك حساب ';
    } else if (getLanguage() == 'English') {
      return "Do not have am account";
    }
  }

  String tCrateAcount() {
    if (getLanguage() == 'العربية') {
      return '    انشاء حساب';
    } else if (getLanguage() == 'English') {
      return "Sign Up";
    }
  }

  String tAccount() {
    if (getLanguage() == 'العربية') {
      return 'انشاء حساب ';
    } else if (getLanguage() == 'English') {
      return "Create Account";
    }
  }

  String tSetting() {
    if (getLanguage() == 'العربية') {
      return 'الاعدادات';
    } else if (getLanguage() == 'English') {
      return "Setting";
    }
  }

  String tLogIn() {
    if (getLanguage() == 'العربية') {
      return 'تسجيل دخول';
    } else if (getLanguage() == 'English') {
      return "Login";
    }
  }

  String tEmail() {
    if (getLanguage() == 'العربية') {
      return 'البريد الاكتروني';
    } else if (getLanguage() == 'Email') {
      return "Login";
    }
  }

  String tPAssword() {
    if (getLanguage() == 'العربية') {
      return 'كلمة المرور';
    } else if (getLanguage() == 'Password') {
      return "Login";
    }
  }

  String tUpload() {
    if (getLanguage() == 'العربية') {
      return 'رفع صورة';
    } else if (getLanguage() == 'English') {
      return "Upload Profile";
    }
  }

  String tSooq() {
    if (getLanguage() == 'العربية') {
      return 'سوق الالكتروني ';
    } else if (getLanguage() == 'English') {
      return " So0oq E-SHOP";
    }
  }
}
