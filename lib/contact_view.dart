import 'package:flutter/material.dart';
import 'contact_data.dart';
import 'contact_contract.dart';
import 'contact_presenter.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contacts"),
      ),
      body: const ContactListView(),
    );
  }
}

class ContactListView extends StatefulWidget {
  const ContactListView({super.key});

  @override
  ContactListViewState createState() => ContactListViewState();
}

class ContactListViewState extends State<ContactListView>
    implements ContactListViewContract {
  late ContactPresenterContract _presenter;
  late List<Contact> _contacts;

  /// 是否在查找联系人数据
  late bool _isSearching;

  ContactListViewState() {
    _presenter = ContactPresenter(this);
  }

  @override
  void initState() {
    super.initState();
    _isSearching = true;
    // 异步加载联系人数据
    _presenter.loadContacts();
  }

  @override
  Widget build(BuildContext context) {
    Widget widget;
    if (_isSearching) {
      widget = const Center(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: CircularProgressIndicator(),
        ),
      );
    } else {
      widget = ListView.builder(
          itemCount: _contacts.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: CircleAvatar(
                child: Center(
                  child: Text(_contacts[index].fullName.substring(0, 1)),
                ),
              ),
              title: Text(_contacts[index].fullName),
              subtitle: Text(_contacts[index].email),
            );
          });
    }
    return widget;
  }

  @override
  void onLoadContactComplete(List<Contact> items) {
    setState(() {
      _contacts = items;
      _isSearching = false;
    });
  }

  @override
  void onLoadContactError() {}
}
