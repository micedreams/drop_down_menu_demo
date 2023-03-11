# Dropdown in flutter

https://user-images.githubusercontent.com/8918999/224479811-b0e2292b-e54b-4213-8307-526cb35212ea.mov

## Overview
### what is a drop-down menu?
* It is a list. A graphical control element that lets a user pick one value from a list.
* It has two states, active and inactive.
* When a drop-down is inactive, it displays a single value.
* When it is activated, it displays a list of values, from which a single value can be selected.
* They are generally used to save space. 
* Offering drop-down menus can help users avoid scrolling and can quickly get them to access the correct option.
* Since they look very much like text fields and it is a way to make the form look more cohesive when there is a need in the form to have a question that needs specific input.


## Scope
### Drop-down in flutter
* Drop-down comes out of the box in Flutter. 
* It is called the [DropdownButton](https://api.flutter.dev/flutter/material/DropdownButton-class.html) widget.
* DropdownButton accepts two required parameters, items and onChanged.
* The items are the list of objects of type [DropdownMenuItem](https://api.flutter.dev/flutter/material/DropdownMenuItem-class.html) that the user sees in the drop-down menu. Ï
* The onChanged is the function that is called to update the state of the variable that holds onto the value of this DropdownButton.
* DropdownButton also accepts many other optional parameters that help in changing up the User Interface of the drop-down menu.

``` dart 
DropdownButton<T>(
  items: list.map((value) {
    return DropdownMenuItem<T>(
      value: value,
      child: Text(value),
    );
  }).toList(),
  onChanged: (_) {},
)
```

### How to implement drop-down list in flutter?
1. Create a list that has to be shown in the form of a menu.

```dart
class _MyHomePageState extends State<MyHomePage> {
  final list = ['','A', 'B', 'C', 'D'];
  .....
}
```

2. Create a variable that can hold onto the selected value.
3. Set the variable with an initial value. This must belong to the above list.
```dart
class _MyHomePageState extends State<MyHomePage> {
  final list = ['','A', 'B', 'C', 'D'];
  String item = '';
  
  .....
}
```

4. In the build method create a new list variable called the itemList.
5. Create DropdownMenuItem type objects using the list and add them to the new itemList.
```dart
class _MyHomePageState extends State<MyHomePage> {
  .....
  
  @override
  Widget build(BuildContext context) {
  
   final itemList = list.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList();
    
  .....
  }
}
```

6. Add DropdownButton widget to the desired place. 
7. Give its items parameter the itemList value.
```dart
class _MyHomePageState extends State<MyHomePage> {
  .....

    return Scaffold(
      appBar: AppBar(
       title: const Text("Dropdown demo"),
      ),
      body: DropdownButton<String>(
        value: item,
        items: itemList,
        onChanged: (_){},
      ),
    );
  }
}
```
8. Fix the onChanged function to update the item variable.
```dart
class _MyHomePageState extends State<MyHomePage> {

  .....
  
  
        onChanged: (value) => setState(() {
            item = value ?? '';
          }),
      ),
    );
  }
}
```
and Thats it.


```dart
full code:

import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final list = ['', 'A', 'B', 'C', 'D'];
  String item = '';

  @override
  Widget build(BuildContext context) {
    final itemList = list.map((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(value),
      );
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Dropdown demo"),
      ),
      body: DropdownButton<String>(
        value: item,
        items: itemList,
        onChanged: (value) => setState(() {
          item = value ?? '';
        }),
      ),
    );
  }
}
```

## Takeaways
* Flutter uses a widget called DropdownButton to create a drop-down menu.
* Create a variable that can hold onto the selected value.
* Create a list of DropdownMenuItem type objects.
* Add the drop-down button widget to the desired place. 
* Give its items parameter the itemList value.
* Fix the onChanged function to update the selected value variable.
* To add a custom user-interface you can always add values to the various DropdownButton parameters and make it your own.

```dart=
DropdownButton({
    super.key,
    required this.items,
    this.selectedItemBuilder,
    this.value,
    this.hint,
    this.disabledHint,
    required this.onChanged,
    this.onTap,
    this.elevation = 8,
    this.style,
    this.underline,
    this.icon,
    this.iconDisabledColor,
    this.iconEnabledColor,
    this.iconSize = 24.0,
    this.isDense = false,
    this.isExpanded = false,
    this.itemHeight = kMinInteractiveDimension,
    this.focusColor,
    this.focusNode,
    this.autofocus = false,
    this.dropdownColor,
    this.menuMaxHeight,
    this.enableFeedback,
    this.alignment = AlignmentDirectional.centerStart,
    this.borderRadius,
  })
```

## Conclusion
It can be tricky to decide when to use a drop-down instead of another interface type, such as a radio button or open text field for specific input. The general idea is we use it when there are more than five input options.

![Before selction](https://user-images.githubusercontent.com/8918999/224479733-6c83028e-b346-4c59-9649-3ef2fbb88c87.png)
![After selction](https://user-images.githubusercontent.com/8918999/224479746-ce48a3ec-4c7c-4340-8c8e-144254b502a0.png)


This is one of the articles I wrote for [Scaler](www.scaler.com).Thanks for reading.
