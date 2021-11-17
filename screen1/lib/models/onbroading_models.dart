class OnbroadingModel {
  final String imageAsset;
  final String title;
  final String description;

  OnbroadingModel(
      {required this.imageAsset,
      required this.title,
      required this.description});
}

List<OnbroadingModel> onbroading = <OnbroadingModel>[
  OnbroadingModel(
    imageAsset: 'assets/images/logo.png',
    title: 'Välkommen',
    description:
        'Vill du ha mer fokus, lugn, kreativitet och glädje? Då har du kommit rätt! Den här appen ger dig verktygen och övningarna du behöver.',
  ),
  OnbroadingModel(
    imageAsset: 'assets/images/man.jpeg',
    title: 'Johan Bergstad',
    description:
        'Johan är leg. psykolog, föreläsare, författare till Hjärnfokus och en av Sveriges främsta experter på fokusträning. Här har han samlat sina bästa tips och övningar i en och samma app.',
  ),
  OnbroadingModel(
    imageAsset: 'assets/images/intro2@2x.png',
    title: 'Bli piloten i ditt liv',
    description:
        'Här hittar du guidade övningar, många av dem 5 minuter eller kortare för att du lättare ska få in dem i din vardag. Ta en powerpaus, en fokusminut eller kom till ro med övningen Somna.',
  ),
];
