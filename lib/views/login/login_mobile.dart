part of login_view;

class _LoginMobile extends StatelessWidget {
  final LoginViewModel viewModel;

  _LoginMobile(this.viewModel);


  Widget field(BuildContext context, TextEditingController controller) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.text,
      autofocus: false,
      decoration: InputDecoration(
        // contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        // border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
      style: TextStyle(
        color: Theme.of(context).textTheme.body1.color,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: new Stepper(
          type: StepperType.vertical,
          currentStep: viewModel.currentStep,
          onStepTapped: (int step) => viewModel.currentStep = step,
          onStepContinue: viewModel.currentStep < 5 ? () { viewModel.currentStep += 1; } : null,
          onStepCancel: viewModel.currentStep > 0 ? () { viewModel.currentStep -= 1; } : null,
          controlsBuilder: (BuildContext context, {VoidCallback onStepContinue, VoidCallback onStepCancel}) {
            return Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                FlatButton(
                  onPressed: onStepCancel,
                  child: const Text('Назад'),
                ),
                FlatButton(
                  onPressed: onStepContinue,
                  child: const Text('Дальше'),
                ),
              ],
            );
          },

          steps: <Step>[
            new Step(
              title: new Text('Имя'),
              content: field(context, viewModel.fnc),
              isActive: viewModel.currentStep >= 0,
              state: viewModel.currentStep >= 0 ? StepState.complete : StepState.disabled,
            ),
            new Step(
              title: new Text('Фамилия'),
              content: field(context, viewModel.snc),
              isActive: viewModel.currentStep >= 0,
              state: viewModel.currentStep >= 1 ? StepState.complete : StepState.disabled,
            ),
            new Step(
              title: new Text('Группа'),
              content: new Text('This is the second step.'),
              isActive: viewModel.currentStep >= 0,
              state: viewModel.currentStep >= 2 ? StepState.complete : StepState.disabled,
            ),
            new Step(
              title: new Text('Cоглашение о конфиденциальности'),
              content: new Text('This is the third step.'),
              isActive: viewModel.currentStep >= 0,
              state: viewModel.currentStep >= 3 ? StepState.complete : StepState.disabled,
            ),
            new Step(
              title: new Text('Конец'),
              content: new Text('This is the third step.'),
              isActive: viewModel.currentStep >= 0,
              state: viewModel.currentStep >= 4 ? StepState.complete : StepState.disabled,
            ),
          ],
        )
      ),
    );
  }
}
