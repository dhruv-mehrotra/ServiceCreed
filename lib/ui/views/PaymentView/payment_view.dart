import 'package:flutter/material.dart';
import 'package:service_creed/ui/views/base_view.dart';
import 'package:service_creed/ui/widgets/custom_text_field.dart';
import 'package:service_creed/viewmodels/Payment/payment_viewmodel.dart';

class PaymentView extends StatelessWidget {
  PaymentView({Key key}) : super(key: key);

  final _paymentFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BaseView<PaymentViewModel>(
      onModelReady: (model) => model.onModelReady(),
      onModelDestroy: (model) => model.onModelDestroy(),
      builder: (BuildContext context, PaymentViewModel model, Widget child) =>
          Scaffold(
        appBar: AppBar(
          title: Text('Payment'),
          centerTitle: true,
        ),
        body: Builder(builder: (context) {
          return _buildPaymentForm(model, context);
        }),
      ),
    );
  }

  Widget _buildPaymentForm(PaymentViewModel model, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Center(
        child: ListView(
          shrinkWrap: true,
          children: [
            Text(
              'Payment',
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(height: 40),
            _buildPaymentModeField(model),
            SizedBox(height: 10),
            model.chosenValue == 'Debit Card/Credit Card'
                ? _buildCardNoField(model)
                : SizedBox(),
            model.chosenValue == 'Cash on Delivery'
                ? _buildAddressField(model)
                : SizedBox(),
            SizedBox(height: 10),
            model.chosenValue == 'Debit Card/Credit Card'
                ? _buildCVVField(model)
                : SizedBox(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: MaterialButton(
                onPressed: () async {
                  await Future.delayed(Duration(seconds: 2));
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Payment Sucessfull')));
                  Navigator.of(context).pop();
                },
                child: Text(
                  'Pay Now',
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.blue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentModeField(PaymentViewModel model) {
    return DropdownButton<String>(
      items: model.choices
          .map(
            (String value) => DropdownMenuItem(
              child: Text(value),
              value: value,
            ),
          )
          .toList(),
      hint: Text('Select PaymentMode'),
      value: model.chosenValue,
      onChanged: (String val) => model.chosenValue = val,
    );
  }

  _buildCardNoField(PaymentViewModel model) {
    return CustomTextField(
      model.cardNoController,
      'Card No.',
      'Eneter your Card no.',
      Icons.card_membership,
      keyBoardType: TextInputType.number,
    );
  }

  _buildCVVField(PaymentViewModel model) {
    return CustomTextField(
      model.cvvController,
      'CVV',
      'Eneter your CVV no.',
      Icons.password,
      keyBoardType: TextInputType.number,
    );
  }

  _buildAddressField(PaymentViewModel model) {
    return CustomTextField(
      model.addressController,
      'Address',
      'Eneter your address',
      Icons.location_on,
    );
  }
}
