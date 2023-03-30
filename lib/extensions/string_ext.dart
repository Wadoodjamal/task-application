import 'package:task_application/models/core/routing_data.dart';

extension StringExt on String {
  RoutingData get getRoutingData {
    final uriData = Uri.parse(this);

    return RoutingData(
      route: uriData.path,
      queryParams: uriData.queryParameters,
    );
  }
}
