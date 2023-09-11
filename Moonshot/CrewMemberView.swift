//
//  CrewMemberView.swift
//  Moonshot
//
//  Created by Maria Sandu on 11.09.2023.
//

import SwiftUI

struct CrewMember {
    let role: String
    let astronaut: Astronaut
}

struct CrewMemberView: View {
    let crewMember: [CrewMember]
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(crewMember, id: \.role) { crewMember in
                    NavigationLink {
                        AstronautView(astronaut: crewMember.astronaut)
                    } label: {
                        VStack {
                            Image(crewMember.astronaut.id)
                                .resizable()
                                .frame(width: 104, height: 72)
                                .clipShape(Capsule())
                                .overlay(
                                    Capsule()
                                        .strokeBorder(.white, lineWidth: 1)
                                )
                            
                            VStack(alignment: .leading) {
                                Text(crewMember.astronaut.name)
                                    .foregroundColor(.white)
                                    .font(.headline)
                                Text(crewMember.role)
                                    .foregroundColor(.secondary)
                            }
                        }
                        .padding(.horizontal)
                    }
                }
            }
        }
    }
}

struct CrewMemberView_Previews: PreviewProvider {
    static var previews: some View {
        let astronaut1 = Astronaut(id: "white", name: "white", description: "Some description")
        let astronaut2 = Astronaut(id: "chaffee", name: "chaffee", description: "")
        
        let crewMembers: [CrewMember] = [
            CrewMember(role: "Pilot", astronaut: astronaut1),
            CrewMember(role: "Engineer", astronaut: astronaut2)
        ]

        return CrewMemberView(crewMember: crewMembers)
    }
}
