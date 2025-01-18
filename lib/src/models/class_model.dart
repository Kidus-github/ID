class ClassModel {
  final String? classId;
  final String className;
  final String teacherId;
  final Map<String, String> coTeacherId; // Corrected to Map<String, String>
  final DateTime startDate;
  final DateTime endDate;
  final DateTime startTime;
  final DateTime endTime;
  final RepetionRule repetitionRule;
  final bool oneDayEvent;
  final String location;
  final DateTime createdAt;
  final DateTime updatedAt;

  ClassModel({
    this.classId,
    required this.className,
    required this.teacherId,
    required this.coTeacherId,
    required this.startDate,
    required this.endDate,
    required this.startTime,
    required this.endTime,
    required this.repetitionRule,
    required this.oneDayEvent,
    required this.location,
    required this.createdAt,
    required this.updatedAt,
  });
}

class RepetionRule {
  final String type; // Type of repetition: "weekly", "biweekly", "custom"
  final List<String>?
      days; // Days of the week for repetition (e.g., ["Monday", "Wednesday"])
  final List<DateTime>? customDates; // Specific custom dates for the repetition

  RepetionRule({
    required this.type,
    this.days,
    this.customDates,
  });

  // Factory constructor for weekly repetition
  factory RepetionRule.weekly(List<String> days) {
    return RepetionRule(
      type: 'weekly',
      days: days,
    );
  }

  // Factory constructor for biweekly repetition
  factory RepetionRule.biweekly(List<String> days) {
    return RepetionRule(
      type: 'biweekly',
      days: days,
    );
  }

  // Factory constructor for custom repetition
  factory RepetionRule.custom(List<DateTime> customDates) {
    return RepetionRule(
      type: 'custom',
      customDates: customDates,
    );
  }

  // Example: Method to generate sessions between two dates
  List<DateTime> generateSessions(DateTime startDate, DateTime endDate) {
    List<DateTime> sessions = [];
    if (type == 'weekly' || type == 'biweekly') {
      Map<String, int> dayMap = {
        'Monday': DateTime.monday,
        'Tuesday': DateTime.tuesday,
        'Wednesday': DateTime.wednesday,
        'Thursday': DateTime.thursday,
        'Friday': DateTime.friday,
        'Saturday': DateTime.saturday,
        'Sunday': DateTime.sunday,
      };

      // Calculate intervals for weekly/biweekly repetition
      int interval = type == 'weekly' ? 7 : 14;
      for (DateTime current = startDate;
          current.isBefore(endDate) || current.isAtSameMomentAs(endDate);
          current = current.add(Duration(days: 1))) {
        // if (days != null && days!.contains(current.weekdayToString(dayMap))) {
        //   sessions.add(current);
        // }
      }
    } else if (type == 'custom' && customDates != null) {
      // For custom dates, filter the dates within the given range
      sessions = customDates!
          .where((date) =>
              (date.isAfter(startDate) || date.isAtSameMomentAs(startDate)) &&
              (date.isBefore(endDate) || date.isAtSameMomentAs(endDate)))
          .toList();
    }
    return sessions;
  }
}

// Helper extension to convert weekday integer to string
extension WeekdayConverter on int {
  String weekdayToString(Map<String, int> dayMap) {
    return dayMap.keys.firstWhere((key) => dayMap[key] == this);
  }
}