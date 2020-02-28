import 'package:flutter_sohu_finance/Model/SHFChannelModel.dart';

import '../Manager/SHFHttpManager.dart';
import '../Manager/SHFHttpDataHelper.dart';
import '../Manager/SHFHttpResultData.dart';
import '../Manager/SHFHttpUrl.dart';
import '../../Model/SHFChannelModel.dart';

class SHFChannelApi {
  static Future<List<SHFChannelModel>> homeChannelRequest() async {
    var channelParams = DataHelper.getBaseMap();
    channelParams["userId"] = "d00ecd73badfb00012bb284";
    channelParams["token"] = "aebf3985c3409b88af7e4a660e16aa";
    channelParams["pid"] = "b7adbfd880dde58ee7dd7bcc3023c482";
    channelParams["mid"] = "A1zES8vbKOXyRv3q7FWAkLUI";
    channelParams["sign"] = "63189c9d1f4d85a7dee9c45bdd1675fc";
    channelParams["my"] = "1,148,2,144,3,9,26,100,13,163,7,14,109,152,19,25,122,113";
    SHFHttpResultData res = await SHFHttpManager.getInstance().get(SHFHttpUrl.HOME_CHANNEL_URL, channelParams);

    List<SHFChannelModel> channels = List<SHFChannelModel>();

    return channels;
  }
}