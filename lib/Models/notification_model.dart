class Notifications {
  String? notificationId;
  String? userId;
  String? title;
  String? description;
  String? type;
  String? subType;
  bool? isRead;
  bool? isNew;
  int? version;
  int? createdAt;
  List<String>? cTAs;
  bool? deleteAllowed;
  NotificationData? notificationData;
  Data? data;
  dynamic updatedAt;
  dynamic deletedAt;

  Notifications({
    this.notificationId,
    this.userId,
    this.title,
    this.description,
    this.type,
    this.subType,
    this.isRead,
    this.isNew,
    this.cTAs,
    this.deleteAllowed,
    this.notificationData,
    this.version,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.data,
  });

  Notifications.fromJson(Map<String, dynamic> json) {
    notificationId = json['notification_id'];
    userId = json['user_id'];
    title = json['title'];
    description = json['description'];
    type = json['type'];
    subType = json['sub_type'];
    isRead = json['is_read'];
    isNew = json['is_new'];
    cTAs = json["CTAs"] == null
        ? []
        : List<String>.from(json["CTAs"]!.map((x) => x));
    deleteAllowed = json['delete_allowed'];
    notificationData =
        json['data'] != null ? NotificationData.fromJson(json['data']) : null;
    version = json['version'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['notification_id'] = notificationId;
    data['user_id'] = userId;
    data['title'] = title;
    data['description'] = description;
    data['type'] = type;
    data['sub_type'] = subType;
    data['is_read'] = isRead;
    data['is_new'] = isNew;
    data['CTAs'] = cTAs;
    data['delete_allowed'] = deleteAllowed;
    if (notificationData != null) {
      data['data'] = notificationData!.toJson();
    }
    data['version'] = version;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class NotificationData {
  String? downloadLink;
  String? paymentId;
  String? subscriptionId;
  String? friendId;
  String? friendName;
  String? friendRequestId;
  String? packageType;
  String? redirectTo;
  String? subscriptionPackageId;
  int? offeredTokens;

  NotificationData({
    this.downloadLink,
    this.paymentId,
    this.subscriptionId,
    this.friendId,
    this.friendName,
    this.friendRequestId,
    this.packageType,
    this.redirectTo,
    this.subscriptionPackageId,
    this.offeredTokens,
  });

  NotificationData.fromJson(Map<String, dynamic> json) {
    downloadLink = json['download_link'];
    paymentId = json['payment_id'];
    subscriptionId = json['subscription_id'];
    friendId = json['friend_id'];
    friendName = json['friend_name'];
    friendRequestId = json['friend_request_id'];
    packageType = json['package_type'];
    redirectTo = json['redirect_to'];
    subscriptionPackageId = json['subscription_package_id'];
    offeredTokens = json['offered_tokens'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['download_link'] = downloadLink;
    data['payment_id'] = paymentId;
    data['subscription_id'] = subscriptionId;
    data['friend_id'] = friendId;
    data['friend_name'] = friendName;
    data['friend_request_id'] = friendRequestId;
    data['package_type'] = packageType;
    data['redirect_to'] = redirectTo;
    data['subscription_package_id'] = subscriptionPackageId;
    data['offered_tokens'] = offeredTokens;
    return data;
  }
}

class Data {
  String? id;
  int? notificationId;
  String? title;
  String? description;
  String? type;
  String? subType;
  bool? deleteAllowed;
  List<String>? cTAs;
  Data2? data;
  List<Targets>? targets;
  String? mode;
  int? schedule;
  String? partnerId;
  // FriendModel? friendModel;

  Data({
    this.id,
    this.notificationId,
    this.title,
    this.description,
    this.type,
    this.subType,
    this.deleteAllowed,
    this.cTAs,
    this.data,
    this.targets,
    this.mode,
    this.schedule,
    this.partnerId,
    // this.friendModel,
  });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    notificationId = json['notification_id'];
    title = json['title'];
    description = json['description'];
    type = json['type'];
    subType = json['sub_type'];
    deleteAllowed = json['delete_allowed'];
    if (json['CTAs'] != null) {
      cTAs = <String>[];
      json['CTAs'].forEach((v) {
        cTAs!.add(v);
      });
    }
    data = json['data'] != null ? Data2.fromJson(json['data']) : null;
    if (json['targets'] != null) {
      targets = <Targets>[];
      json['targets'].forEach((v) {
        targets!.add(Targets.fromJson(v));
      });
    }
    mode = json['mode'];
    schedule = json['schedule'];
    partnerId = json['partner_id'];
    // friendModel = json['friend_data'] != null
    //     ? FriendModel.fromJson(json['friend_data'])
    //     : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['notification_id'] = notificationId;
    data['title'] = title;
    data['description'] = description;
    data['type'] = type;
    data['sub_type'] = subType;
    data['delete_allowed'] = deleteAllowed;
    if (cTAs != null) {
      data['CTAs'] = cTAs!.map((v) => v).toList();
    }
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    if (targets != null) {
      data['targets'] = targets!.map((v) => v.toJson()).toList();
    }
    data['mode'] = mode;
    data['schedule'] = schedule;
    data['partner_id'] = partnerId;
    // if (friendModel != null) {
    //   data['friend_data'] = friendModel!.toJson();
    // }
    return data;
  }
}

class Data2 {
  dynamic webLink;
  String? gameId;
  String? action;

  Data2({
    this.webLink,
    this.gameId,
    this.action,
  });

  Data2.fromJson(Map<String, dynamic> json) {
    webLink = json['web_link'];
    gameId = json['game_id'];
    action = json['action'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['web_link'] = webLink;
    data['game_id'] = gameId;
    data['action'] = action;
    return data;
  }
}

class Targets {
  String? userDevice;
  List<String>? appVersion;

  Targets({
    this.userDevice,
    this.appVersion,
  });

  Targets.fromJson(Map<String, dynamic> json) {
    userDevice = json['user_device'];
    appVersion = json['app_version'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_device'] = userDevice;
    data['app_version'] = appVersion;
    return data;
  }
}
