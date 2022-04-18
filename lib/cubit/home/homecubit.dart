import 'package:flutter_application_1/cubit/home/homestates.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class homecubit extends Cubit<homestates> {
  homecubit() : super(homeinit());
  static homecubit get(context) => BlocProvider.of(context);
  bool darkmode=false;

  

  Object? selected = 'en';
  void changeLang({value}) {
    selected = value;
    emit(changelang());
  }

void changeThem(){
darkmode =!darkmode;
   emit(changetheme());
}
  
}
