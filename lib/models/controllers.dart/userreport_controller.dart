import 'package:az_cash/database/controllers/users_controllers.dart';
import 'package:az_cash/database/database.dart';
import 'package:az_cash/models/userreport.dart';

class UserReportController {
  final database = AppDatabase();

  Future<List<UserReport>> calcUserReport(DateTime start, DateTime end) async {
    List<Order> orders = await database.getOrderByRange(start, end);
    List<UserReport> userReports = [];

    for (var order in orders) {
      var result = userReports.where((r) => r.userId == order.userId);

      if (result.isEmpty) {
        var orderOfUser = orders.where((o) => o.userId == order.userId);
        User? user = await UsersController().getUser(order.userId);
        String userName = "Unknow User";

        if (user != null) {
          userName = user.userName;
        }

        UserReport newReport = UserReport(
          userId: order.userId,
          userName: userName,
          totalDepo: 0,
          totalWd: 0,
          deopTimes: 0,
          wdTimes: 0,
          credit: 0,
          creditCarryover: 0,
        );

        for (var order in orderOfUser) {
          if (order.type == 'deposit') {
            newReport.totalDepo = newReport.totalDepo + order.amount;
            newReport.deopTimes++;
          } else {
            newReport.totalWd = newReport.totalWd + order.amount;
            newReport.wdTimes++;
          }
        }

        userReports.add(newReport);
      }
    }

    return userReports;
  }
}
