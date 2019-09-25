
import 'dart:convert' show json;

class ShareLifeBean {

  int uid;
  String content;
  int type;
  int bgcolor;
  String time;
  int userid;
  String address;
  String location;
  List<String> img;
  Object video;
  String pic;
  String nickname;
  int zang;
  bool zangstatus;
  bool focus;
  int comment;

  ShareLifeBean({
    this.uid,
    this.content,
    this.type,
    this.bgcolor,
    this.time,
    this.userid,
    this.address,
    this.location,
    this.img,
    this.video,
    this.pic,
    this.nickname,
    this.zang,
    this.zangstatus,
    this.focus,
    this.comment,
  });

  factory ShareLifeBean.fromJson(jsonRes){ if(jsonRes == null) return null;


  List<String> img = jsonRes['img'] is List ? []: null;
  if(img!=null) {
    for (var item in jsonRes['img']) { if (item != null) { img.add(item);  }
    }
  }
  return ShareLifeBean(
    uid : jsonRes['uid'],
    content : jsonRes['content'],
    type : jsonRes['type'],
    bgcolor : jsonRes['bgcolor'],
    time : jsonRes['time'],
    userid : jsonRes['userid'],
    address : jsonRes['address'],
    location : jsonRes['location'],
    img:img,
    video : jsonRes['video'],
    pic : jsonRes['pic'],
    nickname : jsonRes['nickname'],
    zang : jsonRes['zang'],
    zangstatus : jsonRes['zangstatus'],
    focus : jsonRes['focus'],
    comment : jsonRes['comment'],);}

  Map<String, dynamic> toJson() => {
    'uid': uid,
    'content': content,
    'type': type,
    'bgcolor': bgcolor,
    'time': time,
    'userid': userid,
    'address': address,
    'location': location,
    'img': img,
    'video': video,
    'pic': pic,
    'nickname': nickname,
    'zang': zang,
    'zangstatus': zangstatus,
    'focus': focus,
    'comment': comment,
  };
  @override
  String  toString() {
    return json.encode(this);
  }
}