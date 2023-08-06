abstract class TheoryPracticData {
  List<NameLinkItem> listOfTheameName = [];
  String titlePage = '';
}

class TheoryModel extends TheoryPracticData {
  @override
  List<NameLinkItem> get listOfTheameName => [
        NameLinkItem(
          name: 'Ноты',
          link: 'https://www.mikeloginov.ru/blog/guitar-notes/',
        ),
        NameLinkItem(
          name: 'Интервалы ',
          link:
              'https://pimaschool.ru/blog/kak-vyuchit-intervaly-na-grife-gitary/',
        ),
        NameLinkItem(
          name: 'Аккорды',
          link: 'https://pimaschool.ru/blog/trezvuchiya-s-chem-ikh-edyat/',
        ),
        NameLinkItem(
          name: 'Септ-ккорды',
          link: 'https://proguitarworld.ru/septakkordy-na-gitare/',
        ),
        NameLinkItem(
          name: 'Трезвучия с добаленными тонами',
          link: 'https://www.mikeloginov.ru/blog/guitar-notes/',
        ),
        NameLinkItem(
          name: 'Ладовая система',
          link: 'https://www.mikeloginov.ru/blog/guitar-notes/',
        ),
        NameLinkItem(
          name: 'Пентатоника',
          link: 'https://www.mikeloginov.ru/blog/guitar-notes/',
        ),
        NameLinkItem(
          name: 'Шестиступенные лады',
          link: 'https://www.mikeloginov.ru/blog/guitar-notes/',
        ),
        NameLinkItem(
          name: 'Хроматика',
          link: 'https://www.mikeloginov.ru/blog/guitar-notes/',
        ),
      ];

  @override
  String get titlePage => 'Теоритическая база';
}

class PracticModel extends TheoryPracticData {
  @override
  List<NameLinkItem> get listOfTheameName => [
        NameLinkItem(
          name: 'Теппинг',
          link:
              'https://guitarprofi.ru/uroki-igry-na-gitare/kak-igrat-tappingom-na-gitare.html',
        ),
        NameLinkItem(
          name: 'Переменный штрих',
          link:
              'https://guitarprofi.ru/uroki-igry-na-gitare/kak-igrat-peremennym-shtrixom-na-gitare.html',
        ),
        NameLinkItem(
          name: 'Переборы',
          link: 'https://www.mikeloginov.ru/blog/guitar-notes/',
        ),
        NameLinkItem(
          name: 'Свип',
          link:
              'https://guitarprofi.ru/uroki-igry-na-gitare/svip-na-gitare.html',
        ),
        NameLinkItem(
          name: 'Бенды',
          link: 'https://www.mikeloginov.ru/blog/guitar-notes/',
        ),
        NameLinkItem(
          name: 'Вибрато',
          link: 'https://www.mikeloginov.ru/blog/guitar-notes/',
        ),
        NameLinkItem(
          name: 'Легато',
          link: 'https://www.mikeloginov.ru/blog/guitar-notes/',
        ),
        NameLinkItem(
          name: 'Табулатуры',
          link: 'https://www.songsterr.com/',
        ),
      ];

  @override
  String get titlePage => 'Упражнения';
}

class NameLinkItem {
  final String name;
  final String link;

  NameLinkItem({
    required this.name,
    required this.link,
  });
}
