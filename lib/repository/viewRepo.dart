import '../webService/localDatabase.dart';
import '../webService/viewService.dart';

class ViewRepo{
  String? token;
  final ViewService? _viewService;

  ViewRepo(this._viewService);
 addView(int view, int itemId) async{
   token=  await SharedPreferenceDataBase.getToken();

   await  _viewService!.addView(view,itemId,token);

}
}