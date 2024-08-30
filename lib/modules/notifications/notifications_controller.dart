import 'package:get/get.dart';

import '../../apis/notification_api.dart';
import '../../models/notification_response_model.dart';
import '../../utils/app_utils.dart';
import '../../utils/enums/snackbar_status.dart';

class NotificationsController extends GetxController {
  NotificationApi notificationApi = NotificationApi();
  var isLoading = false.obs;
  var notificationList = <NotificationResult>[].obs;

  @override
  void onInit() {
    getNotifications();
    super.onInit();
  }

  void getNotifications() async {
    isLoading.value = true;
    notificationList.clear();
    final response = await notificationApi.getNotifications();
    if (response.code == 200) {
      notificationList.addAll(response.result);
    } else {
      AppUtils.showSnackBar("Failed to get notifications",
          status: MessageStatus.ERROR);
    }
    isLoading.value = false;
  }
}
