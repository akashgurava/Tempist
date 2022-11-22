import SwiftUI

extension View {
    /// Get the class name of a view.
    func className() -> String {
        String(describing: type(of: self))
    }
}
