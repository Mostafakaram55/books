
abstract class Failure{
  final String errorM;
  const Failure(this.errorM);
}

// 1-ServerFailure..
class ServerFailure extends Failure{
  ServerFailure(super.errorM);
}