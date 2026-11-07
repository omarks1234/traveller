import 'package:firebase_auth/firebase_auth.dart';
import 'package:traveller/core/resources/assets_manager.dart';
import 'package:traveller/features/register/data/models/user.dart';
import 'package:traveller/home/widgets/monument_widget.dart';

class Monument {
  String? name ;
  String? image ;
  bool? isChecked  ;
  String ? description ;
  Monument(this.name , this.image ,   this.description, this.isChecked);


  Monument.fromJson(Map<String,dynamic>? data){
     name = data?["name"];
     image = data?["image"];
     isChecked = data?["isChecked"];
     description = data?["description"];
    }

  Map<String , dynamic> monumentToMap() {
    return {
       "name":name ,
       "image":image,
       "isChecked":isChecked,
       "description":description
     };
   }






}


List<Monument> monuments = [
// ==================== GIZA ====================

Monument(
"Pyramids of Giza",
AssetsManager.pyramids,
"One of the Seven Wonders of the Ancient World and one of Egypt's most famous landmarks.",
false,
),

Monument(
"Dahshur Pyramids",
AssetsManager.dahsurPyramid,
"A historic archaeological area famous for the Bent Pyramid and the Red Pyramid.",
false,
),

// ==================== LUXOR ====================

Monument(
"Abu Simbel",
AssetsManager.abuSimple,
"A magnificent ancient temple complex famous for its huge statues of Ramses II.",
false,
),

Monument(
"Al-Mualla Tombs",
AssetsManager.almuallaTombs,
"An ancient cemetery containing important tombs from Egypt's Middle Kingdom.",
false,
),

Monument(
"Carter House",
AssetsManager.carterHouse,
"The house of Howard Carter, the archaeologist who discovered the tomb of Tutankhamun.",
false,
),

Monument(
"El-Assasif",
AssetsManager.ELAssasif,
"An important archaeological necropolis containing ancient Egyptian tombs.",
false,
),

Monument(
"El-Tod Temple",
AssetsManager.eLtodTemple,
"An ancient Egyptian temple dedicated to the god Montu.",
false,
),

Monument(
"Horus Temple",
AssetsManager.horusTemple,
"A well-preserved ancient temple dedicated to the falcon-headed god Horus.",
false,
),

Monument(
"Luxor Temple",
AssetsManager.luxorTemple,
"A spectacular ancient temple located in the heart of Luxor on the east bank of the Nile.",
false,
),

Monument(
"Deir El-Shelwit",
AssetsManager.derElshelwet,
"A small but beautiful ancient Egyptian temple dedicated to the goddess Isis.",
false,
),

Monument(
"Karnak Temple",
AssetsManager.karnak,
"One of the largest ancient religious complexes in the world, filled with temples and massive columns.",
false,
),

Monument(
"Hatshepsut Temple",
AssetsManager.hetshepsut,
"A unique three-level temple built for Queen Hatshepsut beneath the cliffs of Deir El-Bahari.",
false,
),

Monument(
"Medinet Habu",
AssetsManager.madinetHapu,
"A large temple complex built by Ramses III and known for its detailed reliefs.",
false,
),

Monument(
"Mut Temple",
AssetsManager.mutTemple,
"An ancient temple complex dedicated to Mut, the Egyptian mother goddess.",
false,
),

Monument(
"Mummification Temple",
AssetsManager.mumfficationTemple,
"An ancient site connected with the religious and funerary traditions of ancient Egypt.",
false,
),

Monument(
"Unfinished Obelisk",
AssetsManager.unfinishedOblisik,
"A huge unfinished obelisk that reveals how ancient Egyptians carved massive stone monuments.",
false,
),

Monument(
"Valley of the Kings",
AssetsManager.valleyOfkings,
"The famous royal necropolis where many pharaohs of the New Kingdom were buried.",
false,
),

Monument(
"Valley of the Queens",
AssetsManager.valleyOfQueens,
"An ancient burial site where queens and royal family members were buried.",
false,
),

// ==================== ASWAN ====================

Monument(
"Amada Temple",
AssetsManager.amadaTemple,
"One of Nubia's oldest temples, famous for its well-preserved ancient inscriptions.",
false,
),

Monument(
"Elephantine Island",
AssetsManager.elephantineIsland,
"A historic island in the Nile that was an important trading and cultural center in ancient Egypt.",
false,
),

Monument(
"El-Kab Tombs",
AssetsManager.elkabTombs,
"Ancient rock-cut tombs containing inscriptions and scenes from Egyptian history.",
false,
),

Monument(
"Gebel El-Silsila",
AssetsManager.gibalElsilsila,
"An ancient sandstone quarry area with temples, shrines, and inscriptions along the Nile.",
false,
),

Monument(
"Kalabsha Temple",
AssetsManager.klabshaTemple,
"A large Nubian temple dedicated mainly to the solar god Mandulis.",
false,
),

Monument(
"Kom Ombo",
AssetsManager.komOmbo,
"A unique double temple dedicated to the gods Sobek and Horus.",
false,
),

Monument(
"Philae Temple",
AssetsManager.philaeTemple,
"A beautiful temple complex on an island dedicated mainly to the goddess Isis.",
false,
),

Monument(
"Sehel Island",
AssetsManager.sahelIsland,
"A Nile island known for its ancient inscriptions and beautiful natural surroundings.",
false,
),

Monument(
"St. Simeon Monastery",
AssetsManager.sammanMonastery,
"A historic Christian monastery near Aswan with impressive remains and desert surroundings.",
false,
),

Monument(
"Wadi El-Seboua",
AssetsManager.wadiElsebau,
"A Nubian archaeological site containing temples and monuments from ancient Egypt.",
false,
),

// ==================== CAIRO ====================

Monument(
"Al-Mataria Obelisk",
AssetsManager.alMattariahOblisik,
"An ancient obelisk in Heliopolis, one of the remains of the ancient city of Heliopolis.",
false,
),

Monument(
"Al-Gohary",
AssetsManager.alGohary,
"A historic Islamic monument reflecting the architectural heritage of old Cairo.",
false,
),

Monument(
"Bab Zuweila",
AssetsManager.babZewaila,
"A famous medieval gate and one of the best-preserved gates of historic Cairo.",
false,
),

Monument(
"Baron Palace",
AssetsManager.elBaron,
"A distinctive historic palace in Heliopolis known for its unique architecture.",
false,
),

Monument(
"Coptic Museum",
AssetsManager.copticMuseum,
"A museum preserving an important collection of Coptic Christian art and heritage.",
false,
),

Monument(
"Al-Muizz Street",
AssetsManager.elMoazStreet,
"A historic Cairo street filled with medieval Islamic architecture and monuments.",
false,
),

Monument(
"Museum of Islamic Art",
AssetsManager.eslamicArt,
"A major museum displaying a rich collection of Islamic art and historical artifacts.",
false,
),

Monument(
"House of Al-Harrawi",
AssetsManager.house0fAlhawary,
"A historic Ottoman-era house showcasing traditional Islamic architecture in Cairo.",
false,
),

Monument(
"House of Suhaymi",
AssetsManager.houseOfSuhaym,
"A beautifully preserved historic house that shows traditional life and architecture in old Cairo.",
false,
),

Monument(
"Mary's Tree",
AssetsManager.marrysTree,
"A historic religious site in Matariya associated with the Holy Family's journey in Egypt.",
false,
),

Monument(
"Rawda Island",
AssetsManager.RawdaIsland,
"A historic Nile island known for the Nilometer and its beautiful riverside setting.",
false,
),

Monument(
"Royal Chariot Museum",
AssetsManager.royalChariotMuseum,
"A museum displaying royal carriages and artifacts from Egypt's royal era.",
false,
),

Monument(
"Sabil Nafisa Al-Bayda",
AssetsManager.sabelNefesa,
"A historic public water fountain reflecting the architectural heritage of Islamic Cairo.",
false,
),

Monument(
"Salah El-Din Citadel",
AssetsManager.salahEldinCitadel,
"A famous medieval fortress overlooking Cairo and one of the city's most iconic landmarks.",
false,
),

Monument(
"Gayer-Anderson Museum",
AssetsManager.gayerAndersonMuseum,
"A beautifully preserved historic house containing collections of art and traditional objects.",
false,
),

Monument(
"Gamal El-Din El-Zahaby House",
AssetsManager.gamalEldinElzahabyHouse,
"A historic Islamic house showcasing traditional Cairo architecture and decorative details.",
false,
),

Monument(
"Wasila Historical House",
AssetsManager.wasilaHistoricalHouse,
"A historic Ottoman-era house that reflects the lifestyle and architecture of old Cairo.",
false,
),

Monument(
"Wikala of Al-Gohary",
AssetsManager.wikalaOfAlgohary,
"A historic commercial inn that shows how merchants and travelers lived in medieval Cairo.",
false,
),

Monument(
"Mosque of Sultan Hassan",
AssetsManager.mosqueSultanHassan,
"One of Cairo's greatest Islamic monuments, famous for its massive architecture and impressive courtyard.",
false,
),

Monument(
"Prince Mohamed Ali Palace",
AssetsManager.princeMohamedAliPalace,
"A magnificent palace complex combining Ottoman, Islamic, and European architectural influences.",
false,
),
];



List<Map<String , dynamic>> convertMonumentToMap(List<Monument> favMonuments){
  return favMonuments.map((e) => e.monumentToMap() ,).toList();
}