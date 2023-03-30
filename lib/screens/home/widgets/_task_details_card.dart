part of '../home.dart';

class _TaskDetailsCard extends StatelessWidget {
  const _TaskDetailsCard({this.task});

  final Task? task;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: UIProps.radiusL,
        color: AppTheme.c.primary,
        gradient: LinearGradient(
          colors: [
            AppTheme.c.primary,
            AppTheme.c.primary.withOpacity(0.2),
            AppTheme.c.text.withOpacity(0.01)
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        border: Border.all(
          width: 0.2,
          color: Colors.white.withOpacity(0.2),
        ),
      ),
      width: MediaQuery.of(context).size.width,
      height: AppDimensions.normalize(35),
      child: Center(
        child: ListTile(
          leading: Container(
            height: AppDimensions.normalize(20),
            width: AppDimensions.normalize(20),
            decoration: UIProps.boxCard!.copyWith(
              color: const Color(0xff384156),
            ),
            child: Center(
              child: Image.asset(StaticAssets.task),
            ),
          ),
          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                task!.subject!,
                style: AppText.b2.copyWith(
                  color: AppTheme.c.text,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                '${task!.time!.hour} : ${task!.time!.minute} ${task!.time!.period}',
                style: AppText.b4.copyWith(
                  color: AppTheme.c.text,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          trailing: Image.asset(StaticAssets.menu),
        ),
      ),
    );
  }
}
