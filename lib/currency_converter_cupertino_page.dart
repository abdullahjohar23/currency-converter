import 'package:flutter/cupertino.dart';

class CurrencyConverterCupertinoPage extends StatefulWidget {
    const CurrencyConverterCupertinoPage({super.key});

    @override
    State<CurrencyConverterCupertinoPage> createState() => _CurrencyConverterCupertinoPageState();
}

class _CurrencyConverterCupertinoPageState extends State<CurrencyConverterCupertinoPage> {
    // all these codes are copied from the build() function of previous file (currency_converter_page.dart)

    // adding generic here too
    // we took these out of the build() function, cause build() function needs to be as simple as possible. cause it may cause lacking
    double result = 0; // result is the variable we're gonna work with
    final TextEditingController textEditingController = TextEditingController(); // It creates a controller to manage the text input for a TextField or TextFormField, letting you read, modify, or clear the text.

    // you can also do the previous job like this
    void convert() {
        result = double.parse(textEditingController.text) * 119.60;
        setState(() {});
    }

    @override
    Widget build(BuildContext context) {
        // this is the section of code that was used twice, that's why we should put them in a variable and use that to make the code cleaner
        
        // this is not being used, so we don't need it
        // final enabledAndFocusedBorder = OutlineInputBorder(
        //     borderSide: const BorderSide(
        //         color: Colors.black,
        //         width: 2.0,
        //         style: BorderStyle.solid,
        //         strokeAlign: BorderSide.strokeAlignInside,
        //     ),

        //     borderRadius: BorderRadius.circular(5), // changing the border radius
        // );

        return CupertinoPageScaffold(
            // this is the color of the whole screen
            backgroundColor: const Color.fromRGBO(255, 255, 240, 1.0), // Soft ivory body

            // AppBar
            navigationBar: const CupertinoNavigationBar(
                backgroundColor: Color.fromRGBO(0, 128, 128, 1.0), // Muted Teal
                // backgroundColor: CupertinoColors.systemGrey3, // in case you want to use colors withour using RGB form
                middle: Text('Currency Converter'),
            ),

            // to keep the "0" in the text
            child: Center(
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
                                color: CupertinoColors.black,
                            ),
                        ),

                        // this is 2nd child (inside, there is TextField properties)
                        Padding(
                            // the padding is being applied for the TextField
                            padding: const EdgeInsets.all(10.0),

                            child: CupertinoTextField(
                                // This connects the TextField to the TextEditingController
                                controller: textEditingController,
                                
                                // this is the text we will type inside the text field                                                                                                  
                                style: const TextStyle(
                                    color: CupertinoColors.black,
                                    fontSize: 20,
                                ),

                                // decoration of the whole text field                                                                                                   
                                decoration: BoxDecoration(
                                    color: CupertinoColors.white,
                                    border: Border.all(),
                                    borderRadius: BorderRadius.circular(5),
                                ),

                                placeholder: 'Please enter the amount in \$USD',

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

                            // let's work with the TextField                                                                                                                   
                            // the button
                            child: CupertinoButton(
                                // The onPressed callback is triggered when the button is clicked
                                
                                // now you can pass the convert function like this
                                onPressed: convert,
                                color: const Color.fromRGBO(72, 180, 180, 1.0),

                                // styles of the button
                                // style: TextButton.styleFrom(
                                //     backgroundColor: const Color.fromRGBO(72, 180, 180, 1.0), // Lighter Muted Teal
                                //     foregroundColor: Colors.white,
                                //     minimumSize: const Size(double.infinity, 55),
                                //     shape: RoundedRectangleBorder(
                                //         borderRadius: BorderRadius.circular(5),
                                //     ),
                                // ),

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