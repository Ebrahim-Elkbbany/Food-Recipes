part of 'details_cubit.dart';

@immutable
abstract class DetailsState {}

class DetailsInitial extends DetailsState {}
class DetailsLoading extends DetailsState {}
class DetailsSuccess extends DetailsState {}
class DetailsFailure extends DetailsState {
  final String errorMessage ;
  DetailsFailure(this.errorMessage);
}


class IsDownInstructions extends DetailsState {}
class IsDownIngredient extends DetailsState {}


