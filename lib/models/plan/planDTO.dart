class PlanDTO {
  String name;
  String videoQuality;
  String resolution;
  String screens;
  double price;

  PlanDTO(
      {this.name,
      this.videoQuality,
      this.resolution,
      this.screens,
      this.price});

  Map toJson() => {
        "planName": name,
        "planVideoQuality": videoQuality,
        "planResolution": resolution,
        "planScreens": screens,
        "planPrice": price,
      };

  factory PlanDTO.fromJson(Map<String, dynamic> json) => PlanDTO(
        name: json["planName"],
        videoQuality: json["planVideoQuality"],
        resolution: json["planResolution"],
        screens: json["planScreens"],
        price: json["planPrice"],
      );
}
