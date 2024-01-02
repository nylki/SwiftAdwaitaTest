// The Swift Programming Language
// https://docs.swift.org/swift-book

import Adwaita
import Foundation

@main
struct AdwaitaTemplate: App {

    let id = "io.github.nylki.SwiftAdwaitaTest"
    var app: GTUIApp!

		@State var selected = ""

		@State var items: [String] = []

    var scene: Scene {
		Window(id: "main") { window in

		VStack {	
			Button("Append Random") {
				let newItem = "abc \(Int.random(in: 1...10000))"
				items.append(newItem)
			}

			if !items.isEmpty {
				List(items, selection: $selected) { item in
					HStack {
						Text(item)
							.hexpand()
						
						HStack {
							Button("random") {
								if let idx = items.firstIndex(of: item) {
									items[idx] = "rand \(Int.random(in: 0...1000))"
								}	
							}
							Button(icon: .default(icon: .userTrash)){
								items.removeAll { $0 == item }
							}
							.style("destructive-action")
						}
						.style("linked")						
          }
					.transition(.slideLeftRight)
          .padding()
				}
				.valign(.center)
        .style("boxed-list")
        .padding()
			}

			if !selected.isEmpty {
				Text("selected: \(selected)")
					.style("heading")
			}
		}


		.padding()
		.topToolbar {
			ToolbarView(app: app, window: window)
		}
		.onAppear {
			window.setDefaultSize(width: 450, height: 300)
		}
	}
    }
}
extension String: Identifiable {
	public var id: Self { self }
}