import '../../../core/models/index.dart';

class ProfileData {
  static UserModel getMockUser() {
    return UserModel(
      id: '1',
      name: 'د. سارة أحمد',
      email: 'sara.ahmed@example.com',
      phone: '+966501234567',
      specialization: 'أخصائية قلب',
      experience: 5,
      location: 'الرياض، المملكة العربية السعودية',
      bio: 'أخصائية قلب متخصصة في جراحة القلب المفتوح والقسطرة العلاجية. لدي خبرة أكثر من 5 سنوات في علاج أمراض القلب المختلفة.',
      avatar: 'assets/images/mm.png',
      createdAt: DateTime.now().subtract(const Duration(days: 365)),
      updatedAt: DateTime.now(),
    );
  }

  static List<String> getSpecializations() {
    return [
      'أخصائي قلب',
      'أخصائي أعصاب',
      'أخصائي عيون',
      'أخصائي أذن وأنف وحنجرة',
      'أخصائي جلدية',
      'أخصائي نساء وتوليد',
      'أخصائي أطفال',
      'أخصائي نفسي',
      'أخصائي عظام',
      'أخصائي باطنة',
    ];
  }

  static List<String> getCities() {
    return [
      'الرياض',
      'جدة',
      'مكة المكرمة',
      'المدينة المنورة',
      'الدمام',
      'الخبر',
      'الظهران',
      'الطائف',
      'بريدة',
      'تبوك',
      'حائل',
      'أبها',
      'نجران',
      'جازان',
      'الباحة',
    ];
  }

  static bool validateEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }

  static bool validatePhone(String phone) {
    return RegExp(r'^\+966[0-9]{9}$').hasMatch(phone);
  }

  static bool validateName(String name) {
    return name.length >= 2 && name.length <= 50;
  }

  static bool validateBio(String bio) {
    return bio.length >= 10 && bio.length <= 500;
  }
}
