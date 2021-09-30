import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:yuk_ngafal/data/models/event_info.dart';
import 'package:flutter/material.dart';

final CollectionReference mainCollection =
    FirebaseFirestore.instance.collection('events');
final DocumentReference documentReference = mainCollection.doc('test');

class Storage {
  Future<void> storeEventData(EventInfo eventInfo) async {
    DocumentReference documentReferencer =
        documentReference.collection('events').doc(eventInfo.id);

    Map<String, dynamic> data = eventInfo.toJson();

    await documentReferencer.set(data).whenComplete(() {
      print("Event added to the database, id: {${eventInfo.id}}");
    }).catchError((e) => print(e));
  }

  Future<void> updateEventData(EventInfo eventInfo) async {
    DocumentReference documentReferencer =
        documentReference.collection('events').doc(eventInfo.id);

    Map<String, dynamic> data = eventInfo.toJson();

    print('DATA:\n$data');

    await documentReferencer.update(data).whenComplete(() {
      print("Event updated in the database, id: {${eventInfo.id}}");
    }).catchError((e) => print(e));
  }

  Future<void> deleteEventData(EventInfo eventInfo) async {}

  Stream<QuerySnapshot> retrieveEvents() {
    Stream<QuerySnapshot> myClasses =
        documentReference.collection('events').orderBy('start').snapshots();
    return myClasses;
  }
}
