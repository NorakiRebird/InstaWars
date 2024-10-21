//
//  profil.swift
//  instagramClone
//
//  Created by Rayann chaghla on 23/10/2024.
//
import SwiftUI
import PhotosUI

struct profileRayann: View {
    var Rayann: ProfilRayann
    @FocusState private var isbioFocused: Bool
    @State private var bio = ""
    @State private var isEditing = false
    @State private var PhotoItem: PhotosPickerItem?
    @State private var PhotoImage: Image?
    private let url = URL(string: "https://Rayann.com")!

    var body: some View {
        NavigationView {
            ZStack {
                Color.black
                    .ignoresSafeArea()

                VStack {
                    HStack {
                        ZStack {
                         
                            (PhotoImage ?? Image(Rayann.photoName))
                                .resizable()
                                .scaledToFit()
                                .frame(width: 180, height: 190)
                                .clipShape(Circle())
                                .overlay(
                                    Circle()
                                        .stroke(
                                            Color.red,
                                            style: StrokeStyle(lineWidth: 2)
                                        )
                                )

                            
                            PhotosPicker(selection: $PhotoItem, matching: .images) {
                                Image(systemName: "plus.circle.fill")
                                    .foregroundColor(.black)
                                    .font(.system(size: 25))
                                    .background(Color.red.clipShape(Circle()))
                                    .shadow(color: .red, radius: 12)
                            }
                            .offset(x: 60, y: 70)
                        }
                    }

                   
                    Text(Rayann.name)
                        .font(.title)
                        .foregroundColor(.white)

                   
                    Text("biographie :")
                        .foregroundColor(.white)
                        .padding()
                        .underline()

                    VStack(spacing: 20) {
                        if isEditing {
                            TextField("Mettez une biographie", text: $bio)
                                .focused($isbioFocused)
                                .font(.body)
                                .padding()
                                .background(Color.black.opacity(1.0))
                                .cornerRadius(10)
                                .shadow(color: .red, radius: 4)
                                .foregroundColor(.white)
                                
                                .padding(.horizontal, 20)
                                .onSubmit {
                                    isEditing = false
                                    isbioFocused = false
                                }
                        } else {
                            Text(bio.isEmpty ? "Appuyer pour ajouter une bio" : bio)
                                .font(.body)
                                .foregroundColor(.white)
                                .padding()
                                .background(Color.black.opacity(0.8))
                                .cornerRadius(10)
                                .shadow(color: .red, radius: 4)
                                .padding(.horizontal, 20)
                                .onTapGesture {
                                    isEditing = true
                                    isbioFocused = true
                                }
                        }
                    
                        
                        HStack {
                            Button(action: {
                                
                            }, label: {
                                Text("Modifier le profil")
                                
                                    .foregroundColor(.white)
                                    .padding()
                                    .background(Color.black)
                                    .cornerRadius(50)
                                    .shadow(color: .red, radius: 3)
                                  
                            })
                            
                            Button(action:  {
                               
                            }, label: {
                                Text("Partager le profil")
                                    .foregroundColor(.white)
                                    .padding()
                                    .background(Color.black)
                                    .cornerRadius(50)
                                    .shadow(color: .red, radius: 3)
                                    .padding()
                            })
                        }
                        .padding()
                    
                    Spacer()
                     
                        
                    }

                  
                    
                }
                // Fin de ma VStack !
                .navigationTitle("Profil")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button(action: {}) {
                            Image(systemName: "cart")
                                .foregroundColor(.red)
                        }
                    }
                }
            }
        }
        // Fin de ma Navigation VIew
        .onChange(of: PhotoItem) { RayannItem in
            Task {
                if let data = try? await RayannItem?.loadTransferable(type: Data.self),
                   let uiImage = UIImage(data: data) {
                    PhotoImage = Image(uiImage: uiImage) // Mise à jour de l'image
                } else {
                    print("Erreur lors du chargement de l'image")
                }
            }

        }
    }
}

#Preview {
    profileRayann(Rayann: ProfilRayann(name: "Rayann", photoName: "Rayann", bio: "", lieux: "Terre"))
}

