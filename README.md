# Coordinator-RxSwift-structure

## Carthage

When we decide to use some libraries, please use Carthage instead of CocoaPods if possible.

### How to use Carthage.

general usage of Carthage for iOS.

https://github.com/Carthage/Carthage#user-content-if-youre-building-for-ios-tvos-or-watchos

Please use `carthage update` with `--platform iOS --no-use-binaries`. Please commit Cartfile and Cartfile.resolved if you have added some packages to Cartfile. (otherwise, dependencies will be broken and it'll be failed to build, or cause any other problems)

```
$ carthage update --platform iOS --no-use-binaries
```

## CocoaPods

If we can't find Carthage installation for a library, we can use CocoaPods for that library. 

## Project Structure
```
/<Project Name>
/Base                      # Protocols, delegates and base-classes for ViewControllers, NavigationController etc. 
/Coordinator               # Handle App navigation using Coordinator pattern.
/Model                     # Contains model files 
/Network                   # Networking layer of this project
   /Response               # Models - Response that received from the API request
   /SampleData             # Sample data for API request's result
   /Services               # Handle all network operation
/Features                  # Contains all screen with ViewController, ViewModel, Storyboard files
   /Feature A              # Contains ViewController, ViewModel, Storyboard for Feature A
   /Feature B              # Contains ViewController, ViewModel, Storyboard for Feature B
  
.....

/Resources                 # Resources for this project
/Services                  # Services used by each ViewController
/Utils                     # Common loader, error message view etc.
   /Helpers                # Utility classes
   /Common                 # Definition of constant variables, strings etc. 
   /Extensions             # Extension for classes in the project
   /CustomView             # Custom views used in the project
   /Animation              # Animation for transition between views and viewControllers
   /PersistentManager      # Local database 
   
```

## Note

### Storyboard
* set colors with sRGB

<img src="https://user-images.githubusercontent.com/4714421/53492287-d65a4600-3adb-11e9-9a63-767d90556cb5.png" width="300">
