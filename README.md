<div align="center"> 
<h2 align="center">Flutter Side Menu</h2> 
<img height="160" align="center"  alt="logo" src="https://drive.google.com/uc?id=1HUQgH-XDwIweoyjfVrhBWHsDUzl-gcNX"/>
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
Caution: This project is still under development.

## Usage

To use this plugin, add `flutter_side_menu` as a [dependency in your pubspec.yaml file](https://flutter.dev/platform-plugins/).

### Example

<?code-excerpt "basic.dart (basic-example)"?>
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
                  builder: (isOpen) => SideMenuBodyData(
                    header: const Text('Header'),
                    items: [
                      SideMenuItemData(
                        isSelected: true,
                        onTap: () {},
                        title: 'Item 1',
                        icon: Icons.home,
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
                  builder: (isOpen) => const SideMenuBodyData(
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