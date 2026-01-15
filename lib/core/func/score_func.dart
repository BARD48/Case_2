import '../../features/auth/model/user_model.dart';
import '../../features/home/model/user/request_model.dart';
import '../../features/settings/model/allocation_rules_model.dart';

class PriorityCalculator {
  static double calculateScore(
    CustomerRequest request,
    UserModel user,
    List<AllocationRule> rules,
  ) {
    // 1. Ham puanları hesapla
    int rulesScore = _calculateRulesScore(rules, request);
    // int waitingScore = _calculateWaitingTimeBase(request);
    int riskScore = _calculateUserRiskBase(user);

    // 2. Doğrudan toplam puanı döndür (Ağırlık katsayıları kaldırıldı)
    // Formül: Kural Puanı + Bekleme Puanı + Risk Puanı
    return (rulesScore + riskScore).toDouble();
  }

  /// Eşleşen TÜM aktif kuralların puanlarını toplar
  static int _calculateRulesScore(
    List<AllocationRule> rules,
    CustomerRequest request,
  ) {
    int score = 0;

    for (var rule in rules) {
      if (!rule.isActive) continue;

      // AllocationField artık string olduğu için direkt string karşılaştırması yapıyoruz
      final field = rule.field.toLowerCase();

      // Urgency kuralları kontrolü
      if (field == 'urgency' && rule.value.toLowerCase() == request.urgency) {
        score += rule.weight;
      }

      // Service kuralları kontrolü
      if (field == 'service' &&
          rule.value.toLowerCase() == request.requestType) {
        score += rule.weight;
      }
    }

    return score;
  }

  // static int _calculateWaitingTimeBase(CustomerRequest request) {
  //   final diff = DateTime.now().difference(request.).inMinutes;
  //   if (diff < 5) return 10;
  //   if (diff < 30) return 20;
  //   return 30;
  // }

  static int _calculateUserRiskBase(UserModel user) {
    const crowdedCities = [
      'istanbul',
      'ankara',
      'izmir',
      'bursa',
      'antalya',
      'konya',
      'adana',
      'şanlıurfa',
      'gaziantep',
      'kocaeli',
      'mersin',
      'diyarbakır',
      'hatay',
      'manisa',
      'kayseri',
      'samsun',
      'balıkesir',
      'kahramanmaraş',
      'van',
      'aydın',
      'tekirdağ',
    ];

    const mediumCities = [
      'sakarya',
      'denizli',
      'muğla',
      'eskişehir',
      'mardin',
      'trabzon',
      'malatya',
      'ordu',
      'erzurum',
      'afyonkarahisar',
      'sivas',
      'adıyaman',
      'batman',
      'tokat',
      'zonguldak',
      'elazığ',
      'kütahya',
      'çanakkale',
      'osmaniye',
      'şırnak',
      'çorum',
      'ağrı',
      'giresun',
      'isparta',
      'aksaray',
      'yozgat',
      'muş',
      'edirne',
      'düzce',
      'kastamonu',
      'uşak',
      'niğde',
      'kırklareli',
      'bitlis',
      'rize',
      'amasya',
    ];

    final city = user.city.toLowerCase();
    if (crowdedCities.contains(city)) return 15;
    if (mediumCities.contains(city)) return 10;
    return 5;
  }
}
