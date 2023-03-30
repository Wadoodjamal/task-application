part of '../home.dart';

class Mobile extends StatefulWidget {
  const Mobile({Key? key}) : super(key: key);

  @override
  State<Mobile> createState() => _MobileState();
}

class _MobileState extends State<Mobile> {
  int tab = 0;

  @override
  Widget build(BuildContext context) {
    App.init(context);
    final appProv = Provider.of<AppProvider>(context);
    final List<Task> tasks = tab == 0
        ? appProv.tasks!
            .where((element) => element.isCompleted == false)
            .toList()
        : appProv.tasks!
            .where((element) => element.isCompleted == true)
            .toList();

    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          fillOverscroll: true,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppDimensions.normalize(10),
                  vertical: AppDimensions.normalize(6),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Hi Sahibzada',
                      style: AppText.h3b.copyWith(color: Colors.white),
                    ),
                    Space.y2,
                    Text(
                      'Good Morning',
                      style: AppText.b3.copyWith(
                        color: AppTheme.c.text,
                      ),
                    ),
                  ],
                ),
              ),
              Space.yf(30),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.only(
                  left: AppDimensions.normalize(10),
                  bottom: AppDimensions.normalize(15),
                ),
                child: Row(
                  children: [
                    ...List.generate(4, (index) {
                      return const _TaskCard();
                    })
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: AppDimensions.normalize(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      decoration: UIProps.boxCard,
                      width: double.infinity,
                      height: AppDimensions.normalize(30),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                              onTap: () {
                                setState(() {
                                  tab = 0;
                                });
                              },
                              child: _taskOption(
                                  isSelected: tab == 0 ? true : false,
                                  text: 'Task List')),
                          GestureDetector(
                              onTap: () {
                                setState(() {
                                  tab = 1;
                                });
                              },
                              child: _taskOption(
                                  isSelected: tab == 1 ? true : false,
                                  text: 'Completed')),
                        ],
                      ),
                    ),
                    Space.yf(35),
                    if (tasks.isNotEmpty)
                      ...tasks.map(
                        (e) => GestureDetector(
                          onLongPress: () {
                            appProv.deleteTask(e);
                          },
                          onDoubleTap: () {
                            appProv.updateTask(
                                e.copyWith(isCompleted: !e.isCompleted!));
                          },
                          child: _TaskDetailsCard(
                            task: e,
                          ),
                        ),
                      )
                    else
                      Center(
                        child: Text(
                          'No Tasks Found',
                          style: AppText.h2b.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _taskOption({bool? isSelected, String? text}) {
    return Container(
      height: AppDimensions.normalize(22),
      width: AppDimensions.normalize(60),
      decoration: isSelected!
          ? UIProps.boxCard!.copyWith(
              color: AppTheme.c.primary,
            )
          : null,
      child: Center(
        child: Text(
          text!,
          style: AppText.b2b.copyWith(
            color:
                isSelected ? Colors.white : AppTheme.c.primary.withOpacity(0.8),
          ),
        ),
      ),
    );
  }
}
