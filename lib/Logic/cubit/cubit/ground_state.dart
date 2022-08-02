part of 'ground_cubit.dart';

@immutable
abstract class GroundState {}

class GroundInitial extends GroundState {}

class GroundLoaded extends GroundState {
    final Ground ground;

  GroundLoaded({required this.ground}); 
}
