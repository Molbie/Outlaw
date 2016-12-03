![License](https://img.shields.io/dub/l/vibe-d.svg)
![Platforms](https://img.shields.io/badge/Platforms-macOS%20%7C%20iOS%20%7C%20tvOS%20%7C%20watchOS-lightgrey.svg)
[![Build Status](https://travis-ci.org/Molbie/Outlaw.svg?branch=master)](https://travis-ci.org/Molbie/Outlaw)
[![codecov](https://codecov.io/gh/Molbie/Outlaw/branch/master/graph/badge.svg)](https://codecov.io/gh/Molbie/Outlaw)


# Outlaw

In Swift, we all deal with JSON, plists, and various forms of `[String: Any]`. `Outlaw` provides various ways to deal with these in an expressive and type safe way. `Outlaw` will help you write declarative, performant, error handled code using the power of __Protocol Oriented Programming™__.


## Usage

Extracting values from `[String: Any]` using Outlaw is as easy as

```swift
let name: String = try json.value(for: "name")
let url: URL = try json.value(for: "user.website") // extract from nested objects!
```


## Converting to Models

Often we want to take an extractable object (like `[String: Any]`) and deserialize it into one of our local models—for example we may want to take some JSON and initialize one of our local models with it:

```swift
struct User: Deserializable {
    var id: Int
    var name: String
    var email: String

    init(object: Extractable) throws {
        id = try object.value(for: "id")
        name = try object.value(for: "name")
        email = try object.value(for: "email")
    }
}
```

Now, just by virtue of supplying a simple initializer you can *pull your models directly out of `[String: Any]`*!

```swift
let users: [User] = try json.value(for: "users")
```

That was easy! Thanks, Protocol Oriented Programming™!


## Serializing Models

We've looked at going from our `[String: Any]` into our local models, but what about the other way around?

```swift
extension User: Serializable {
	func serialized() -> [String: Any] {
        return {
            "id": "id",
            "name" : name,
            "email": email
        }
    }
}
```

Now, you might be thinking "but couldn't I use reflection to do this for me automagically?" You could. And if you're into that, there are some other great frameworks for you to use. But Outlaw believes mirrors can lead down the road to a world of hurt. Outlaw lives in a world where What You See Is What You Get™, and you can easily adapt to APIs that snake case, camel case, or whatever case your backend developers are into. Outlaw code is explicit and declarative. But don't just take Outlaw's word for it—read the good word towards the end [here on the official Swift blog.](https://developer.apple.com/swift/blog/?id=37)


## Error Handling

Are you someone that doesn't care about errors? Use an optional data type. 

```swift
let users: [User]? = json.value(for: "users")
```

Otherwise, wrap your code in a `do-catch` to get all the juicy details when things go wrong.

```swift
do {
	let users: [User] = try json.value(for: "users")
}
catch {
	print(error)
}
```


## Add Your Own Values

Out of the box, `Outlaw` supports extracting native Swift types like `String`, `Int`, etc., as well as `URL`, `Date` and anything conforming to `Deserializable`, and arrays or dictionaries of all the aforementioned types. 

However, Outlaw doesn't just leave you up the creek without a paddle! Adding your own Outlaw value type is as easy as extending your type with `Value`.

```swift
extension CGPoint: Value {
    public static func value(from object: Any) throws -> CGPoint {
        guard let properties = object as? [String: CGFloat] else {
            throw OutlawError.typeMismatch(expected: [String: CGFloat].self, actual: type(of: object))
        }
        let x: CGFloat = properties["x"] ?? 0
        let y: CGFloat = properties["y"] ?? 0
        
        return CGPoint(x: x, y: y)
    }
}
```

By simply implementing `value(from:)`, Outlaw allows you to immediately do this:

```swift
let point: CGPoint = try json.value(for: "point")
```

Protocol Oriented Programming™ strikes again!


## Intermediate Values

Don't like how `Outlaw` implements the default value extraction? Have a different date format? No problem! All you need is a transformation function when extracting the values.

```swift
let formatter = DateFormatter()
formatter.timeZone = TimeZone(abbreviation: "GMT")
formatter.dateFormat = "MM/dd/yyyy"

let date: Date? = json.value(for: "date", with: { (dateString: String) -> Date? in
	return formatter.date(from: dateString)
})
```

We can also use the power of swift and shorten the above code to:

```swift
let date: Date? = json.value(for: "date", with: formatter.date)
```


# Performance

Outlaw is based on the same underlying code as [Marshal](https://github.com/utahiosmac/Marshal) and is just as performant. You should always take benchmarks with a grain of salt, but chew on [these benchmarks](https://github.com/bwhiteley/JSONShootout) for a bit anyway. Unfortunately, the JSONShootout project was built in a way so that Outlaw can't be added because of ambiguous method collisions with Marshal.


# Goal

`Outlaw` was created by one of the main contributors to [Marshal](https://github.com/utahiosmac/Marshal). However, `Marshal` was designed to be a bare bones framework that needed to be extended for additional features. `Outlaw` was designed to be a more feature rich framework that can handle a lot more data extraction scenarios out of the box.

