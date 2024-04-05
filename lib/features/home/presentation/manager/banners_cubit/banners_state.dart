part of 'banners_cubit.dart';

@immutable
abstract class BannersState {}

class BannersInitial extends BannersState {}


class BannersLoading extends BannersState {}
class BannersSuccess extends BannersState {}
class BannersFailure extends BannersState {
  final String errorMessage;
  BannersFailure(this.errorMessage);
}
