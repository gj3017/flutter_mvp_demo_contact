import '../../contact_data.dart';

/// ListView 的接口类
abstract class ContactListViewContract {
  /// 在联系人信息加载完成之后
  void onLoadContactComplete(List<Contact> items);

  /// 信息加载发生错误
  void onLoadContactError();
}

abstract class ContactPresenterContract {
  /// 加载联系人信息，一般是访问model层封装的数据请求方法
  void loadContacts();
}
