# AAII - Automatic Accessibility Identifier Injection

This is an extension of UIView and UIViewController which automatically injects accessibility identifiers into:

- the root view of a view controller
- custom views connected via IBOutlets.
- a UIView (including UITableView cell)

if you call `injectAccessibilityIdentifiers(customPrefixChain:[String], replaceExisting:Bool)` on a `UIView` or `UIViewController` object.




## Custom Prefix for accessibility identifiers
- `customPrefixChain` defaults to `[]`, this is useful if, for example, you have many different `UITableViewCell` cells in a `UITableView`, but they are not derived classes of `UITableViewCell`, you can assign a custom prefix.

## Avoid replacing existing accessibility identifiers
- `replaceExisting` defaults to `true`, this is useful if you rely on existing accessibility identifiers.
You can call `injectAccessibilityIdentifiers` with `replaceExisting:false` like so:
```swift
injectAccessibilityIdentifiers(replaceExisting:false)
```
to only assign an `accessibilityIdentifier` to objects if the value is unassigned (`nil`). This is helpful if you already have existing accessibility identifiers that you don't want AAII to interfere with.


## UIViewController Example
```swift
class FooViewController: UIViewController {
    // assuming this IBOutlet isn't nil
    @IBOutlet var barView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()	
	injectAccessibilityIdentifiers()
    }
}


let fooVC = FooViewController.init()

fooVC.view.accessibilityIdentifier == "FooViewController.view"
fooVC.barView.accessibilityIdentifier == "FooViewController.barView"
```

## UITableViewCell Example
```swift
class FooCell:UITableViewCell {
    // assuming this IBOutlet isn't nil
    @IBOutlet var barView: UIView!
}
override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "fooCell", for: indexPath) as! FooCell
	
    cell.injectAccessibilityIdentifiers()
	
    return cell
}

cell.accessibilityIdentifier == "FooCell"
cell.barView.injectAccessibilityIdentifier == "FooCell.barView"
```

You can also call the method from inside `awakeFromNib`

```swift
class FooCell: UITableViewCell {
    @IBOutlet var fooLabel:UILabel!
    @IBOutlet var fooButton:UIButton!
	
    override func awakeFromNib() {
        super.awakeFromNib()
        injectAccessibilityIdentifiers()
    }
}


// for a given cell:FooCell

cell.accessibilityIdentifier == "FooCell"
cell.barView.injectAccessibilityIdentifier == "FooCell.barView"
```

The following properties of a `UITableViewCell` will be assigned an `accessibilityIdentifier` as well, if they are not `nil`
```swift
cell.contentView.accessibilityIdentifier == "FooCell.contentView"
cell.textLabel.accessibilityIdentifier == "FooCell.textLabel"
cell.detailTextLabel.accessibilityIdentifier == "FooCell.detailTextLabel"
cell.imageView.accessibilityIdentifier == "FooCell.imageView"
```

## CustomReflectable Example
If you have a property on your UIViewController or UIView that is not being included by AAII for whatever reason,
you can make your view conform to `CustomReflectable` and provide a `customMirror:Mirror` (see below)

```swift
class BarView: UIView {}

class FooViewController: UIViewController, CustomReflectable {
    @IBOutlet var fooFooView:UIView!
    let barView = BarView.init()
    public var customMirror: Mirror {
        return Mirror(self, children:[
            "barBar": barView,
	    // fooFooView needs to be manually included when conforming to CustomReflectable
            "fooFooView": fooFooView
        ])
    }
}


let fooVC = FooViewController.init()

fooVC.view.accessibilityIdentifier == "FooViewController.view"
fooVC.barView.accessibilityIdentifier == "FooViewController.barBar"
fooVC.fooFooView.accessibilityIdentifier == "FooViewController.fooFooView"
```
