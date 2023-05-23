
# Responsive Sidebar/Drawer for Web & Mobile

A custom drawer for web and mobile which adapts itseld based on the the screen size.


## Demo

![Video](./demo.gif)


## Features

- Sidebar when layout is web
- Cloappsable when screen layout is reduced
- Overlay drawer when screen is mobile


## Usage/Examples

Wrap your body with SidebarDrawer()

This widget contains `drawer` `body`

Pass custom drawer widget to the `drawer` property.

`body` will display the contents in the main page

Use `DrawerIcon`  to display a menu icon which will on clicking will close / open the drawer
```dart
Scaffold(
      body: SidebarDrawer(
        drawer: CustomDrawer(),
        body: Column(
          children: [
            AppBar(
              leading: DrawerIcon(),
            ),
            MainBody(),
          ],
        ),
      ),
```


## More Packages

Here are some more packages 

[Custom Filters](https://pub.dev/packages/data_filters)

[Offline Store Upload](https://pub.dev/packages/offline_store_upload)

