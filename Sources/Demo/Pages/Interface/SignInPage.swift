import AsyncPlotTabler

/// Sign In Demo Page
struct SignInPage: Component {
    enum LinkStyle {
        case emailConfirmation
        case resetPassword
    }
    
    enum Mode {
        case signIn
        case signUp
        case link(LinkStyle)
        case forgotPassword
    }
    
    enum Style {
        case bare
        case illustration(URLRepresentable)
        case cover(URLRepresentable)
    }
    
    let mode:Mode
    let style:Style
    
    init(mode: Mode, style: Style) {
        self.mode = mode
        self.style = style
    }
    
    func body() async -> Plot.Component {
        switch style {
        case .bare:
            await DivC("page page-center") {
                await DivC("container container-tight py-4") {
                    await buildComponentForMode()
                }
            }
        case .illustration(let url):
            await DivC("page page-center") {
                await DivC("container container-normal py-4") {
                    await DivC("row align-items-center g-4") {
                        await DivC("col-lg") {
                            await DivC("container-tight") {
                                await buildComponentForMode()
                            }
                        }
                        await DivC("col-lg d-none d-lg-block") {
                            Image(url: url, description: "Sing in illustration")
                                .attribute(named: "height", value: "300")
                                .class("d-block mx-auto")
                        }
                    }
                    
                }
            }
        case .cover(let url):
            await DivC("row g-0 flex-fill") {
                await DivC("col-12 col-lg-6 col-xl-4 border-top-wide border-primary d-flex flex-column justify-content-center") {
                    await DivC("container container-tight my-5 px-lg-5") {
                        await buildComponentForMode()
                    }
                }
                await DivC("col-12 col-lg-6 col-xl-8 d-none d-lg-block") {
                    await DivC("bg-cover h-100 min-vh-100") { }
                        .style("background-image: url(\(url))")
                }
            }
        }
    }
    
    func buildComponentForMode() async -> Component {
        switch self.mode {
        case .signIn:
            return await loginForm()
        case .signUp:
            return await signUpForm()
        case .link(let style):
            return await link(style)
        case .forgotPassword:
            return await forgotPassword()
        }
    }
    
    func loginForm() async -> Component {
        await ComponentGroup {
            await DivC("text-center mb-4") {
                Link(url: ".") {
                    Image(url: "./static/logo.svg", description: "Tabler")
                        .attribute(named: "width", value: "110")
                        .attribute(named: "height", value: "32")
                        .class("navbar-brand-image")
                }
                .class("navbar-brand navbar-brand-autodark")
            }
            await DivC("card card-md") {
                await DivC("card-body") {
                    H2 { Text("Login to your account") }.class("h2 text-center mb-4")
                    
                    Plot.Form(url: "./", method: .post, contentType: .plainText, enableValidation: false) {
                        await DivC("mb-3") {
                            Plot.Form.Label("Email address")
                            Plot.Form.Textfield(type: .email, name: "login-email", placeholder: "your@email.com")
                        }
                        await DivC("mb-3") {
                            await Plot.Form.Label("Password", trailingContent: { Link(url: "./forgot-password", label: { Text("forgot password") }) })
                            Plot.Form.Textfield(type: .password, name: "login-password", value: nil, placeholder: "password")
                        }
                        await Plot.Form.Checkbox(name: "login-remember-me", required: false) {
                            Text("Remember me on this device")
                        }
                        
                        await DivC("form-footer") {
                            SubmitButton(title: "Sign in")
                                .class("btn btn-primary w-100")
                        }
                    }
                    .attribute(named: "autocomplete", value: "off")
                }
                await DivC("hr-text") { Text("or") }
                await DivC("card-body") {
                    await Row {
                        await Column {
                            Link(url: "#") {
                                IconLabel(icon: .brand_github, text: "Login with Github", badge: nil)
                            }.class("btn w-100")
                        }
                        await Column {
                            Link(url: "#") {
                                IconLabel(icon: SVGIcon(icon: .brand_twitter, color: .azure), text: "Login with Twitter", badge: nil)
                            }.class("btn w-100")
                        }
                    }
                }
            }
            // Sign up text
            await DivC("text-center text-secondary mt-3") {
                Text("Don't have an account yet? ")
                Link(url: "./sign-up", label: { Text("Sign up") })
            }
        }
    }
    
