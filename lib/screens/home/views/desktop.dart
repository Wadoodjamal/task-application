part of '../home.dart';

class Desktop extends StatelessWidget {
  const Desktop({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    App.init(context);

    return const SizedBox(
      child: Center(
        child: Text('Desktop View'),
      ),
    );
  }
}
