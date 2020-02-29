
class SHFChannelModel {
  var channelId;
  var name;
  var sort;
  var type;
  var h5Url;

  SHFChannelModel({ this.channelId, this.name, this.sort, this.type, this.h5Url });

  factory SHFChannelModel.fromJson(Map<String, dynamic> parsedJson) {
    return SHFChannelModel(
        channelId: parsedJson['id'],
        name: parsedJson['name'],
        sort: parsedJson['sort'],
        type: parsedJson['type'],
        h5Url: parsedJson['h5Url']);
  }

  static List<SHFChannelModel> channelListFromJson(List<Map<String, dynamic>> parsedJson) {
    var channels = new List<SHFChannelModel>();
    parsedJson?.forEach((v) {
      channels.add(new SHFChannelModel.fromJson(v));
    });
    return channels;
  }
}

