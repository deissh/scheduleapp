part of settings_view;

class _SettingsMobile extends StatelessWidget {
  final SettingsViewModel viewModel;

  _SettingsMobile(this.viewModel);

  Widget _avatarPicker(BuildContext context) {
    return Stack(
      children: <Widget>[
        Hero(
          tag: "avatar",
          child: CircleAvatar(
            minRadius: 80,
            backgroundColor: Theme.of(context).textSelectionColor,
            child: CircleAvatar(
              backgroundImage: new CachedNetworkImageProvider(
                viewModel.user.avatarUrl
              ),
              minRadius: 75,
            ),
          ),
        ),

        Container(
          padding: EdgeInsets.only(
            top: 100,
            left: 90
          ),
          child: MaterialButton(
            onPressed: viewModel.pickAvatar,
            color: Theme.of(context).primaryColor,
            textColor: Colors.white,
            child: Icon(
              Icons.edit,
              size: 24,
            ),
            padding: EdgeInsets.all(16),
            shape: CircleBorder(),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: viewModel.save,
        label: Text('Сохранить'),
        icon: Icon(Icons.save),
      ),

      body: Padding(
        padding: EdgeInsets.all(20),

        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[

                  _avatarPicker(context),

                ],
              ),

              SizedBox(height: 50),

              Form(
                key: viewModel.formKey,
                child: Column(
                  children: <Widget>[

                    TextFormField(
                      initialValue: viewModel.user.displayName,
                      textCapitalization: TextCapitalization.sentences,
                      decoration: InputDecoration(
                        labelText: "Отображаемое имя"
                      ),
                      onSaved: (value) {
                        viewModel.user.displayName = value;
                      },
                      validator: (value) {
                        return value.isEmpty ? 'Необходимо указать свое имя' : null;
                      },
                    ),

                    TextFormField(
                      initialValue: viewModel.user.email,
                      textCapitalization: TextCapitalization.sentences,
                      decoration: InputDecoration(
                        labelText: "Почта"
                      ),
                      onSaved: (value) {
                        viewModel.user.email = value;
                      },
                      validator: (value) {
                        return value.isEmpty ? 'Необходимо указать свою почту' : null;
                      },
                    ),

                    DropdownButtonFormField(
                      value: viewModel.user.group,
                      hint: const Text("Группа"),
                      onChanged: (value) {
                        viewModel.user.group = value;
                      },
                      items: GroupTranslator.entries.map((e) {
                        return new DropdownMenuItem<String>(
                          value: e.key,
                          child: new Text(e.value),
                        );
                      }).toList(),
                      validator: (value) {
                        return value.isEmpty || value == 'none' ? 'Необходимо указать свою группу' : null;
                      },
                    )
                  ],
                ),
              ),

              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
