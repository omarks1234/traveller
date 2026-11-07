import '../../../../core/resources/assets_manager.dart';

class Transportation {
  final String? name;
  final String? imageUrl;

  Transportation({required this.name, required this.imageUrl});

  factory Transportation.fromJson(Map<String, dynamic> json) {
    return Transportation(
      name: json['name'],
      imageUrl: json['imageUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'imageUrl': imageUrl,
    };
  }
}

List<Transportation> transportations = [
  Transportation(name: 'Bus', imageUrl: AssetsManager.bus),
  Transportation(name: 'Train', imageUrl: AssetsManager.train),
  Transportation(name: 'Car', imageUrl: AssetsManager.car),
  Transportation(name: 'Bicycle', imageUrl: AssetsManager.bike),
  Transportation(name: 'Motorcycle', imageUrl: AssetsManager.motorCycle),
  Transportation(name: 'Metro', imageUrl: AssetsManager.metro),
  Transportation(name: 'Walking', imageUrl: AssetsManager.walking),

];