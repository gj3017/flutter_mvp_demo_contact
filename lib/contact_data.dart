import 'dart:async';

/// 联系人的类基本信息
class Contact {
  final String fullName;
  final String email;

  const Contact({required this.fullName, required this.email});

  Contact.fromMap(Map<String, dynamic> map)
      : fullName = "${map['name']['first']} ${map['name']['last']}",
        email = "${map['email']}";
}

/// 联系人的仓库，可以从网络上拉取信息，也可以从本地拉取，看实现的方式了
abstract class ContactRepository {
  Future<List<Contact>> fetch();
}

/// 信息拉取异常类
class FetchException implements Exception {
  final String _message;

  FetchException(this._message);

  @override
  String toString() {
    return "Exception:$_message";
  }
}
