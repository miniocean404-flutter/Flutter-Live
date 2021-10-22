class LiveRoom {
  int? _code;
  String? _msg;
  List<Data>? _data;

  int? get code => _code;
  String? get msg => _msg;
  List<Data>? get data => _data;

  LiveRoom({
    int? code,
    String? msg,
    List<Data>? data,
  }) {
    _code = code;
    _msg = msg;
    _data = data;
  }

  LiveRoom.fromJson(dynamic json) {
    _code = json['code'];
    _msg = json['msg'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = _code;
    map['msg'] = _msg;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// roomId : "545068"
/// com : "bilibili"
/// cateId : "4-86"
/// roomThumb : "https://i0.hdslb.com/bfs/live/new_room_cover/60a3b317ad9ec7e4e07e2e57b87540a174057406.jpg"
/// cateName : "英雄联盟"
/// roomName : "德云色  新版本PBE解读"
/// roomStatus : 1
/// startTime : null
/// ownerName : "老实憨厚的笑笑"
/// avatar : "https://i0.hdslb.com/bfs/face/d92282ac664afffd0ef38c275f3fca17a9567d5a.jpg"
/// online : 6927663
/// realUrl : null

class Data {
  Data({
    String? roomId,
    String? com,
    String? cateId,
    String? roomThumb,
    String? cateName,
    String? roomName,
    int? roomStatus,
    dynamic startTime,
    String? ownerName,
    String? avatar,
    int? online,
    dynamic realUrl,
  }) {
    _roomId = roomId;
    _com = com;
    _cateId = cateId;
    _roomThumb = roomThumb;
    _cateName = cateName;
    _roomName = roomName;
    _roomStatus = roomStatus;
    _startTime = startTime;
    _ownerName = ownerName;
    _avatar = avatar;
    _online = online;
    _realUrl = realUrl;
  }

  Data.fromJson(dynamic json) {
    _roomId = json['roomId'];
    _com = json['com'];
    _cateId = json['cateId'];
    _roomThumb = json['roomThumb'];
    _cateName = json['cateName'];
    _roomName = json['roomName'];
    _roomStatus = json['roomStatus'];
    _startTime = json['startTime'];
    _ownerName = json['ownerName'];
    _avatar = json['avatar'];
    _online = json['online'];
    _realUrl = json['realUrl'];
  }
  String? _roomId;
  String? _com;
  String? _cateId;
  String? _roomThumb;
  String? _cateName;
  String? _roomName;
  int? _roomStatus;
  dynamic _startTime;
  String? _ownerName;
  String? _avatar;
  int? _online;
  dynamic _realUrl;

  String? get roomId => _roomId;
  String? get com => _com;
  String? get cateId => _cateId;
  String? get roomThumb => _roomThumb;
  String? get cateName => _cateName;
  String? get roomName => _roomName;
  int? get roomStatus => _roomStatus;
  dynamic get startTime => _startTime;
  String? get ownerName => _ownerName;
  String? get avatar => _avatar;
  int? get online => _online;
  dynamic get realUrl => _realUrl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['roomId'] = _roomId;
    map['com'] = _com;
    map['cateId'] = _cateId;
    map['roomThumb'] = _roomThumb;
    map['cateName'] = _cateName;
    map['roomName'] = _roomName;
    map['roomStatus'] = _roomStatus;
    map['startTime'] = _startTime;
    map['ownerName'] = _ownerName;
    map['avatar'] = _avatar;
    map['online'] = _online;
    map['realUrl'] = _realUrl;
    return map;
  }
}
