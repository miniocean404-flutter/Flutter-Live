/// code : 200
/// msg : "success"
/// data : {"realUrl":"http://tx.hls.huya.com/src/78941969-2592787562-11135937784265572352-2914030356-10057-A-0-1-imgplus.m3u8?ratio=2000&wsSecret=af87e769a383fb8745f8bd9d55bacb47&wsTime=6173e1ce&fm=RFdxOEJjSjNoNkRKdDZUWV8kMF8kMV8kMl8kMw%3D%3D&ctype=tars_mobile&txyp=o%3Ad2%3B&fs=bgct&t=103"}

class LiveUrl {
  LiveUrl({
    int? code,
    String? msg,
    Data? data,
  }) {
    _code = code;
    _msg = msg;
    _data = data;
  }

  LiveUrl.fromJson(dynamic json) {
    _code = json['code'];
    _msg = json['msg'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  int? _code;
  String? _msg;
  Data? _data;

  int? get code => _code;
  String? get msg => _msg;
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = _code;
    map['msg'] = _msg;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }
}

/// realUrl : "http://tx.hls.huya.com/src/78941969-2592787562-11135937784265572352-2914030356-10057-A-0-1-imgplus.m3u8?ratio=2000&wsSecret=af87e769a383fb8745f8bd9d55bacb47&wsTime=6173e1ce&fm=RFdxOEJjSjNoNkRKdDZUWV8kMF8kMV8kMl8kMw%3D%3D&ctype=tars_mobile&txyp=o%3Ad2%3B&fs=bgct&t=103"

class Data {
  Data({
    String? realUrl,
  }) {
    _realUrl = realUrl;
  }

  Data.fromJson(dynamic json) {
    _realUrl = json['realUrl'];
  }
  String? _realUrl;

  String? get realUrl => _realUrl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['realUrl'] = _realUrl;
    return map;
  }
}
