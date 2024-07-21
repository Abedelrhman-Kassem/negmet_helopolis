import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:negmet_helopolis/shared/cubit/states.dart';

class ShopAppCubit extends Cubit<ShopAppStates> {
  ShopAppCubit() : super(AppInitialState());

  static ShopAppCubit get(context) => BlocProvider.of(context);
}
