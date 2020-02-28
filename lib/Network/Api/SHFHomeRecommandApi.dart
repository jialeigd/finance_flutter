import '../Manager/SHFHttpManager.dart';
import '../Manager/SHFHttpDataHelper.dart';
import '../Manager/SHFHttpResultData.dart';
import '../Manager/SHFHttpUrl.dart';

class SHFHomeRecommandApi {
  static Future<dynamic> request(String params) async {
    var params = DataHelper.getBaseMap();
    params["param"] = params;
    SHFHttpResultData res = await SHFHttpManager.getInstance().get(SHFHttpUrl.HOME_RECOMMAND_URL, params);

    return res.data;
  }
}