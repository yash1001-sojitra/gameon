import 'package:bloc/bloc.dart';
import 'package:gameon/Logic/data_provider/data_provider.dart';
import 'package:gameon/Logic/model/ground_model.dart';
import 'package:meta/meta.dart';

part 'ground_state.dart';

class GroundCubit extends Cubit<GroundState> {
  final DataProvider dataProvider;
  GroundCubit({required this.dataProvider}) : super(GroundInitial());

  void fetchGround() {
    dataProvider.fetchGround().then((ground) {
      emit(GroundLoaded(ground: ground));
    });
  }
}
