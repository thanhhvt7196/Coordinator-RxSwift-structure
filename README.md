# Coordinator-RxSwift-structure
## Swiftgen
Using Swiftgen for automatically generated resources like images, fonts etc.

Here are multiple possibilities to install SwiftGen on your machine or in your project, depending on your preferences and needs:

<details>
<summary><strong>Download the ZIP</strong> for the latest release</summary>

* [Go to the GitHub page for the latest release](https://github.com/SwiftGen/SwiftGen/releases/latest)
* Download the `swiftgen-x.y.z.zip` file associated with that release
* Extract the content of the zip archive in your project directory

We recommend that you **unarchive the ZIP inside your project directory** and **commit its content** to git. This way, **all coworkers will use the same version of SwiftGen for this project**.

If you unarchived the ZIP file in a folder e.g. called `swiftgen` at the root of your project directory, you can then invoke SwiftGen in your Script Build Phase using:

```sh
"${PROJECT_DIR}/swiftgen/bin/swiftgen" …
```

---
</details>
<details>
<summary>Via <strong>CocoaPods</strong></summary>

If you're using CocoaPods, simply add `pod 'SwiftGen', '~> 6.0'` to your `Podfile`.

Then execute `pod install --repo-update` (or `pod update SwiftGen` if you want to update an existing SwiftGen installation) to download and install the `SwiftGen` binaries and dependencies in `Pods/SwiftGen/bin/swiftgen` next to your project.

Given that you can specify an exact version for `SwiftGen` in your `Podfile`, this allows you to ensure **all coworkers will use the same version of SwiftGen for this project**.

You can then invoke SwiftGen in your Script Build Phase using:

```sh
if [[ -f "${PODS_ROOT}/SwiftGen/bin/swiftgen" ]]; then
  "${PODS_ROOT}/SwiftGen/bin/swiftgen" …
else
  echo "warning: SwiftGen is not installed. Run 'pod install --repo-update' to install it."
fi
```

> Similarly, be sure to use `Pods/SwiftGen/bin/swiftgen` instead of just `swiftgen` where we mention commands with `swiftgen` in the rest of the documentation.

_Note: SwiftGen isn't really a pod, as it's not a library your code will depend on at runtime; so the installation via CocoaPods is just a trick that installs the SwiftGen binaries in the Pods/ folder, but you won't see any swift files in the Pods/SwiftGen group in your Xcode's Pods.xcodeproj. That's normal; the SwiftGen binary is still present in that folder in the Finder._

---
</details>
<details>
<summary>Via <strong>Homebrew</strong> <em>(system-wide installation)</em></summary>

To install SwiftGen via [Homebrew](http://brew.sh), simply use:

```sh
$ brew update
$ brew install swiftgen
```

This will install SwiftGen **system-wide**. The same version of SwiftGen will be used for all projects on that machine, and you should make sure all your coworkers have the same version of SwiftGen installed on their machine too.

You can then invoke `swiftgen` directly in your Script Build Phase (as it will be in your `$PATH` already):

```sh
swiftgen … 
```

---
</details>
<details>
<summary>Via <strong>Mint</strong> <em>(system-wide installation)</em></summary>

> ❗️SwiftGen 6.0 or higher only.

To install SwiftGen via [Mint](https://github.com/yonaskolb/Mint), simply use:

```sh
$ mint install SwiftGen/SwiftGen
```
---
</details>
<details>
<summary><strong>Compile from source</strong> <em>(only recommended if you need features from the `stable` branch or want to test a PR)</em></summary>

This solution is when you want to build and install the latest version from `stable` and have access to features which might not have been released yet.

* If you have `homebrew` installed, you can use the following command to build and install the latest commit:

```sh
brew install swiftgen --HEAD
```

* Alternatively, you can clone the repository and use `rake cli:install` to build the tool and install it from any branch, which could be useful to test SwiftGen in a fork or a Pull Request branch.

Some Ruby tools are used in the build process, and the system Ruby works well if you are running a recent macOS.  However, if you are using `rbenv` you can run `rbenv install` to make sure you have a matching version of Ruby installed.  

Then install the Ruby Gems:

```sh
# Install bundle if it isn't installed
gem install bundle
# Install the Ruby gems from Gemfile
bundle install
```

You can now install to the default locations (no parameter) or to custom locations:

```sh
# Binary is installed in `./build/swiftgen/bin`, frameworks in `./build/swiftgen/lib` and templates in `./build/swiftgen/templates`
$ rake cli:install
# - OR -
# Binary will be installed in `~/swiftgen/bin`, frameworks in `~/swiftgen/fmk` and templates in `~/swiftgen/tpl`
$ rake cli:install[~/swiftgen/bin,~/swiftgen/fmk,~/swiftgen/tpl]
```

You can then invoke SwiftGen using the path to the binary where you installed it:

```sh
~/swiftgen/bin/swiftgen …
```

Or add the path to the `bin` folder to your `$PATH` and invoke `swiftgen` directly.

---
</details>

## Carthage

When we decide to use some libraries, please use Carthage instead of CocoaPods if possible.

### How to use Carthage.

general usage of Carthage for iOS.

https://github.com/Carthage/Carthage#user-content-if-youre-building-for-ios-tvos-or-watchos

Use `carthage update` with `--platform iOS --no-use-binaries`. Please commit Cartfile and Cartfile.resolved if you have added some packages to Cartfile. (otherwise, dependencies will be broken and it'll be failed to build, or cause any other problems)

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
