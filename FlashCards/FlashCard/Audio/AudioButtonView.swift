//
//  AudioButtonView.swift
//  FlashCards
//
//  Created by Hojin Ryu on 20/10/21.
//

import Foundation
import SwiftUI
import CloudKit
import AVFoundation

struct AudioButtonView: View {
    
    @ObservedObject var audioRecorder: AudioRecorder = AudioRecorder()
    let auxRecord = CKRecord.init(recordType: "FlashCard")
    let auxRecord3 = CKRecord.init(recordType: "FlashCard")
    let auxRecord2 = CKRecord.init(recordType: "Deck")
    
    @State var FlashCardReferenceList = [CKRecord.Reference]()
    @State var flashCardList = [FlashCard]()
    
    @State var recordAudio: CKAsset?
    
    var body: some View {
        NavigationView{
            VStack {
                RecordingsListView(audioRecorder: audioRecorder)
                
                if audioRecorder.recording == false {
                    Button(action: { self.audioRecorder.startRecording() }) {
                        Image(systemName: "circle.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 100, height: 100)
                            .clipped()
                            .foregroundColor(.red)
                            .padding(.bottom, 40)
                    }
                } else {
                    Button(action: {
                        self.audioRecorder.stopRecording()
                        
                        guard let record = self.audioRecorder.auxRecordings?.fileURL else { return }
                        recordAudio = CKAsset.init(fileURL: record)
                    }) {
                        Image(systemName: "stop.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 100, height: 100)
                            .clipped()
                            .foregroundColor(.red)
                            .padding(.bottom, 40)
                    }
                }
                
                Button("create flashcard") {
//                    guard let auxColor1 = Color.blue.toURL() else { return }
//                    let tes = CKAsset.init(fileURL: auxColor1)
                    
                    let auxFlashCard = FlashCard.init(myrecord: auxRecord, title: "title", frontSideText: "frontText", frontSideImage: nil, backSideText: "backText", backSideImage: nil, category: "category", frontSideAudio: recordAudio, backSideAudio: nil, frontSideColor: nil, backSideColor: nil, hard: "difficult".lowercased())
                    
//                    let auxFlashCard2 = FlashCard.init(myrecord: CKRecord.init(recordType: "FlashCard"), title: "title", frontSideText: "frontText", frontSideImage: nil, backSideText: "backText", backSideImage: nil, category: "category", frontSideAudio: recordAudio, backSideAudio: nil, frontSideColor: nil, backSideColor: nil, hard: "difficult")
                    
//                    let auxFlashCard3 = FlashCard.init(myrecord: CKRecord.init(recordType: "FlashCard"), title: "title", frontSideText: "frontText", frontSideImage: nil, backSideText: "backText", backSideImage: nil, category: "category", frontSideAudio: recordAudio, backSideAudio: nil, frontSideColor: nil, backSideColor: nil, hard: "difficult")
                    
                    
                    
                    
//                    CloudKitManager.shared.createFlashCard(flashCard: auxFlashCard.myrecord)
//                    CloudKitManager.shared.createFlashCard(flashCard: auxFlashCard2.myrecord)
//                    CloudKitManager.shared.createFlashCard(flashCard: auxFlashCard3.myrecord)
                    
                    FlashCardReferenceList.append(CKRecord.Reference.init(record: auxFlashCard.myrecord, action: .none))
//                    FlashCardReferenceList.append(CKRecord.Reference.init(record: auxFlashCard2.myrecord, action: .none))
//                    FlashCardReferenceList.append(CKRecord.Reference.init(record: auxFlashCard3.myrecord, action: .none))
                    
                    
                }
                Button("create deck1") {
                    
                    let auxDeck = Deck.init(myrecord: CKRecord.init(recordType: "Deck"), flashcards: FlashCardReferenceList, title: "22222", category: "deck category", reminderDate: Date(), lastView: Date(), hardFlashcards: 3)
                    
                    CloudKitManager.shared.createDeck(deck: auxDeck.myrecord)
                    
                    
                }
                Button("create deck2") {
                    
                    let auxDeck = Deck.init(myrecord: CKRecord.init(recordType: "Deck"), flashcards: FlashCardReferenceList, title: "ccccc", category: "deck category", reminderDate: Date(), lastView: Date(), hardFlashcards: 2)
                    
                    CloudKitManager.shared.createDeck(deck: auxDeck.myrecord)
                    
                    
                }
                Button("create deck3") {
                    
                    let auxDeck = Deck.init(myrecord: auxRecord2, flashcards: FlashCardReferenceList, title: "bbbbb", category: "deck category", reminderDate: Date(), lastView: Date(), hardFlashcards: 1)
                    
                    CloudKitManager.shared.createDeck(deck: auxDeck.myrecord)
                    
                    
                }
                Button("fetch deck flashcards") {
                    
                    CloudKitManager.shared.fetchDeckSortBy(queryWith: SortBy.hardest.getSortBy(withAscending: false)) { Result in
                        switch Result {
                        case .success(let decks):
                            print(decks)
                        default:
                            print("no flashcards")
                        }
                    }
                    
                    
                }
            }
        }
        .navigationBarTitle("Voice recorder")
        .navigationBarItems(trailing: EditButton())
    }
}

struct AudioButtonView_Previews: PreviewProvider {
    
    static var previews: some View {
        AudioButtonView()
    }
}



