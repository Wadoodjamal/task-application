part of '../add_task.dart';

class Mobile extends StatefulWidget {
  const Mobile({Key? key}) : super(key: key);

  @override
  State<Mobile> createState() => _MobileState();
}

class _MobileState extends State<Mobile> {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

  DateTime _selectedDate = DateTime.now();
  TimeOfDay? _selectedTime;

  @override
  Widget build(BuildContext context) {
    App.init(context);
    final appProv = Provider.of<AppProvider>(context);

    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          fillOverscroll: true,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: UIProps.topBoth50,
              color: AppTheme.c.primary,
            ),
            padding: EdgeInsets.symmetric(
              horizontal: AppDimensions.normalize(10),
              vertical: AppDimensions.normalize(8),
            ),
            child: FormBuilder(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CalendarTimeline(
                    onDateSelected: (date) {
                      setState(() {
                        _selectedDate = date;
                      });
                    },
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now().add(const Duration(days: 365 * 4)),
                    initialDate: DateTime.now(),
                    leftMargin: 20,
                    monthColor: Colors.white70,
                    dayColor: Colors.teal[200],
                    dayNameColor: const Color(0xFF333A47),
                    activeDayColor: Colors.white,
                    activeBackgroundDayColor: Colors.redAccent[100],
                    dotsColor: const Color(0xFF333A47),
                    selectableDayPredicate: (date) => date.day != 23,
                    locale: 'en',
                  ),
                  Space.yf(40),
                  Text(
                    'Theme',
                    style: AppText.b2.copyWith(
                      color: AppTheme.c.text,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Space.y,
                  const CustomTextField(
                    name: 'subject',
                    hint: 'Subject',
                    isPass: false,
                    noUnderline: false,
                  ),
                  Space.y2,
                  Text(
                    'Time',
                    style: AppText.b2.copyWith(
                      color: AppTheme.c.text,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Space.y1,
                  Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Colors.white, width: 1),
                      ),
                    ),
                    padding:
                        EdgeInsets.only(bottom: AppDimensions.normalize(1.5)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          _selectedTime != null
                              ? '${_selectedTime!.hour} : ${_selectedTime!.minute} ${_selectedTime!.period.name}'
                              : 'Select Time',
                          style: AppText.b3.copyWith(color: Colors.white),
                        ),
                        GestureDetector(
                          onTap: () async {
                            TimeOfDay? pickedTime = await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now(),
                            );
                            if (pickedTime != null) {
                              setState(() {
                                _selectedTime = pickedTime;
                              });
                            }
                          },
                          child: Icon(
                            Icons.date_range,
                            size: AppDimensions.normalize(10),
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Space.y2,
                  Text(
                    'Description',
                    style: AppText.b2.copyWith(
                      color: AppTheme.c.text,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Space.y,
                  const CustomTextField(
                    name: 'description',
                    hint: 'Description',
                  ),
                  Space.ym,
                  Center(
                    child: AppButton(
                      width: AppDimensions.normalize(120),
                      child: Text(
                        'Create',
                        style: AppText.b1.copyWith(color: AppTheme.c.primary),
                      ),
                      onPressed: () {
                        _formKey.currentState!.saveAndValidate();
                        final data = _formKey.currentState!.value;

                        final task = Task(
                          description: data['description'].toString().trim(),
                          subject: data['subject'].toString().trim(),
                          date: _selectedDate,
                          time: _selectedTime,
                          isCompleted: false,
                        );
                        appProv.createTask(task);
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
