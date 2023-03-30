part of '../home.dart';

class _TaskCard extends StatelessWidget {
  const _TaskCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: UIProps.radiusL,
        color: AppTheme.c.primary,
        border: Border.all(
          width: 0.2,
          color: Colors.white.withOpacity(0.2),
        ),
        image: const DecorationImage(
          image: AssetImage('assets/images/testing.png'),
        ),
      ),
      margin: EdgeInsets.only(
        right: AppDimensions.normalize(5),
        bottom: AppDimensions.normalize(5),
      ),
      width: AppDimensions.normalize(95),
      height: AppDimensions.normalize(70),
      padding: EdgeInsets.all(AppDimensions.normalize(8)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '13 Tasks',
            style: AppText.b4.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          Space.y,
          Text(
            '13 Tasks',
            style: AppText.b2b.copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
