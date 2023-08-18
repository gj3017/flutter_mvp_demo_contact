import 'contact_data.dart';
import 'injection.dart';
import 'contact_contract.dart';

class ContactPresenter implements ContactPresenterContract {
  final ContactListViewContract _view;
  final ContactRepository _repository;

  ContactPresenter(this._view) : _repository = Injector().contactRepository!;

  @override
  void loadContacts() {
    _repository
        .fetch()
        .then((items) => _view.onLoadContactComplete(items))
        .catchError((onError) {
      //print(onError);
      _view.onLoadContactError();
    });
  }
}
