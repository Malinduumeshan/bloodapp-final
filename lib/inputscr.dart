import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InputScreen extends StatelessWidget {
  final systolicController = TextEditingController();
  final diastolicController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bgimg.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Image.asset(
                'assets/inpscr.png',
                height: 250,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  buildInputField('Enter Systolic Value', systolicController,
                      Icons.favorite_border),
                  SizedBox(height: 20),
                  buildInputField('Enter Diastolic Value', diastolicController,
                      Icons.favorite),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () => validateAndNavigate(context),
                    child: Text('Show Info'),
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 16)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildInputField(
      String hintText, TextEditingController controller, IconData iconData) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(15),
        ),
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
        filled: true,
        fillColor: Colors.white.withOpacity(0.2),
        prefixIcon: Icon(iconData, color: Colors.white),
      ),
      style: TextStyle(color: Colors.white),
    );
  }

  void validateAndNavigate(BuildContext context) {
    final systolic = int.tryParse(systolicController.text);
    final diastolic = int.tryParse(diastolicController.text);

    if (systolic != null && diastolic != null) {
      Get.toNamed('/information', arguments: [systolic, diastolic]);
    } else {
      Get.snackbar('Error', 'Please enter valid systolic and diastolic values',
          backgroundColor: Colors.red, colorText: Colors.white);
    }
  }
}
