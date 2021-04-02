

import Moya
import NeedleFoundation
import UIKit

// swiftlint:disable unused_declaration
private let needleDependenciesHash : String? = nil

// MARK: - Registration

public func registerProviderFactories() {
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: "^->RootComponent") { component in
        return EmptyDependencyProvider(component: component)
    }
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: "^->RootComponent->OnboardingComponent") { component in
        return OnboardingDependencyc2e150944dc3c9e77b26Provider(component: component)
    }
    
}

// MARK: - Providers

private class OnboardingDependencyc2e150944dc3c9e77b26BaseProvider: OnboardingDependency {
    var sessionTracker: SessionTracker {
        return rootComponent.sessionTracker
    }
    var rootModuleBuilder: RootModuleBuilder {
        return rootComponent.rootModuleBuilder
    }
    private let rootComponent: RootComponent
    init(rootComponent: RootComponent) {
        self.rootComponent = rootComponent
    }
}
/// ^->RootComponent->OnboardingComponent
private class OnboardingDependencyc2e150944dc3c9e77b26Provider: OnboardingDependencyc2e150944dc3c9e77b26BaseProvider {
    init(component: NeedleFoundation.Scope) {
        super.init(rootComponent: component.parent as! RootComponent)
    }
}
