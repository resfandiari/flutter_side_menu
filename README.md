<div align="center"> 
<h2 align="center">Flutter Side Menu</h2> 
<img height="160" align="center"  alt="logo" src="https://raw.githubusercontent.com/resfandiari/flutter_side_menu/main/assets/logo.png"/>
</br>
<a href="https://github.com/resfandiari/flutter_side_menu/blob/main/LICENSE">  
  <img alt="GitHub" src="https://img.shields.io/github/license/resfandiari/flutter_side_menu"> 
</a>  
<a href="https://github.com/resfandiari/flutter_side_menu">  
  <img alt="Pub Version" src="https://img.shields.io/pub/v/flutter_side_menu" />
</a>  
<a>  
  <img alt="GitHub repo size" src="https://img.shields.io/github/repo-size/resfandiari/flutter_side_menu">  
</a>  
</div>
</br>

**Flutter's full customizable side menu has been used as a directory for Related Pages, Navigation Items, Filter side and more.**

#### Flutter Side Menu Screenshots

<table>
  <tr>
    <td><a href="https://github.com/resfandiari/flutter_side_menu/tree/main/example/lib/navigation_side.dart">
Navigation Side    </a></td>
     <td><a href="https://github.com/resfandiari/flutter_side_menu/tree/main/example/lib/filter_side.dart">
Filter Side    </a></td>
  </tr>
  <tr>
    <td><img src="https://raw.githubusercontent.com/resfandiari/flutter_side_menu/main/assets/side_menu.png" ></td>
    <td><img src="https://raw.githubusercontent.com/resfandiari/flutter_side_menu/main/assets/side_filter.png" ></td>
  </tr>
 </table>

## Usage

### Add dependency

Please check the latest version before installation.
If there is any problem with the new version, please use the previous version

```yaml
dependencies:
  flutter:
    sdk: flutter
  # add flutter_side_menu
  flutter_side_menu: ^{latest version}
```

### Add the following imports to your Dart code

```dart
import 'package:flutter_side_menu/flutter_side_menu.dart';
```

### Property

| Property        | Type         | Default Value | Description                                                                 |
| --------------- | ------------ | ------------- | --------------------------------------------------------------------------- |
| builder      | SideMenuBuilder         | null          | Return 'SideMenuData' that includes headers, footers, items, or custom child                                             |
| controller      | SideMenuController         | null | The 'controller' that can be used to open, close, or toggle side menu.                    |
| mode         | SideMenuMode     | SideMenuMode.auto          | The 'SideMenuMode' which is auto, open or compact and can determine the menu state  |
| priority           | SideMenuPriority       | SideMenuPriority.mode          | The 'SideMenuPriority' which is mode or sizer. in sizer mode the side menu width not change if user set custom size with 'Resizer'   |
| position   | SideMenuPosition     | SideMenuPosition.left     | The 'SideMenuPosition' which is left or right.              |
| minWidth     | double  | 50.0      | The 'minWidth' value is used to determine the side menu width in the smallest case.                                                         |
| maxWidth | double         | 250.0         | The 'maxWidth' value is used to determine the side menu width in the largest case.                                                    |
| hasResizer    | bool         | true         | The 'hasResizer' enable 'Resizer' widget for side menu. With 'Resizer' the side menu width can be customized by the user.      |
| resizerData         | ResizerData | ResizerData()          | The 'ResizerData' that can set custom style for a 'Resizer'.         |
| hasResizerToggle         | bool | true          | The 'hasResizerToggle' enable 'ResizerToggle' widget for side menu. With 'ResizerToggle' button you can toggle the width of the side menu between 'minWidth' or 'maxWidth'.         |
| resizerToggleData         | ResizerToggleData | ResizerToggleData()          | The 'resizerToggleData' that can set custom style for a 'ResizerToggle'.         |
| backgroundColor         | Color | Color(0xffffffff)          | The 'backgroundColor' it's used to determine the side menu background color         |


### Example

``` dart
import 'package:flutter/material.dart';
import 'package:flutter_side_menu/flutter_side_menu.dart';

void main() => runApp(
      MaterialApp(
        home: Material(
          child: Scaffold(
            body: Row(
              children: [
                SideMenu(
                  builder: (data) => SideMenuData(
                    header: const Text('Header'),
                    items: [
                      SideMenuItemDataTile(
                        isSelected: true,
                        onTap: () {},
                        title: 'Item 1',
                        icon: const Icon(Icons.home),
                      ),
                    ],
                    footer: const Text('Footer'),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.white,
                    child: const Center(
                      child: Text(
                        'body',
                      ),
                    ),
                  ),
                ),
                SideMenu(
                  position: SideMenuPosition.right,
                  builder: (data) => const SideMenuData(
                    customChild: Text('Custom view'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
```