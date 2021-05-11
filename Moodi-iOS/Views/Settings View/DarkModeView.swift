//
//  DarkModeView.swift
//  Moodi-iOS
//
//  Created by Pedro Gomes Rubbo Pacheco on 11/05/21.
//

import SwiftUI

struct DarkModeView: View {
    @EnvironmentObject private var preferences: PreferencesStore
    @State private var mode: InternalColorScheme = PreferencesStore.appColorSchemeStatic
    let screenSize: CGSize

    var body: some View {
        VStack(alignment: .leading) {
            Text(NSLocalizedString("Dark Mode", comment: ""))
                .foregroundColor(Color("primaryText"))
                .font(.system(size: screenSize.height*0.025, weight: .bold))
            VStack {
                Picker(selection: $mode, label: Text("Which mode do you want to choose?")) {
                    Text("System").tag(InternalColorScheme.auto)
                    Text("Dark Mode").tag(InternalColorScheme.dark)
                    Text("Light Mode").tag(InternalColorScheme.light)
                }
                .pickerStyle(SegmentedPickerStyle())
                .onChange(of: mode, perform: { value in
                    preferences.updateStoredColorScheme(colorScheme: value)
                })
            }
            .padding()
            .frame(width: screenSize.width * 0.9, height: screenSize.height * 0.14, alignment: .center)
            .asCard()
        }
    }
}

struct DarkModeView_Previews: PreviewProvider {
    @StateObject static private var preferences: PreferencesStore = PreferencesStore()
    static var previews: some View {
        DarkModeView(screenSize: UIScreen.main.bounds.size)
            .environmentObject(preferences)
    }
}
