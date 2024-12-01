import 'package:flutter/material.dart';

// let's create a StatefulWidget class now
class CurrencyConverterMaterialPage extends StatefulWidget {
    const CurrencyConverterMaterialPage({super.key});

    @override
    State<CurrencyConverterMaterialPage> createState() => _CurrencyConverterMaterialPageState();
}

// our class, to work with build()
class _CurrencyConverterMaterialPageState extends State<CurrencyConverterMaterialPage> {
    // adding generic here too
    // we took these out of the build() function, cause build() function needs to be as simple as possible. cause it may cause lacking
    double result = 0; // result is the variable we're gonna work with
    final TextEditingController textEditingController = TextEditingController(); // It creates a controller to manage the text input for a TextField or TextFormField, letting you read, modify, or clear the text.

    // you can also do the previous job like this
    void convert() {
        result = double.parse(textEditingController.text) * 119.60;
        setState(() {});
    }

    // Dispose
    // any form of controller needs to be cancelled or disposed off, so that they don't have any data leaks or memory leaks in your Application
    // super.dispose calls the parent class's cleanup logic when a widget is removed, ensuring proper resource management
    
    // in dispose(), you're removing certain objects from your widget tree and disposed() is called whenever your widget is no longer existing
    // you don't want to instantly delete or dispose off whatever is present in the state class
    // first you wanna dispose your own classes, controllers, streams or futures whatever you wanna dispose
    // and then you'll call super.dispose() that is present in the State class

    // initState() is used (we commented it cause we used it just to show you the comparison between the two of them)
    // @override
    // void initState() {
    //     super.initState();
    // }

    // let's dispose our controller that we made in Line 16 [so it says, this (textEditingController) object is not existing anymore]
    @override
    void dispose() {
        textEditingController.dispose();
        super.dispose();
    }

    // initState() is called before the build() function or before anything builds dispose() is kinda opposite of it 

    @override
    Widget build(BuildContext context) {
        // this is the section of code that was used twice, that's why we should put them in a variable and use that to make the code cleaner
        final enabledAndFocusedBorder = OutlineInputBorder(
            borderSide: const BorderSide(
                color: Colors.black,
                width: 2.0,
                style: BorderStyle.solid,
                strokeAlign: BorderSide.strokeAlignInside,
            ),

            // changing the border radius
            borderRadius: BorderRadius.circular(5),
        );

        return Scaffold(
            // this is the color of the whole screen
            backgroundColor: const Color.fromRGBO(255, 255, 240, 1.0), // Soft ivory body

            // AppBar
            appBar: AppBar(
                backgroundColor: const Color.fromRGBO(0, 128, 128, 1.0), // Muted Teal
                elevation: 0,
                title: const Text('Currency Converter'),
                centerTitle: true, // keping this false, would keep the text
            ),

            // to keep the "0" in the text
            body: Center(
                child: Column(
                    // this is to keep the "$0.0" in the center
                    mainAxisAlignment: MainAxisAlignment.center,
                    
                    children: [
                        // this is first child (currently has "0" as text)
                        Text(
                            // remove the const from here
                            // (result % 1) checks if result is a whole number (no decimal part).
                            '৳ ${result % 1 == 0 ? result.toStringAsFixed(0) : result.toStringAsFixed(2)}', // it is '0' initially, then it prints the converted result
                            style: const TextStyle(
                                fontSize: 45,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                            ),
                        ),

                        // this is 2nd child (inside, there is TextField properties)
                        Padding(
                            // the padding is being applied for the TextField
                            padding: const EdgeInsets.all(10.0),

                            child: TextField(
                                // This connects the TextField to the TextEditingController
                                controller: textEditingController,
                                // this is the text we will type inside the text field
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                ),

                                // decoration of the whole text field
                                decoration: InputDecoration(
                                    // this is the text that will be displayed when there is no text typed
                                    hintText: 'Enter the amount in \$USD',
                                    hintStyle: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                    ),

                                    // this is an icon that will be displayed in the left
                                    prefixIcon: const Icon(Icons.monetization_on_outlined),
                                    prefixIconColor:
                                        const Color.fromRGBO(0, 128, 128, 1.0), // Muted Teal,

                                    // this is the background color of the text field
                                    filled: true,
                                    fillColor: Colors.white,

                                    // this is the border properties of the text field
                                    focusedBorder: enabledAndFocusedBorder,

                                    // this is the resolved issue for automatically increasing the length of the text field after focusing
                                    enabledBorder: enabledAndFocusedBorder,
                                ),

                                // change the keyboard containing digits only
                                keyboardType: const TextInputType.numberWithOptions(
                                    decimal: true, // "numberWithOptions(decimal: true)" ensures consistency across all platforms, especially iOS
                                ),
                            ),
                        ),

                        // this is the 3rd chile (inside, there is convert button properties)
                        Padding(
                            // this padding is for the button to be equaled to TextField
                            padding: const EdgeInsets.all(10.0),

                            // the button
                            child: TextButton(
                                // The onPressed callback is triggered when the button is clicked
                                
                                // now you can pass the convert function like this
                                onPressed: () {
                                    convert();

                                    // you can write it like this too
                                    // "onPressed: convert,"
                                },

                                // styles of the button
                                style: TextButton.styleFrom(
                                    backgroundColor: const Color.fromRGBO(72, 180, 180, 1.0), // Lighter Muted Teal
                                    foregroundColor: Colors.white,
                                    minimumSize: const Size(double.infinity, 55),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                    ),
                                ),

                                // the text and the style of the button
                                child: const Text(
                                    'Convert',
                                    style: TextStyle(
                                        fontSize: 20,
                                    ),
                                ),
                            ),
                        ),
                    ],
                ),
            ),
        );
    }
}

class MyWidget extends StatelessWidget {
    const MyWidget({super.key});

    @override
    Widget build(BuildContext context) {
        return const Placeholder();
    }
}
