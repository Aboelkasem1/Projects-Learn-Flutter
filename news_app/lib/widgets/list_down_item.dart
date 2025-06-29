import 'package:flutter/material.dart';
import 'package:news_app/models/down_item_model.dart';
import 'package:news_app/widgets/category_down_item.dart';

class ListDownItem extends StatelessWidget {
  const ListDownItem({super.key});

  final List<DownItemModel> items = const [
    DownItemModel(
      topTitl: "رمية القسام \"الثلاثية\" قنبلة بقلب المدرعة الإسرائيلية",
      downTitl: "في ملاعب غزة، تختلف قواعد اللعبة، وتعاد كتابة قوانين الاشتباك، خصوصا بعد عملية خان يونس؛ إذ لم تكن المواجهة مجرد اشتباك عسكري، بل كانت \"رمية\" محسوبة بدقة، نفذها مقاوم من كتائب القسام الذراع العسكرية لحركة حماس كما لو أنه في مباراة نهائية لكرة السلة.",
      img: "assets/pl.webp",
    ),
    DownItemModel(
      topTitl: "Chelsea manager Enzo Maresca critcizes weather delays at Club World Cup and questions US hosting the competition",
      downTitl: r"Chelsea manager Enzo Maresca hit out at the Club World Cup organizers and suggested the United States is not a suitable host for the competition after his team’s last-16 win over Benfica was disrupted by a two-hour weather delay",
      img: "assets/che.avif",
    ),
    DownItemModel(
      topTitl: "Lionel Messi to face former team PSG in Club World Cup round of 16 after Inter Miami progresses from group stage",
      downTitl: r"Lionel Messi is set for a reunion with former team Paris Saint-Germain after Inter Miami drew 2-2 with Brazilian club Palmeiras to reach the Club World Cup round of 16. Goals from Tadeo Allende and Luis Suárez appeared to have earned Miami its second win of the group stage, but Paulinho and Maurício struck for Palmeiras inside the final 10 minutes to earn a vital draw that also sent the Verdão into the knockout stages.",
      img: "assets/messi.avif",
    ),
    DownItemModel(
      topTitl: "How Qatar defused Iran’s attack on the largest US-run base in the region",
      downTitl: "Top Qatari officials had been meeting with the country’s prime minister on Monday afternoon to find ways of de-escalating a conflict between Iran and Israel, when defense ministry personnel called to warn of incoming Iranian missiles.",
      img: "assets/qatar.avif",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return CategoryDownItem(items: items[index]);
      },
    );
  }
}
