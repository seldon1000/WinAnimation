# WinAnimation

This is part of a greater effort to explain the importance of Animation&Motion inside mobile applications and games, developed @ Apple Developer Academy | Naples. The effort consists in four different repositories, each containing a single animation. You'll find the main GitHub repository containing further information at the link below.

https://github.com/seldon1000/SwiftUI_Animations

WinAnimation is a XCode project, containing an application prototype showcasing a win animation of a grid of dots and a detailed explanation of how to implement the animation in SwiftUI.

## Timed coolness

We can do much using only timed color changes. Implementing this animation seemed kinda difficult at first, but Swift and SwiftUI make it actually pretty simple. We're gonna use concurrency. But first, take a look at its magnificence.

![Alt Text](https://github.com/seldon1000/WinAnimation/blob/main/win.gif)

And now comes the dirty work. We're gonna reuse components from the other animations (https://github.com/seldon1000/SwiftUI_Animations), but with some more details. Let's start with the Start file, again. The gesture management is bit more complex than we discussed previously. In fact, the grid's ```dragGesture``` returns a Bool value, which is true only when every available dot inside the grid has been colored. If it's true, then the grid is complete, and some kind of animation should be played as feedback. So, to make it happen, we trigger another @State variable, ```win```. Triggering this variable, will start the animation of coloring dots we've seen above. This animation, although, takes some time, so we use ```DispatchQueue``` do delay something, this time by 2 whole seconds. Now, let's talk about ```DispatchQueue```. This class defined in Swift lets us execute code asynchronously after a desired delay, without blocking the entire application. But, why can't we use, for instance, ```withAnimation(.easeInOut.delay(2.0))``` instead? Cause the ```withAnimation``` function does not delay the execution, but only the resulting UI update animation. Huh? Well, that means that as soon as ```withAnimation``` is called, every changes is applied, while the UI response is delayed. This approach leave us with unexpected results. Using ```DispatchQueue``` instead, the whole execution is delayed, so the changes are not applied immediately, but "exactly" after 2 seconds, and then the UI is updated accordingly. I know this could be a bit tricky to understand, that's why I'm telling you this: go read the documentation, determine the inadequacy of it and then try it yourself. That's how I've come to know. However, once 2 seconds have passed, the grid will refresh itself.

```swift
.gesture(DragGesture().onEnded { value in
    if !win {
        if grid.dragGesture(translation: value.translation) {
            win.toggle()
                        
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                grid.resetGrid()
            }
        }
    }
})
```

One last bit of code. This below is taken from the DotComponent file. This says that: when the win variable is triggered, the dot is changed from an obstacle to a normal dot, with an animation delayed by a random value. This makes the dot turn from a grey color to orange, after a random delay. This is how you build that cool animation.

```swift
.onChange(of: win) { newValue in
    if dot.isObstacle && newValue {
        withAnimation(.easeInOut.delay(Double.random(in: 0.5...1.5))) {
            isObstacle = false
        }
    }
}
```

For more animations, refer to the link down below.

https://github.com/seldon1000/SwiftUI_Animations
