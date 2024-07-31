// ignore_for_file: public_member_api_docs, sort_constructors_first
class PlayerModel {
  int? playerNumber;
  String? playerName;
  String? playerPosition;
  String? playerImage;

  PlayerModel(
      {this.playerNumber,
      this.playerName,
      this.playerPosition,
      this.playerImage});

  PlayerModel.fromJson(Map<String, dynamic> json) {
    playerNumber = json['playerNumber'];
    playerName = json['playerName'];
    playerPosition = json['playerPosition'];
    playerImage = json['playerImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['playerNumber'] = playerNumber;
    data['playerName'] = playerName;
    data['playerPosition'] = playerPosition;
    data['playerImage'] = playerImage;
    return data;
  }

  @override
  String toString() {
    return 'PlayerModel(playerNumber: $playerNumber, playerName: $playerName, playerPosition: $playerPosition, playerImage: $playerImage)';
  }

  @override
  bool operator ==(covariant PlayerModel other) {
    if (identical(this, other)) return true;

    return other.playerNumber == playerNumber &&
        other.playerName == playerName &&
        other.playerPosition == playerPosition &&
        other.playerImage == playerImage;
  }

  @override
  int get hashCode {
    return playerNumber.hashCode ^
        playerName.hashCode ^
        playerPosition.hashCode ^
        playerImage.hashCode;
  }

  PlayerModel copyWith({
    int? playerNumber,
    String? playerName,
    String? playerPosition,
    String? playerImage,
  }) {
    return PlayerModel(
      playerNumber: playerNumber ?? this.playerNumber,
      playerName: playerName ?? this.playerName,
      playerPosition: playerPosition ?? this.playerPosition,
      playerImage: playerImage ?? this.playerImage,
    );
  }
}

const players = [
  {
    "playerName": "الهادي بن مختار الوالي",
    "playerPosition": "مدرب",
    "playerImage": ""
  },
  {
    "playerNumber": 77,
    "playerName": "فارس حمدان الشمري",
    "playerPosition": "حارس",
    "playerImage": ""
  },
  {
    "playerNumber": 1,
    "playerName": "محمد سليمان الدخيل",
    "playerPosition": "حارس",
    "playerImage": ""
  },
  {
    "playerName": "ناصر سليمان العضيب",
    "playerPosition": "حارس",
    "playerImage": ""
  },
  {
    "playerName": "ثنيان صالح الثنيان",
    "playerPosition": "حارس",
    "playerImage": ""
  },
  {
    "playerName": "زيد عوض المطيري",
    "playerPosition": "حارس",
    "playerImage": ""
  },
  {
    "playerNumber": 4,
    "playerName": "عبدالعزيز نبيل المبلش",
    "playerPosition": "دفاع",
    "playerImage": ""
  },
  {
    "playerNumber": 12,
    "playerName": "عبدالرحمن عبدالعزيز القاسم",
    "playerPosition": "دفاع",
    "playerImage": ""
  },
  {
    "playerNumber": 23,
    "playerName": "داود إبراهيم الطارف",
    "playerPosition": "دفاع",
    "playerImage": ""
  },
  {
    "playerNumber": 13,
    "playerName": "فهد مهاوش الشمري",
    "playerPosition": "دفاع",
    "playerImage": ""
  },
  {
    "playerNumber": 33,
    "playerName": "فرحان سليمان الفرحان",
    "playerPosition": "دفاع",
    "playerImage": ""
  },
  {"playerName": "غالب محمد خرمي", "playerPosition": "دفاع", "playerImage": ""},
  {
    "playerName": "حامد محمد الموسى",
    "playerPosition": "دفاع",
    "playerImage": ""
  },
  {
    "playerName": "حسين عبدالإله محمد الزبيدي",
    "playerPosition": "دفاع",
    "playerImage": ""
  },
  {
    "playerName": "نواف بسام الدريويش",
    "playerPosition": "دفاع",
    "playerImage": ""
  },
  {
    "playerNumber": 7,
    "playerName": "أحمد لويفي الرشيدي",
    "playerPosition": "وسط",
    "playerImage": ""
  },
  {
    "playerNumber": 10,
    "playerName": "أحمد عبدالعزيز الرشودي",
    "playerPosition": "وسط",
    "playerImage": ""
  },
  {
    "playerNumber": 32,
    "playerName": "علاء مصطفى أنس",
    "playerPosition": "وسط",
    "playerImage": ""
  },
  {"playerName": "بابي بابكر", "playerPosition": "وسط", "playerImage": ""},
  {
    "playerName": "بندر مصلح الحربي",
    "playerPosition": "وسط",
    "playerImage": ""
  },
  {"playerName": "بسام الدلي", "playerPosition": "وسط", "playerImage": ""},
  {"playerName": "فرانكو روميرو", "playerPosition": "وسط", "playerImage": ""},
  {
    "playerNumber": 99,
    "playerName": "حسن فهد البلوي",
    "playerPosition": "وسط",
    "playerImage": ""
  },
  {
    "playerNumber": 6,
    "playerName": "صالح علي المحيميد",
    "playerPosition": "وسط",
    "playerImage": ""
  },
  {"playerName": "سليمان الدليلان", "playerPosition": "وسط", "playerImage": ""},
  {
    "playerName": "ثامر معيبد جروان الحربي",
    "playerPosition": "وسط",
    "playerImage": ""
  },
  {
    "playerName": "فينانسيو دي أراوخو سيلفا",
    "playerPosition": "وسط",
    "playerImage": ""
  },
  {"playerName": "يعقوب الحسن", "playerPosition": "وسط", "playerImage": ""},
  {
    "playerNumber": 90,
    "playerName": "زياد الحربي",
    "playerPosition": "وسط",
    "playerImage": ""
  },
  {
    "playerNumber": 9,
    "playerName": "فهد ناصر الداوود",
    "playerPosition": "هجوم",
    "playerImage": ""
  },
  {"playerName": "فيصل المطيري", "playerPosition": "هجوم", "playerImage": ""},
  {
    "playerName": "فايز مشعان الحارثي",
    "playerPosition": "هجوم",
    "playerImage": ""
  },
  {"playerName": "لاسانا ديابي", "playerPosition": "هجوم", "playerImage": ""}
];
