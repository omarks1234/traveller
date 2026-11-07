import '../../../../core/resources/assets_manager.dart';

class Food {
  String? name ;
  String? description ;
  String? imagePath ;
  String? mealType ;

  Food(this.name , this.description , this.imagePath , this.mealType);

  Food.fromJson(Map<String,dynamic>? data){
    name = data?["name"];
    description = data?["description"];
    imagePath = data?["imagePath"];
    mealType = data?["mealType"];
  }



  Map<String , dynamic> foodToMap() {
    return {
      "name":name ,
      "description":description,
      "imagePath":imagePath,
      "mealType":mealType
    };
  }

}

final List<Food> egyptianFoods = [

  Food(
    "Koshari",
    "A popular Egyptian dish made with rice, lentils, macaroni, chickpeas, tomato sauce and fried onions.",
    AssetsManager.kushari,
    "Lunch",
  ),

  Food(
    "Ful Medames",
    "Slow-cooked fava beans seasoned with olive oil, lemon, garlic and cumin.",
    AssetsManager.fulMedams,
    "Breakfast",
  ),

  Food(
    "Taameya",
    "Egyptian falafel made mainly from fava beans, herbs and spices.",
    AssetsManager.taameya,
    "Breakfast",
  ),

  Food(
    "Molokhia",
    "A traditional green dish made from finely chopped jute leaves with garlic and coriander.",
    AssetsManager.molokhia,
    "Lunch",
  ),

  Food(
    "Hawawshi",
    "Baladi bread stuffed with seasoned minced meat, onions and peppers.",
    AssetsManager.hwawshi,
    "Lunch",
  ),

  Food(
    "Mahshi",
    "Vegetables or grape leaves stuffed with seasoned rice and herbs.",
    AssetsManager.mahashi,
    "Lunch",
  ),

  Food(
    "Fattah",
    "A traditional dish made with rice, toasted bread, meat and garlic-vinegar sauce.",
    AssetsManager.fattah,
    "Lunch",
  ),

  Food(
    "Hamam Mahshi",
    "Roasted pigeon stuffed with seasoned rice or freekeh.",
    AssetsManager.hamamMahshi,
    "Lunch",
  ),

  Food(
    "Macarona Bechamel",
    "Baked pasta layered with seasoned minced meat and creamy bechamel sauce.",
    AssetsManager.macaroniBshamel,
    "Lunch",
  ),

  Food(
    "Feteer Meshaltet",
    "Flaky Egyptian layered pastry that can be served sweet or savory.",
    AssetsManager.fteerMeshltet,
    "Breakfast",
  ),

  Food(
    "Kofta",
    "Seasoned minced meat grilled on skewers over charcoal.",
    AssetsManager.kofta,
    "Lunch",
  ),

  Food(
    "Kebab",
    "Pieces of seasoned meat grilled over charcoal.",
    AssetsManager.kabab,
    "Lunch",
  ),

  Food(
    "Kebda Eskandarani",
    "Alexandrian-style fried beef liver with garlic, chili and spices.",
    AssetsManager.kebdaIskandrani,
    "Lunch",
  ),

  Food(
    "Sayadeya",
    "Seasoned fish served with spiced rice and caramelized onions.",
    AssetsManager.sayadeya,
    "Lunch",
  ),

  Food(
    "Bamia",
    "Okra cooked with tomato sauce, garlic and meat.",
    AssetsManager.bamia,
    "Lunch",
  ),

  Food(
    "Roz Meammar",
    "Egyptian baked rice prepared with milk, cream and butter.",
    AssetsManager.rozMemar,
    "Lunch",
  ),

  Food(
    "Qolqas",
    "Taro root cooked in a flavorful broth, often served with garlic and coriander.",
    AssetsManager.qolqas,
    "Lunch",
  ),

  Food(
    "Bessara",
    "A traditional Egyptian dish made from mashed fava beans and fresh herbs.",
    AssetsManager.besara,
    "Dinner",
  ),

  Food(
    "Eggah",
    "A thick Egyptian omelet made with eggs, herbs and vegetables.",
    AssetsManager.eggah,
    "Dinner",
  ),

  Food(
    "Shakshuka",
    "Eggs cooked with tomatoes, peppers, onions and spices.",
    AssetsManager.shakshuka,
    "Breakfast",
  ),

  Food(
    "Foul with Eggs",
    "Fava beans served with eggs and traditional Egyptian seasonings.",
    AssetsManager.foolBelbed,
    "Dinner",
  ),



  Food(
    "Shawarma",
    "Seasoned chicken or meat roasted on a vertical spit and served in bread.",
    AssetsManager.shawrma,
    "Dinner",
  ),

  Food(
    "Grilled Chicken",
    "Chicken marinated with Egyptian spices and grilled over charcoal.",
    AssetsManager.grilledChicken,
    "Lunch",
  ),

  Food(
    "Chicken Fattah",
    "Rice, toasted bread and chicken served with garlic and vinegar sauce.",
    AssetsManager.chickenFattah,
    "Lunch",
  ),



  Food(
    "Molokhia with Rabbit",
    "Traditional Egyptian molokhia served with tender rabbit and rice.",
    AssetsManager.molokhiaWithRabbit,
    "Lunch",
  ),

  Food(
    "Rice with Vermicelli",
    "Egyptian-style rice cooked with toasted vermicelli.",
    AssetsManager.riceWithVermicelli,
    "Side Dish",
  ),

  Food(
    "Baladi Bread",
    "Traditional Egyptian flatbread commonly served with meals.",
    AssetsManager.beladiBread,
    "Side Dish",
  ),

  Food(
    "Egyptian Salad",
    "Fresh tomatoes, cucumbers, onions and herbs with lemon juice.",
    AssetsManager.egyptianSalad,
    "Side Dish",
  ),

  Food(
    "Baba Ghanoug",
    "Roasted eggplant mixed with tahini, garlic and lemon.",
    AssetsManager.babaGanog,
    "Side Dish",
  ),

  Food(
    "Tahini Salad",
    "Creamy tahini mixed with lemon, garlic and seasonings.",
    AssetsManager.tahini,
    "Side Dish",
  ),

  Food(
    "Torshi",
    "Traditional Egyptian pickled vegetables served as a side dish.",
    AssetsManager.torshi,
    "Side Dish",
  ),

  Food(
    "Om Ali",
    "Warm Egyptian dessert made with pastry, milk, nuts and raisins.",
    AssetsManager.omAli,
    "Dessert",
  ),

  Food(
    "Roz Bel Laban",
    "Creamy Egyptian rice pudding usually served chilled with nuts or cinnamon.",
    AssetsManager.rozBlbn,
    "Dessert",
  ),

  Food(
    "Basbousa",
    "Sweet semolina cake soaked in syrup and often topped with nuts.",
    AssetsManager.basbosa,
    "Dessert",
  ),

  Food(
    "Kunafa",
    "Sweet pastry made with thin shredded dough, cheese or cream and syrup.",
    AssetsManager.kunafa,
    "Dessert",
  ),

  Food(
    "Goulash",
    "Layered Egyptian pastry filled with seasoned meat or cheese.",
    AssetsManager.golash,
    "Lunch",
  ),

  Food(
    "Kahk",
    "Traditional Egyptian cookies filled with nuts, dates or agwa and covered with powdered sugar.",
    AssetsManager.kahk,
    "Dessert",
  ),

  Food(
    "Qatayef",
    "Small stuffed pancakes commonly filled with nuts or cream and served as a dessert.",
    AssetsManager.qatayef,
    "Dessert",
  ),

  Food(
    "Baklava",
    "Layered pastry filled with nuts and soaked in sweet syrup.",
    AssetsManager.baklave,
    "Dessert",
  ),

  Food(
    "Sahlab",
    "Warm creamy milk drink topped with cinnamon, coconut and nuts.",
    AssetsManager.sahlab,
    "Drink",
  ),

  Food(
    "Karkadeh",
    "Refreshing hibiscus drink served hot or cold.",
    AssetsManager.karkadeeh,
    "Drink",
  ),

  Food(
    "Sugarcane Juice",
    "Fresh juice extracted from sugarcane and served chilled.",
    AssetsManager.kasb,
    "Drink",
  ),

  Food(
    "Egyptian Tea",
    "Traditional black tea commonly served hot with sugar.",
    AssetsManager.egyptianTea,
    "Drink",
  ),

  Food(
    "Arabic Coffee",
    "Strong Egyptian-style coffee traditionally served in small cups.",
    AssetsManager.coffe,
    "Drink",
  ),
];


















