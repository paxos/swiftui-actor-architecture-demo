### Example of a SwiftUI architecture where the core logic operates on a shared actor

- `/MyApp`: Swift Package that holds the app logic
- `AppObservable`: This is accessible on the main actor and is triggering UX updates. It is not directly mutable.
- `/Services`: The _true_ source of truth. The app calls functions (in async tasks, as functions run on the shared globla actor). If state changes are caused, they will be published back to the `AppObservabe`
- `MyApp` glues everything together. Constructing this class is difficult, as its parts are bound to different actors. This is why it needs to be initialized in an asynchronous way, which makes passing it to SwiftUI painful.
