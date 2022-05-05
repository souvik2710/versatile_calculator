## Author
Souvik Versatile
[Link to Profile](https://www.linkedin.com/in/souvik2710/)

## Versatile Calculator

 A simple calculator with some unique attributes that stores history of the previous calculations in a scrollview.
 It can able to handle exception cases


## Installation

1. Add the latest version of package to your pubspec.yaml (and run`dart pub get`):
```yaml
dependencies:
  versatile_calculator: ^0.0.1
```
2. Import the package and use it in your Flutter App.
```dart
import 'package:versatile_calculator/versatile_calculator.dart';
```

## Example


<hr>

<table>
<tr>
<td>

```dart
class DemoCalculatorScreen extends StatelessWidget {
  const DemoCalculatorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan[100],
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.red[800]!,
            side: BorderSide(
              width: 1.0,
              color: Colors.red[800]!,
            ),
            onPrimary: Colors.white,
            elevation: 5,
          ),
          onPressed: (){
            showDialog(
                    barrierColor: Colors.white.withOpacity(0.2),
                    barrierDismissible: true,
                    context: context,
                    builder: (ctx) {
                      return CalculatorSmallAlert();
                    });
          },

          child: Text('Check Calculator'),
        ),
      ),
    );
  }
}
```

</td>
<td>
<img  src="https://user-images.githubusercontent.com/53579386/126896556-911d4778-04cd-49bf-b32a-01a6eb3b0155.jpeg"  alt="">
</td>
</tr>
</table>

## Next Goals

- [ ] Make more ui and buttons more robust.
  Now all the buttons and functionalities are constant.In the future need to make it more customisable. 

- [x] Handle all exceptions
  Handling of exceptions complete

- [ ] Add the calculator only as a side container or as a part of another widget.