    func signUpForm() async -> Component {
        await ComponentGroup {
            await DivC("text-center mb-4") {
                Link(url: ".") {
                    Image(url: "./static/logo.svg", description: "Tabler")
                        .attribute(named: "width", value: "110")
                        .attribute(named: "height", value: "32")
                        .class("navbar-brand-image")
                }
                .class("navbar-brand navbar-brand-autodark")
            }
            await DivC("card card-md") {
                await DivC("card-body") {
                    H2 { Text("Create a new account") }.class("h2 text-center mb-4")
                    
                    Plot.Form(url: "./", method: .post, contentType: .plainText, enableValidation: false) {
                        await DivC("mb-3") {
                            Plot.Form.Label("Email address")
                            Plot.Form.Textfield(type: .email, name: "login-email", placeholder: "your@email.com")
                        }
                        await DivC("mb-3") {
                            Plot.Form.Label("Password")
                            Plot.Form.Textfield(type: .password, name: "login-password", value: nil, placeholder: "password")
                        }
                        await DivC("mb-3") {
                            Plot.Form.Label("Confirm password")
                            Plot.Form.Textfield(type: .password, name: "login-password-confirm", value: nil, placeholder: "confirm password")
                        }
                        await Plot.Form.Checkbox(name: "signup-tos", required: true) {
                            Text("Agree to the ")
                            Link(url: "#", label: { Text("terms and policy") })
                        }
                        
                        await DivC("form-footer") {
                            SubmitButton(title: "Create new account")
                                .class("btn btn-primary w-100")
                        }
                    }
                    .attribute(named: "autocomplete", value: "off")
                }
            }
            // Sign in text
            await DivC("text-center text-secondary mt-3") {
                Text("Already have an account? ")
                Link(url: "./sign-in", label: { Text("Sign in") })
            }
        }
    }
    
    func link(_ style:LinkStyle) async -> Component {
        await ComponentGroup {
            // Logo
            await DivC("text-center mb-4") {
                Link(url: ".") {
                    Image(url: "./static/logo.svg", description: "Tabler")
                        .attribute(named: "width", value: "110")
                        .attribute(named: "height", value: "32")
                        .class("navbar-brand-image")
                }
                .class("navbar-brand navbar-brand-autodark")
            }
            
            // Check your inbox
            await DivC("text-center") {
                await DivC("my-5") {
                    H2 { Text("Check your inbox") }.class("h1")
                    Paragraph {
                        Text("We've sent you a magic link to ")
                        await Strong { Text("support@tabler.io") }
                        Text(". Please click the link to ")
                        switch style {
                        case .emailConfirmation:
                            Text("confirm your address.")
                        case .resetPassword:
                            Text("reset your password.")
                        }
                    }
                    .class("fs-h3 text-secondary")
                }
                
                // Wrong email
                await DivC("text-center text-secondary mt-3") {
                    Text("Can't see the email? Please check your spam folder.")
                    Text(" Wrong email? Please ")
                    switch style {
                    case .emailConfirmation:
                        Link(url: "./sign-up", label: { Text("re-enter your address") })
                    case .resetPassword:
                        Link(url: "./forgot-password", label: { Text("re-enter your address") })
                    }
                }
            }
        }
    }
    
    func forgotPassword() async -> Component {
        await ComponentGroup {
            await DivC("text-center mb-4") {
                Link(url: ".") {
                    Image(url: "./static/logo.svg", description: "Tabler")
                        .attribute(named: "width", value: "110")
                        .attribute(named: "height", value: "32")
                        .class("navbar-brand-image")
                }
                .class("navbar-brand navbar-brand-autodark")
            }
            await DivC("card card-md") {
                await DivC("card-body") {
                    H2 { Text("Forgot password") }.class("h2 text-center mb-4")
                    
                    Plot.Form(url: "./", method: .post, contentType: .plainText, enableValidation: false) {
                        await DivC("mb-3") {
                            Plot.Form.Label("Email address")
                            Plot.Form.Textfield(type: .email, name: "fp-email", placeholder: "your@email.com")
                        }
                        
                        await DivC("form-footer") {
                            SubmitButton(title: "Reset my password")
                                .class("btn btn-primary w-100")
                        }
                    }
                    .attribute(named: "autocomplete", value: "off")
                }
            }
            // Return to login
            await DivC("text-center text-secondary mt-3") {
                Text("Forget it,  ")
                Link(url: "./sign-in", label: { Text("take me back") })
                Text(" to the sign in page.")
            }
        }
    }
}
