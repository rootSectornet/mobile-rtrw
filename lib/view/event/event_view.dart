
import 'package:kampungku/model/event/event_model.dart';

abstract class Eventview{
  void refreshData(Event_model eventModel){}
  void onSuccess(String success);
  void onError(String error);
}