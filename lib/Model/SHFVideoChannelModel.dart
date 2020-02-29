
class SHFVideoChannelModel {
  var channelId;
  var name;
  var sort;
  var type;
  var h5Url;

  SHFVideoChannelModel({ this.channelId, this.name, this.sort, this.type, this.h5Url });

  factory SHFVideoChannelModel.fromJson(Map<String, dynamic> parsedJson) {
    return SHFVideoChannelModel(
        channelId: parsedJson['id'],
        name: parsedJson['name'],
        sort: parsedJson['sort'],
        type: parsedJson['type'],
        h5Url: parsedJson['h5Url']);
  }

  static List<SHFVideoChannelModel> channelListFromJson(List<Map<String, dynamic>> parsedJson) {
    var channels = new List<SHFVideoChannelModel>();
    parsedJson?.forEach((v) {
      channels.add(new SHFVideoChannelModel.fromJson(v));
    });
    return channels;
  }
}

