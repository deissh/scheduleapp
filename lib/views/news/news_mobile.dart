part of news_view;

class _NewsMobile extends StatelessWidget {
  final NewsViewModel viewModel;

  _NewsMobile(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Новости колледжа",
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext contex, int index) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              elevation: 10,
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Text("Уважаемые преподаватели, группа ПР-23 благодарит вас за четкую, дисциплинированную работу. Мы хотим сказать огромное СПАСИБО нашему классному руководителю, Кустовой Екатерине Андреевне, спасибо за то, что вы готовы помочь нам даже поздно вечером, не смотря на свои дела и заботы. Также, выражаем благодарность: Беляковой Ольге Борисовне, Плотникову Антону Николаевичу, Патрикеевой Ольге Николаевне, Гаврюшевой Ирине Васильевне, Жабиной Светлане Александровне, Мостовой Ольге Владимировне, Ткаченко Юлии Геннадьевне, Зайцевой Людмиле Николаевне, Ульяновой Юлии Александровне, Виноградовой Светлане Николаевне, Долговской Елене Геннадьевне, СПАСИБО, без вашей помощи и поддержки нам было бы непросто! #спасибо_за_дистант"),
              ),
            ),
          );
        },
      ),
    );
  }
}
