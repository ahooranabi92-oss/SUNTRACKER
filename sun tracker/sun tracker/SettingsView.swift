import SwiftUI

struct SettingsView: View {
    var body: some View {
        
        NavigationStack {
            List {
                
                Section {
                    Button(action: {
                        
                    }) {
                        HStack {
                            Image(systemName: "creditcard")
                                .foregroundColor(.white)
                            Text("Buy Premium | Restore Purchases")
                                .foregroundColor(.white)
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundColor(.white)
                        }
                        .padding(.vertical, 8)
                    }
                    .listRowBackground(Color.gray.opacity(0.2))
                }
                
                
                Section(header: Text("Settings")) {
                    
                    SettingsRow(iconName: "clock", title: "Date and Time", detail: "24-h")
                    
                    
                    SettingsRow(iconName: "ruler", title: "Units", detail: "Metric")
                    
                    
                    SettingsRow(iconName: "globe", title: "Geographic Coordinates", detail: "DDD")
                    
                    
                    
                    SettingsRow(iconName: "eye", title: "Appearance", detail: "Automatic")
                }
                
                Section() {
                    
                    SettingsRow(iconName: "gearshape", title: "Allow to Access", detail: nil)
                    
                    
                    SettingsRow(iconName: "a.magnify", title: "Language", detail: nil)
                }
                
                
                Section(header: Text("Support")) {
                    
                    SettingsRow(iconName: "person.fill.questionmark", title: "Help & Support", detail: nil)
                    
                    
                    
                }
                .listStyle(.insetGrouped)
                .navigationTitle("Settings")        }
        }
    }
    
    struct SettingsRow: View {
        let iconName: String
        let title: String
        let detail: String?
        
        var body: some View {
            
            NavigationLink(destination: Text("\(title) ...")) {
                HStack {
                    Image(systemName: iconName)
                        .frame(width: 24, alignment: .leading)
                        .foregroundColor(.secondary)
                    
                    Text(title)
                    
                    Spacer()
                    
                    if let detail = detail {
                        Text(detail)
                            .foregroundColor(.secondary)
                    }
                }
            }
        }
    }
    
    struct SettingsView_Previews: PreviewProvider {
        static var previews: some View {
            SettingsView()
                .preferredColorScheme(.dark)
        }
    }
}
