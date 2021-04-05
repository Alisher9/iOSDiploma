

import Moya
import NeedleFoundation
import UIKit

// swiftlint:disable unused_declaration
private let needleDependenciesHash : String? = nil

// MARK: - Registration

public func registerProviderFactories() {
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: "^->RootComponent->LoginComponent->SignUpComponent") { component in
        return SignUpDependency472b53508e2bb1a5835aProvider(component: component)
    }
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: "^->RootComponent") { component in
        return EmptyDependencyProvider(component: component)
    }
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: "^->RootComponent->LoginComponent") { component in
        return LoginDependency006c7d880fec28863ecaProvider(component: component)
    }
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: "^->RootComponent->OnboardingComponent") { component in
        return OnboardingDependencyc2e150944dc3c9e77b26Provider(component: component)
    }
    
}

// MARK: - Providers

private class SignUpDependency472b53508e2bb1a5835aBaseProvider: SignUpDependency {
    var webService: WebServiceType {
        return rootComponent.webService
    }
    private let rootComponent: RootComponent
    init(rootComponent: RootComponent) {
        self.rootComponent = rootComponent
    }
}
/// ^->RootComponent->LoginComponent->SignUpComponent
private class SignUpDependency472b53508e2bb1a5835aProvider: SignUpDependency472b53508e2bb1a5835aBaseProvider {
    init(component: NeedleFoundation.Scope) {
        super.init(rootComponent: component.parent.parent as! RootComponent)
    }
}
private class LoginDependency006c7d880fec28863ecaBaseProvider: LoginDependency {
    var webService: WebServiceType {
        return rootComponent.webService
    }
    var sessionTracker: SessionTracker {
        return rootComponent.sessionTracker
    }
    private let rootComponent: RootComponent
    init(rootComponent: RootComponent) {
        self.rootComponent = rootComponent
    }
}
/// ^->RootComponent->LoginComponent
private class LoginDependency006c7d880fec28863ecaProvider: LoginDependency006c7d880fec28863ecaBaseProvider {
    init(component: NeedleFoundation.Scope) {
        super.init(rootComponent: component.parent as! RootComponent)
    }
}
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
