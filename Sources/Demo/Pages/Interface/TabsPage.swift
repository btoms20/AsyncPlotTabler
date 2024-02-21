import AsyncPlotTabler

/// Tabs Demo Page
struct TabsPage: Component {
    func body() async -> Plot.Component {
        await Site(header: NavBar(brand: .init(title: "Tabler"), routes: .demoRoutes), page: Page(header: .init(header: "Tabs"), content: {
            await CardVStack {
                await CardHStack {
                    await Card(tabbedSections: [
                        TabbedCard.TabComponent(tab: {
                            Text("Home")
                        }, body: {
                            await H4("Home tab")
                            Div {
                                Text("Cursus turpis vestibulum, dui in pharetra vulputate id sed non turpis ultricies fringilla at sed facilisis lacus pellentesque purus nibh")
                            }
                        }),
                        TabbedCard.TabComponent(tab: {
                            Text("Profile")
                        }, body: {
                            await H4("Profile tab")
                            Div {
                                Text("Fringilla egestas nunc quis tellus diam rhoncus ultricies tristique enim at diam, sem nunc amet, pellentesque id egestas velit sed")
                            }
                        }),
                        TabbedCard.TabComponent(
                            pullRight: true,
                            dropdownItems: [
                                DropDownMenu_SingleItem(url: "#", content: {
                                    Text("Item 1")
                                }),
                                DropDownMenu_SingleItem(url: "#", content: {
                                    Text("Exit")
                                })
                            ],
                            tab: {
                                SVGIcon(icon: .settings)
                            }
                        )
                    ])
                    
                    await Card(reverseTabs: true, tabbedSections: [
                        TabbedCard.TabComponent(tab: {
                            Text("Home")
                        }, body: {
                            await H4("Home tab")
                            Div {
                                Text("Cursus turpis vestibulum, dui in pharetra vulputate id sed non turpis ultricies fringilla at sed facilisis lacus pellentesque purus nibh")
                            }
                        }),
                        TabbedCard.TabComponent(tab: {
                            Text("Profile")
                        }, body: {
                            await H4("Profile tab")
                            Div {
                                Text("Fringilla egestas nunc quis tellus diam rhoncus ultricies tristique enim at diam, sem nunc amet, pellentesque id egestas velit sed")
                            }
                        }),
                        TabbedCard.TabComponent(
                            pullRight: true,
                            tab: {
                                SVGIcon(icon: .settings)
                            }, body: {
                                await H4("Settings tab")
                                Div {
                                    Text("Donec ac vitae diam amet vel leo egestas consequat rhoncus in luctus amet, facilisi sit mauris accumsan nibh habitant senectus")
                                }
                            }
                        )
                    ])
                    
                    await Card(tabbedSections: [
                        TabbedCard.TabComponent(tab: {
                            IconLabel(icon: .home, text: "Home")
                        }, body: {
                            await H4("Home tab")
                            Div {
                                Text("Cursus turpis vestibulum, dui in pharetra vulputate id sed non turpis ultricies fringilla at sed facilisis lacus pellentesque purus nibh")
                            }
                        }),
                        TabbedCard.TabComponent(tab: {
                            IconLabel(icon: .user, text: "Profile")
                        }, body: {
                            await H4("Profile tab")
                            Div {
                                Text("Fringilla egestas nunc quis tellus diam rhoncus ultricies tristique enim at diam, sem nunc amet, pellentesque id egestas velit sed")
                            }
                        })
                    ])
                }
                
                await CardHStack {
                    await Card(tabbedSections: [
                        TabbedCard.TabComponent(tab: {
                            Text("Home")
                        }, body: {
                            await H4("Home tab")
                            Div {
                                Text("Cursus turpis vestibulum, dui in pharetra vulputate id sed non turpis ultricies fringilla at sed facilisis lacus pellentesque purus nibh")
                            }
                        }),
                        TabbedCard.TabComponent(tab: {
                            Text("Profile")
                        }, body: {
                            await H4("Profile tab")
                            Div {
                                Text("Fringilla egestas nunc quis tellus diam rhoncus ultricies tristique enim at diam, sem nunc amet, pellentesque id egestas velit sed")
                            }
                        }),
                        TabbedCard.TabComponent(
                            dropdownItems: [
                                DropDownMenu_SingleItem(url: "#", content: {
                                    Text("Item 1")
                                }),
                                DropDownMenu_SingleItem(url: "#", content: {
                                    Text("Exit")
                                })
                            ],
                            tab: {
                                Text("Dropdown")
                            }
                        )
                    ])
                    
                    await Card(tabsFillHeader:true, tabbedSections: [
                        TabbedCard.TabComponent(tab: {
                            Text("Home")
                        }, body: {
                            await H4("Home tab (full width tabs)")
                            Div {
                                Text("Cursus turpis vestibulum, dui in pharetra vulputate id sed non turpis ultricies fringilla at sed facilisis lacus pellentesque purus nibh")
                            }
                        }),
                        TabbedCard.TabComponent(tab: {
                            Text("Profile")
                        }, body: {
                            await H4("Profile tab (full width tabs)")
                            Div {
                                Text("Fringilla egestas nunc quis tellus diam rhoncus ultricies tristique enim at diam, sem nunc amet, pellentesque id egestas velit sed")
                            }
                        }),
                        TabbedCard.TabComponent(
                            tab: {
                                Text("Activity")
                            }, body: {
                                await H4("Activity tab (full width tabs)")
                                Div {
                                    Text("Donec ac vitae diam amet vel leo egestas consequat rhoncus in luctus amet, facilisi sit mauris accumsan nibh habitant senectus")
                                }
                            }
                        )
                    ])
                    
                    await Card(tabsFillHeader:true, tabbedSections: [
                        TabbedCard.TabComponent(tab: {
                            Text("Home")
                        }, body: {
                            await H4("Home tab")
                            Div {
                                Text("Cursus turpis vestibulum, dui in pharetra vulputate id sed non turpis ultricies fringilla at sed facilisis lacus pellentesque purus nibh")
                            }
                        }),
                        TabbedCard.TabComponent(tab: {
                            Text("Profile")
                        }, body: {
                            await H4("Profile tab")
                            Div {
                                Text("Fringilla egestas nunc quis tellus diam rhoncus ultricies tristique enim at diam, sem nunc amet, pellentesque id egestas velit sed")
                            }
                        }),
                        TabbedCard.TabComponent(
                            tab: {
                                Text("Disabled")
                            }, body: {
                                EmptyComponent()
                            }
                        )
                    ])
                }
                
                await CardHStack {
                    await Card(
                        size: .large(.num(4)),
                        tabsFillHeader: true,
                        tabbedSections: [
                            TabbedCard.TabComponent(tab: {
                                IconLabel(icon: .home, text: "Home")
                            }, body: {
                                await H4("Home tab")
                                Div {
                                    Text("Cursus turpis vestibulum, dui in pharetra vulputate id sed non turpis ultricies fringilla at sed facilisis lacus pellentesque purus nibh")
                                }
                            }),
                            TabbedCard.TabComponent(tab: {
                                IconLabel(icon: .user, text: "Profile")
                            }, body: {
                                await H4("Profile tab")
                                Div {
                                    Text("Fringilla egestas nunc quis tellus diam rhoncus ultricies tristique enim at diam, sem nunc amet, pellentesque id egestas velit sed")
                                }
                            }),
                            TabbedCard.TabComponent(
                                tab: {
                                    IconLabel(icon: .activity, text: "Activity")
                                }, body: {
                                    await H4("Activity tab")
                                    Div {
                                        Text("Donec ac vitae diam amet vel leo egestas consequat rhoncus in luctus amet, facilisi sit mauris accumsan nibh habitant senectus")
                                    }
                                }
                            )
                        ]
                    )
                    
                    await Card(tabbedSections: [
                        TabbedCard.TabComponent(
                            tab: {
                                await Badge(shape: .pill, color: .orange) {
                                    IconLabel(icon: .home, text: "Home")
                                }
                            }, body: {
                                await H4("Home Pill Badge")
                                Div {
                                    Text("Cursus turpis vestibulum, dui in pharetra vulputate id sed non turpis ultricies fringilla at sed facilisis lacus pellentesque purus nibh")
                                }
                            }
                        ),
                        TabbedCard.TabComponent(
                            tab: {
                                await Badge(fill: .light, color: .orange) {
                                    IconLabel(icon: .user, text: "Profile")
                                }
                            }, body: {
                                await H4("Profile Light Badge")
                                Div {
                                    Text("Fringilla egestas nunc quis tellus diam rhoncus ultricies tristique enim at diam, sem nunc amet, pellentesque id egestas velit sed")
                                }
                            }
                        ),
                        TabbedCard.TabComponent(
                            tab: {
                                await Badge(fill: .outline, color: .azure) {
                                    IconLabel(icon: .activity, text: "Activity", badge: .blinkingDot(color: .blue))
                                }
                            }, body: {
                                await H4("Activity Badge with Dot Notification")
                                Div {
                                    Text("Donec ac vitae diam amet vel leo egestas consequat rhoncus in luctus amet, facilisi sit mauris accumsan nibh habitant senectus")
                                }
                            }
                        ),
                        TabbedCard.TabComponent(
                            tab: {
                                IconLabel(icon: .heart, text: "Alerts", badge: .blinkingDot(color: .purple))
                            }, body: {
                                await H4("Activity Dot Notification")
                                Div {
                                    Text("Fringilla egestas nunc quis tellus diam rhoncus ultricies tristique enim at diam, sem nunc amet, pellentesque id egestas velit sed")
                                }
                            }
                        ),
                        TabbedCard.TabComponent(
                            tab: {
                                IconLabel(icon: .subtask, text: "Other", badge: .inlineBadge(fill: .light, label: "+2", color: .teal))
                            }, body: {
                                await H4("Other Inline Badge")
                                Div {
                                    Text("Donec ac vitae diam amet vel leo egestas consequat rhoncus in luctus amet, facilisi sit mauris accumsan nibh habitant senectus")
                                }
                            }
                        ),
                        TabbedCard.TabComponent(
                            tab: {
                                IconLabel(icon: .subtask, text: "Other", badge: .cornerPill(fill: .solid, label: "+2", color: .red))
                            }, body: {
                                await H4("Other Pill Notification")
                                Div {
                                    Text("Fringilla egestas nunc quis tellus diam rhoncus ultricies tristique enim at diam, sem nunc amet, pellentesque id egestas velit sed")
                                }
                            }
                        )
                    ])
                }
            }
        }))
    }
}
