import 'package:flutter/material.dart';
import 'package:koran_app/utils/colors.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:koran_app/presentation/widgets/custom_app_bar.dart';
import 'package:intl/intl.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  late Set<int> _expandedMonths; // مجموعة لتخزين الفهارس المفتوحة

  @override
  void initState() {
    super.initState();
    _expandedMonths = {DateTime.now().month - 1}; // فتح الشهر الحالي تلقائيًا
  }

  List<DateTime> _generateMonths() {
    int year = _focusedDay.year;
    return List.generate(12, (index) => DateTime(year, index + 1, 1));
  }

  @override
  Widget build(BuildContext context) {
    List<DateTime> months = _generateMonths();

    return Scaffold(
      appBar: CustomAppBar(title: "التقويم"),
      body: ListView.builder(
        itemCount: months.length,
        itemBuilder: (context, index) {
          DateTime month = months[index];
          bool isExpanded = _expandedMonths.contains(index);

          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Column(
              children: [
                // عنوان الشهر
                ListTile(
                  tileColor: AppColors.primaryColor,
                  title: Text(
                    DateFormat.yMMMM().format(month), // الشهر الميلادي
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  trailing: Icon(
                    isExpanded ? Icons.expand_less : Icons.expand_more,
                    color: Colors.white,
                  ),
                  onTap: () {
                    setState(() {
                      if (isExpanded) {
                        _expandedMonths.remove(index); // إغلاق الشهر
                      } else {
                        _expandedMonths.add(index); // فتح الشهر
                      }
                    });
                  },
                ),

                // التقويم عند فتح الشهر
                if (isExpanded)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TableCalendar(
                      firstDay: DateTime.utc(2000, 1, 1),
                      lastDay: DateTime.utc(2100, 12, 31),
                      focusedDay: month,
                      selectedDayPredicate: (day) =>
                          isSameDay(_selectedDay, day),
                      onDaySelected: (selectedDay, focusedDay) {
                        setState(() {
                          _selectedDay = selectedDay;
                          _focusedDay = focusedDay;
                        });
                      },
                      headerVisible: false,
                      calendarFormat: CalendarFormat.month,
                      startingDayOfWeek: StartingDayOfWeek.saturday,
                      calendarStyle: CalendarStyle(
                        todayDecoration: BoxDecoration(
                          color: AppColors.textColor,
                          shape: BoxShape.circle,
                        ),
                        selectedDecoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          shape: BoxShape.circle,
                        ),
                      ),
                      daysOfWeekStyle: DaysOfWeekStyle(
                        weekdayStyle:
                            const TextStyle(fontWeight: FontWeight.bold),
                        weekendStyle:
                            const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
