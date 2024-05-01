part of 'account_cubit.dart';

@immutable
abstract class AccountState {}

class AccountInitial extends AccountState {}
class AccountInitialControllers extends AccountState {}
class EditAccountLoading extends AccountState {}
class EditAccountSuccess extends AccountState {
  final String  successMessage;
  EditAccountSuccess(this.successMessage);

}
class EditAccountFailure extends AccountState {
  final String  errorMessage;

  EditAccountFailure(this.errorMessage);
}


class GetAccountDataLoading extends AccountState {}
class GetAccountDataSuccess extends AccountState {
  final UserModel  userModel;

  GetAccountDataSuccess(this.userModel);

}
class GetAccountDataFailure extends AccountState {
  final String  errorMessage;

  GetAccountDataFailure(this.errorMessage);
}


class ChangePasswordVisibility extends AccountState {}


class UploadNewUserImageLoadingState extends AccountState{}
class UploadNewUserImageSuccessfullyState extends AccountState{
  final String newUserImageUrl;
  UploadNewUserImageSuccessfullyState(this.newUserImageUrl);
}
class UploadNewUserImageErrorState extends AccountState{
  final String error;
  UploadNewUserImageErrorState(this.error);
}

class UpdateUserImageLoadingState extends AccountState{}
class UpdateUserImageSuccessfullyState extends AccountState{}
class UpdateUserImageErrorState extends AccountState{
  final String error;
  UpdateUserImageErrorState(this.error);
}

class SelectNewImageSuccessfullyState extends AccountState{}
class NoNewImageSelectedState extends AccountState{}
