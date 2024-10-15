## 0.5.41
* Updated minimum dependencies to Dart >=3.5.3 and Flutter >= 3.24.0.
* Add `tooltipBuilder` to `SideMenuItemDataTile` now you can use any tooltip package you want
``` dart
tooltipBuilder: (tile) => Tooltip(
message: "Tooltip message",
child: tile,
),
```

## 0.5.3
* Add `selectedDecoration` to `SideMenuItemTileDefaults`

## 0.5.2
* Add `SideMenuItemTileDefaults` to `SideMenuData` to define default settings for Tiles

## 0.5.1
* Replace Widget with Divider in `SideMenuItemDataDivider` to have custom divider.

## 0.5.0
* Updated minimum dependencies to Dart >=3.4.0 and Flutter >= 3.21.1.
* **Breaking changes** Remove badge package and add `badgeBuilder` to `SideMenuItemDataTile` property now you can use any badge package you want.
``` dart
 badgeBuilder: (tile) =>badges.Badge(
  badgeContent: Center(child: Text('1')),
  ///  Do not forgot to add tile as child
  child: tile) 
```
  * remove `badgeContent`, `badgePosition`, `badgeStyle` from `SideMenuItemDataTile` instead use `badgeBuilder`.
* Add `isCollapsed` to `SideMenuController`
* Add `decoration` to `SideMenuItemDataTile` to full access on Tile decoration. 
* Add `shape` to `SideMenuItemDataTile` to full access on Tile Material shape. 
* Add `clipBehavior` to `SideMenuItemDataTile`.
* Add `customChildFlex` to `SideMenuData`.
* Add `spacerAfterCustomChild` to `SideMenuData`.
* Add `spacerAfterItems` to `SideMenuData`.
* Add `animHeader`, `animCustomChild`, `animItems`, `animFooter` to `SideMenuData` now you can add simple scale animation to any part of Menu.
* Use `MediaQuery.sizeOf` to avoiding unnecessary rebuilds

## 0.4.0
* **Breaking changes** related to Bug [#8](https://github.com/resfandiari/flutter_side_menu/issues/8): 
  * remove `selectedColor` from `SideMenuItemDataTile` instead use `selectedTitleStyle`
  * remove `unSelectedColor` from `SideMenuItemDataTile` instead use `titleStyle`
* Updated minimum dependencies to Dart >=3.0.0 and Flutter >= 3.10.0.

## 0.3.2
* Add support to align SideMenuItemDataTitle

## 0.3.1
* Add optional selected icon and selected text style property

## 0.3.0
* Add Material hover effect 
* Set Theme colors as defaults

## 0.2.1
* Bug fix: #3
* Breaking changes: remove badgeColor instead use BadgeStyle

## 0.2.0
* Add optional hover color style property
* Add more left side menu items to example

## 0.1.3
* Add simple example
* Add go_router example
* Fix document assets path

## 0.1.1
* Updated minimum dependencies to Dart >=2.18.0 and Flutter >= 3.3.0.

## 0.1.0
* Breaking changes: rename SideMenuItemData to SideMenuItemDataTile
* Breaking changes: use widget as SideMenuItemData icon
* Add title widget to SideMenuData items
* Add divider widget to SideMenuData items
* Implement "Navigation Side" example

## 0.0.9
* Add screenshots
* Fix assert error

## 0.0.8
* Add document

## 0.0.7
* Fix calculate width in mobile size
* Fix side menu customChild height
* Rename SideMenuBodyData to SideMenuData

## 0.0.6
* Changed side menu body isCompact property to isOpen

## 0.0.5
* Add currentWidth,maxWidth,minWidth to side menu builder data
* Add side menu item reference to accessible reference
* Fix bug side menu builder isOpen property

## 0.0.4
* Separation of classes and data classes
* Fix file formatting issues

## 0.0.3
* Add controller
* Add badge
* Add tooltip
* Change body property to builder
* Send last menu state to builder
* Add background color property

## 0.0.2
*  Add body to side menu

## 0.0.1
*  Initial release
