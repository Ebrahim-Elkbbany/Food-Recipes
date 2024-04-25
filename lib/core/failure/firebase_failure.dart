abstract class FirebaseDataFailure{
  final String error ;
  FirebaseDataFailure(this.error);
}

class FirebaseFailure extends FirebaseDataFailure{
  FirebaseFailure(super.error);
}