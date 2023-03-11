import 'package:eco_one/app/constants.dart';
import 'package:eco_one/app/extensions.dart';
import 'package:eco_one/data/response/responses.dart';
import 'package:eco_one/domain/models.dart';

extension CustomerResponseMapper on CustomerResponse? {
  Customer toDomain() {
    return Customer(
        this?.id.orEmpty() ?? AppConstants.empty,
        this?.name.orEmpty() ?? AppConstants.empty,
        this?.numOfNotifications.orZero() ?? AppConstants.zero);
  }
}

extension ContactsResponseMapper on ContactsResponse? {
  Contacts toDomain() {
    return Contacts(
        this?.phone.orZero() ?? AppConstants.zero,
        this?.email.orEmpty() ?? AppConstants.empty,
        this?.link.orEmpty() ?? AppConstants.empty);
  }
}

extension AuthenticationResponseMapper on AuthenticationResponse? {
  Authentication toDomain() {
    return Authentication(this?.customer.toDomain(), this?.contacts.toDomain());
  }
}
