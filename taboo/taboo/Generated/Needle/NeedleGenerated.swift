

import Moya
import NeedleFoundation
import UIKit

// swiftlint:disable unused_declaration
private let needleDependenciesHash : String? = nil

// MARK: - Registration

public func registerProviderFactories() {
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: "^->RootComponent->HomeComponent") { component in
        return HomeDependencycad225e9266b3c9a56ddProvider(component: component)
    }
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: "^->RootComponent->GenresComponent") { component in
        return GenresDependency4e91ec0bf45d43f94ad8Provider(component: component)
    }
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: "^->RootComponent->LoginComponent->SignUpComponent") { component in
        return SignUpDependency472b53508e2bb1a5835aProvider(component: component)
    }
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: "^->RootComponent->LoginComponent->GenrePickerComponent") { component in
        return GenrePickerDependency9d9dfcc60b6638486709Provider(component: component)
    }
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: "^->RootComponent->ProfileComponent->ProfileResetPasswordComponent") { component in
        return ProfileResetPasswordDependency71989c48a12d31ccab22Provider(component: component)
    }
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: "^->RootComponent->ProfileComponent->ProfileMainComponent") { component in
        return ProfileMainDependency662ca9c7119e8e0d3443Provider(component: component)
    }
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: "^->RootComponent->ProfileComponent") { component in
        return ProfileDependency6818e92e498fe07e2622Provider(component: component)
    }
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: "^->RootComponent->ProfileComponent->ProfileSettingsComponent") { component in
        return ProfileSettingsDependencybdd38f4a81e26bd2a4c0Provider(component: component)
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

private class HomeDependencycad225e9266b3c9a56ddBaseProvider: HomeDependency {
    var webService: WebServiceType {
        return rootComponent.webService
    }
    private let rootComponent: RootComponent
    init(rootComponent: RootComponent) {
        self.rootComponent = rootComponent
    }
}
/// ^->RootComponent->HomeComponent
private class HomeDependencycad225e9266b3c9a56ddProvider: HomeDependencycad225e9266b3c9a56ddBaseProvider {
    init(component: NeedleFoundation.Scope) {
        super.init(rootComponent: component.parent as! RootComponent)
    }
}
private class GenresDependency4e91ec0bf45d43f94ad8BaseProvider: GenresDependency {
    var webService: WebServiceType {
        return rootComponent.webService
    }
    private let rootComponent: RootComponent
    init(rootComponent: RootComponent) {
        self.rootComponent = rootComponent
    }
}
/// ^->RootComponent->GenresComponent
private class GenresDependency4e91ec0bf45d43f94ad8Provider: GenresDependency4e91ec0bf45d43f94ad8BaseProvider {
    init(component: NeedleFoundation.Scope) {
        super.init(rootComponent: component.parent as! RootComponent)
    }
}
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
private class GenrePickerDependency9d9dfcc60b6638486709BaseProvider: GenrePickerDependency {
    var webService: WebServiceType {
        return rootComponent.webService
    }
    private let rootComponent: RootComponent
    init(rootComponent: RootComponent) {
        self.rootComponent = rootComponent
    }
}
/// ^->RootComponent->LoginComponent->GenrePickerComponent
private class GenrePickerDependency9d9dfcc60b6638486709Provider: GenrePickerDependency9d9dfcc60b6638486709BaseProvider {
    init(component: NeedleFoundation.Scope) {
        super.init(rootComponent: component.parent.parent as! RootComponent)
    }
}
private class ProfileResetPasswordDependency71989c48a12d31ccab22BaseProvider: ProfileResetPasswordDependency {
    var webService: WebServiceType {
        return rootComponent.webService
    }
    private let rootComponent: RootComponent
    init(rootComponent: RootComponent) {
        self.rootComponent = rootComponent
    }
}
/// ^->RootComponent->ProfileComponent->ProfileResetPasswordComponent
private class ProfileResetPasswordDependency71989c48a12d31ccab22Provider: ProfileResetPasswordDependency71989c48a12d31ccab22BaseProvider {
    init(component: NeedleFoundation.Scope) {
        super.init(rootComponent: component.parent.parent as! RootComponent)
    }
}
private class ProfileMainDependency662ca9c7119e8e0d3443BaseProvider: ProfileMainDependency {
    var webService: WebServiceType {
        return rootComponent.webService
    }
    var profileSettingsModuleBuilder: ProfileSettingsModuleBuilder {
        return profileComponent.profileSettingsModuleBuilder
    }
    var sessionTracker: SessionTracker {
        return rootComponent.sessionTracker
    }
    private let profileComponent: ProfileComponent
    private let rootComponent: RootComponent
    init(profileComponent: ProfileComponent, rootComponent: RootComponent) {
        self.profileComponent = profileComponent
        self.rootComponent = rootComponent
    }
}
/// ^->RootComponent->ProfileComponent->ProfileMainComponent
private class ProfileMainDependency662ca9c7119e8e0d3443Provider: ProfileMainDependency662ca9c7119e8e0d3443BaseProvider {
    init(component: NeedleFoundation.Scope) {
        super.init(profileComponent: component.parent as! ProfileComponent, rootComponent: component.parent.parent as! RootComponent)
    }
}
private class ProfileDependency6818e92e498fe07e2622BaseProvider: ProfileDependency {
    var webService: WebServiceType {
        return rootComponent.webService
    }
    private let rootComponent: RootComponent
    init(rootComponent: RootComponent) {
        self.rootComponent = rootComponent
    }
}
/// ^->RootComponent->ProfileComponent
private class ProfileDependency6818e92e498fe07e2622Provider: ProfileDependency6818e92e498fe07e2622BaseProvider {
    init(component: NeedleFoundation.Scope) {
        super.init(rootComponent: component.parent as! RootComponent)
    }
}
private class ProfileSettingsDependencybdd38f4a81e26bd2a4c0BaseProvider: ProfileSettingsDependency {
    var webService: WebServiceType {
        return rootComponent.webService
    }
    var profileResetPasswordModuleBuilder: ProfileResetPasswordModuleBuilder {
        return profileComponent.profileResetPasswordModuleBuilder
    }
    var sessionTracker: SessionTracker {
        return rootComponent.sessionTracker
    }
    private let profileComponent: ProfileComponent
    private let rootComponent: RootComponent
    init(profileComponent: ProfileComponent, rootComponent: RootComponent) {
        self.profileComponent = profileComponent
        self.rootComponent = rootComponent
    }
}
/// ^->RootComponent->ProfileComponent->ProfileSettingsComponent
private class ProfileSettingsDependencybdd38f4a81e26bd2a4c0Provider: ProfileSettingsDependencybdd38f4a81e26bd2a4c0BaseProvider {
    init(component: NeedleFoundation.Scope) {
        super.init(profileComponent: component.parent as! ProfileComponent, rootComponent: component.parent.parent as! RootComponent)
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
