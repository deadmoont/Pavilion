import 'dart:convert';
import 'dart:developer';
import 'dart:ffi';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:pavilion/models/SocietyEvents.dart';
import 'package:pavilion/models/artists.dart';
import 'package:pavilion/models/events.dart';
import 'package:pavilion/models/merch.dart';

import '../models/sponsors.dart';

class APIs {
  //google user
  static List<Artists> artistsList = []; // Add a static list to hold artists
  static List<Merch> merchList = []; // Add a static list to hold artists
  static List<Events> eventsList = []; // Add a static list to hold artists
  static List<List<SocietyEve>> societyeventslist =
      []; // Add a static list to hold artists
  List<Sponsors> sponsors = [];
  List<Map<String, Map<String, Map<String, String>>>> timeline = [];
  List<String> photowall = [];

  //--------------FETCH ALL SocietyEvents Data--------------------------------------------//
  Future<List<List<SocietyEve>>> fetchSocietyDataFromFirebase() async {
    final storage = FlutterSecureStorage(); // Initialize FlutterSecureStorage
    List<String> societyList = [
      "AMS",
      "GeneticX",
      "Nirmiti",
      "Rangtarangini",
      "Virtuosi",
      "Sarasva",
      "Informal",
      "MainStage"
    ];

    List<List<SocietyEve>> societyEventsList = [];
    log("chal raha hai");

    for (String society in societyList) {
      try {
        final querySnapshot =
            await FirebaseFirestore.instance.collection(society).get();

        List<SocietyEve> fetchedEvents = [];
        for (var doc in querySnapshot.docs) {
          try {
            var jsonData = doc.data();
            log('Document Data: $jsonData');

            // Convert jsonData into SocietyEve object
            SocietyEve event = SocietyEve.fromJson(jsonData);
            fetchedEvents.add(event);
          } catch (e) {
            log('Error while parsing document: $e');
          }
        }

        societyEventsList.add(fetchedEvents);
        log('Fetched ${fetchedEvents.length} events from Firebase for society: $society.');
      } on FirebaseException catch (e) {
        log('FirebaseException: ${e.message}');
      } catch (e) {
        log('Error fetching documents: $e');
      }
    }

    // Store the fetched events in local storage
    for (int i = 0; i < societyList.length; i++) {
      String society = societyList[i];
      List<SocietyEve> events = societyEventsList[i];

      await storage.write(
        key: society,
        value: jsonEncode(events.map((event) => event.toJson()).toList()),
      );
      log('Stored ${events.length} events in local storage for society: $society.');
    }

    return societyEventsList;
  }

  static Future<void> fetchSocietyDataFirebase() async {
    final storage = FlutterSecureStorage();
    log("Checking local storage for events data...");

    List<String> societylist = [
      "AMS",
      "GeneticX",
      "Nirmiti",
      "Rangtarangini",
      "Virtuosi",
      "sarasva",
      "Informal",
      "MainStage"
    ];
    List<SocietyEve> societyevents = [];

    for (String items in societylist) {
      String? localData = await storage.read(key: items);

      try {
        final querySnapshot =
            await FirebaseFirestore.instance.collection(items).get();

        List<SocietyEve> fetchedEvents = [];
        for (var doc in querySnapshot.docs) {
          try {
            var jsonData = doc.data();
            log('Document Data: $jsonData');

            // Convert jsonData into an Artists object
            SocietyEve events = SocietyEve.fromJson(jsonData);
            fetchedEvents.add(events);
          } catch (e) {
            log('Error while parsing document: $e');
          }
        }

        // Update the artists list with fetched data
        societyevents = fetchedEvents;

        // Store the fetched data in local storage
        await storage.write(
            key: items,
            value: jsonEncode(
                societyevents.map((event) => event.toJson()).toList()));
        log('Fetched ${societyevents.length} event from Firebase and stored in local storage.');
      } on FirebaseException catch (e) {
        log('FirebaseException: ${e.message}');
      } catch (e) {
        log('Error fetching documents: $e');
      }

      societyeventslist.add(societyevents);
    }
  }

  static Future<void> fetchSocietyData() async {
    final storage = FlutterSecureStorage();
    log("Checking local storage for events data...");

    List<String> societylist = [
      "AMS",
      "GeneticX",
      "Nirmiti",
      "Rangtarangini",
      "Virtuosi",
      "sarasva",
      "Informal",
      "MainStage"
    ];
    List<SocietyEve> societyevents = [];

    for (String items in societylist) {
      String? localData = await storage.read(key: items);

      if (localData != null && localData.isNotEmpty) {
        log("Data found in local storage, populating ${items} events list...");

        try {
          // Parse local data and populate the artists list
          List<dynamic> jsonData = jsonDecode(localData);
          societyevents =
              jsonData.map((data) => SocietyEve.fromJson(data)).toList();

          log('Loaded ${societyevents.length} events from local storage.');
        } catch (e) {
          log('Error parsing local storage data: $e');
        }
      } else {
        log("No data found in local storage, fetching from Firebase...");

        try {
          final querySnapshot =
              await FirebaseFirestore.instance.collection(items).get();

          List<SocietyEve> fetchedEvents = [];
          for (var doc in querySnapshot.docs) {
            try {
              var jsonData = doc.data();
              log('Document Data: $jsonData');

              // Convert jsonData into an Artists object
              SocietyEve events = SocietyEve.fromJson(jsonData);
              fetchedEvents.add(events);
            } catch (e) {
              log('Error while parsing document: $e');
            }
          }

          // Update the artists list with fetched data
          societyevents = fetchedEvents;

          // Store the fetched data in local storage
          await storage.write(
              key: items,
              value: jsonEncode(
                  societyevents.map((event) => event.toJson()).toList()));
          log('Fetched ${societyevents.length} event from Firebase and stored in local storage.');
        } on FirebaseException catch (e) {
          log('FirebaseException: ${e.message}');
        } catch (e) {
          log('Error fetching documents: $e');
        }
      }

      societyeventslist.add(societyevents);
    }
  }

//--------------FETCH ALL Events Data--------------------------------------------//
  static Future<List<Events>> fetcheventsDataFirebase() async {
    final storage = FlutterSecureStorage();

    try {
      final querySnapshot =
          await FirebaseFirestore.instance.collection('Events').get();

      List<Events> fetchedEvents = [];
      for (var doc in querySnapshot.docs) {
        try {
          var jsonData = doc.data();
          log('Document Data: $jsonData');

          // Convert jsonData into an Events object
          Events event = Events.fromJson(jsonData);
          fetchedEvents.add(event);
        } catch (e) {
          log('Error while parsing document: $e');
        }
      }

      // Update the events list with fetched data
      eventsList = fetchedEvents;

      // Store the fetched data in local storage
      await storage.write(
        key: "events",
        value: jsonEncode(eventsList.map((event) => event.toJson()).toList()),
      );

      log('Fetched ${eventsList.length} events from Firebase and stored in local storage.');
    } on FirebaseException catch (e) {
      log('FirebaseException: ${e.message}');
    } catch (e) {
      log('Error fetching documents: $e');
    }

    return eventsList; // Return the events list at the end
  }

  // Fetch events data from local storage if available, otherwise fetch from Firebase
 
//--------------FETCH ALL Artist Data--------------------------------------------//
  static Future<void> fetchMerchData() async {
    final storage = FlutterSecureStorage();
    log("Checking local storage for merch data...");

    // Try to read data from local storage
    String? localData = await storage.read(key: "merch");

    if (localData != null && localData.isNotEmpty) {
      log("Data found in local storage, populating merch list...");

      try {
        // Parse local data and populate the artists list
        List<dynamic> jsonData = jsonDecode(localData);
        merchList = jsonData.map((data) => Merch.fromJson(data)).toList();

        log('Loaded ${merchList.length} merch from local storage.');
      } catch (e) {
        log('Error parsing local storage data: $e');
      }
    } else {
      log("No data found in local storage, fetching from Firebase...");

      try {
        final querySnapshot =
            await FirebaseFirestore.instance.collection('merch').get();

        List<Merch> fetchedMerch = [];
        for (var doc in querySnapshot.docs) {
          try {
            var jsonData = doc.data();
            log('Document Data: $jsonData');

            // Convert jsonData into an Artists object
            Merch merch = Merch.fromJson(jsonData);
            fetchedMerch.add(merch);
          } catch (e) {
            log('Error while parsing document: $e');
          }
        }

        // Update the artists list with fetched data
        merchList = fetchedMerch;

        // Store the fetched data in local storage
        await storage.write(
            key: "merch",
            value:
                jsonEncode(merchList.map((merch) => merch.toJson()).toList()));
        log('Fetched ${merchList.length} merch from Firebase and stored in local storage.');
      } on FirebaseException catch (e) {
        log('FirebaseException: ${e.message}');
      } catch (e) {
        log('Error fetching documents: $e');
      }
    }
    // return artistsList; // Return the artists list at the end
  }

//--------------FETCH ALL Artist Data--------------------------------------------//
  static Future<List<Artists>> fetchArtistDataFirebase() async {
    final storage = FlutterSecureStorage();
    List<Artists> artistsList = []; // Initialize the list of artists

    try {
      // Clear the local storage for artist data before fetching new data
      await storage.delete(key: "artist");
      log('Cleared local storage for artists.');

      final querySnapshot =
          await FirebaseFirestore.instance.collection('Artist').get();

      List<Artists> fetchedArtists = [];
      for (var doc in querySnapshot.docs) {
        try {
          var jsonData = doc.data();
          log('Document Data: $jsonData');

          // Convert jsonData into an Artists object
          Artists artist = Artists.fromJson(jsonData);
          fetchedArtists.add(artist);
        } catch (e) {
          log('Error while parsing document: $e');
        }
      }

      artistsList = fetchedArtists;

      // Store the fetched data in local storage
      await storage.write(
          key: "artist",
          value: jsonEncode(
              artistsList.map((artist) => artist.toJson()).toList()));
      log('Stored ${artistsList.length} artists in local storage.');
    } on FirebaseException catch (e) {
      log('FirebaseException: ${e.message}');
    } catch (e) {
      log('Error fetching documents: $e');
    }

    return artistsList;
  }

  static Future<List<Artists>> fetchArtistData() async {
    final storage = FlutterSecureStorage();
    log("Checking local storage for artist data...");

    // Try to read data from local storage
    String? localData = await storage.read(key: "artist");

    if (localData != null && localData.isNotEmpty) {
      log("Data found in local storage, populating artists list...");

      try {
        // Parse local data and populate the artists list
        List<dynamic> jsonData = jsonDecode(localData);
        artistsList = jsonData.map((data) => Artists.fromJson(data)).toList();

        log('Loaded ${artistsList.length} artists from local storage.');
      } catch (e) {
        log('Error parsing local storage data: $e');
      }
    } else {
      log("No data found in local storage, fetching from Firebase...");

      try {
        final querySnapshot =
            await FirebaseFirestore.instance.collection('Artist').get();

        List<Artists> fetchedArtists = [];
        for (var doc in querySnapshot.docs) {
          try {
            var jsonData = doc.data();
            log('Document Data: $jsonData');

            // Convert jsonData into an Artists object
            Artists artist = Artists.fromJson(jsonData);
            fetchedArtists.add(artist);
          } catch (e) {
            log('Error while parsing document: $e');
          }
        }

        // Update the artists list with fetched data
        artistsList = fetchedArtists;

        // Store the fetched data in local storage
        await storage.write(
            key: "artist",
            value: jsonEncode(
                artistsList.map((artist) => artist.toJson()).toList()));
        log('Fetched ${artistsList.length} artists from Firebase and stored in local storage.');
      } on FirebaseException catch (e) {
        log('FirebaseException: ${e.message}');
      } catch (e) {
        log('Error fetching documents: $e');
      }
    }
    return artistsList; // Return the artists list at the end
  }

//--------------FETCH ALL SUBJECTS DATA AND STORE IT INTO LOCAL STORAGE--------------------------------------------//
  static Future<void> fetchAllHeads() async {
    log("hello a");

    try {
      log("hello b");
      final querySnapshot = await FirebaseFirestore.instance
          .collection('Effervescence clubs')
          .get();

      for (var doc in querySnapshot.docs) {
        try {
          var jsonData = doc.data();
          log('Document Data: $jsonData');
        } catch (e) {
          log('Error while parsing document: $e');
        }
      }
    } on FirebaseException catch (e) {
      log('FirebaseException: ${e.message}');
    } catch (e) {
      log('Error fetching documents: $e');
    }
  }

// This iss the testing function
  static Future<void> test() async {
    log("hello a");

    try {
      log("hello b");
      final querySnapshot =
          await FirebaseFirestore.instance.collection('Events').get();

      for (var doc in querySnapshot.docs) {
        try {
          var jsonData = doc.data();
          log('Document Data: $jsonData');
        } catch (e) {
          log('Error while parsing document: $e');
        }
      }
    } on FirebaseException catch (e) {
      log('FirebaseException: ${e.message}');
    } catch (e) {
      log('Error fetching documents: $e');
    }
  }

  Future<List<Map<String, Map<String, Map<String, String>>>>>
      fetchTimeLine() async {
    if (timeline.length == 0) {
      List<Map<String, Map<String, Map<String, String>>>> timelineList = [];

      try {
        // Fetch the document snapshot from Firestore
        DocumentSnapshot<Map<String, dynamic>> snapshot =
            await FirebaseFirestore.instance
                .collection("Days")
                .doc("events")
                .get();

        if (snapshot.exists) {
          Map<String, dynamic> data = snapshot.data()!;

          // Convert map entries to a list and sort by key
          var sortedEntries = data.entries.toList()
            ..sort((a, b) => a.key.compareTo(b.key));

          // Iterating through sorted days (e.g., "day0", "day1")
          for (var entry in sortedEntries) {
            String dayKey = entry.key;
            Map<String, dynamic> dayValue = entry.value;

            // Prepare a map for events on that day
            Map<String, Map<String, String>> events = {};

            // Iterating through each event in the day
            dayValue.forEach((eventKey, eventValue) {
              if (eventValue is Map<String, dynamic>) {
                // Convert inner event map to Map<String, String>
                Map<String, String> eventDetails = eventValue
                    .map((key, value) => MapEntry(key, value.toString()));

                // Add event to the day's events map
                events[eventKey] = eventDetails;
              }
            });

            // Add day with its events to the timeline
            timelineList.add({dayKey: events});
          }
        }
      } catch (e) {
        log("Error in getting timeline: $e");
      }

      return timelineList;
    } else {
      return timeline;
    }
  }

  Future<List<Sponsors>> fetchSponsors() async {
    if (sponsors.length == 0) {
      List<Sponsors> sponsorsList = [];
      try {
        QuerySnapshot snapshot =
            await FirebaseFirestore.instance.collection("sponsor").get();

        sponsorsList = snapshot.docs.map((doc) {
          return Sponsors.fromMap(doc.data() as Map<String, dynamic>);
        }).toList();

        return sponsorsList;
      } catch (e) {
        print("Failed to get sponsors: $e");
      }
      return sponsorsList;
    } else {
      return sponsors;
    }
  }

  Future<List<String>> fetchPhotoWall() async {
    log("Checking local storage for photo wall data...");
    final storage = FlutterSecureStorage();

    // Try to read data from local storage
    String? localData = await storage.read(key: "photowall");

    if (localData != null && localData.isNotEmpty) {
      log("Data found in local storage, populating photo wall...");

      try {
        // Parse local data and populate the photowall list
        List<dynamic> jsonData = jsonDecode(localData);
        photowall =
            List<String>.from(jsonData); // Ensure the list is of type String

        log('Loaded ${photowall.length} images from local storage.');
      } catch (e) {
        log('Error parsing local storage data: $e');
      }
    } else {
      log("No data found in local storage, fetching from Firebase...");

      try {
        final querySnapshot =
            await FirebaseFirestore.instance.collection('photowall').get();

        // Extract image URLs from the documents
        List<String> fetchedImages = querySnapshot.docs.map((doc) {
          return doc['url']
              as String; // Assumes 'url' field contains the image URL
        }).toList();

        // Update the photowall list with fetched data
        photowall = fetchedImages;

        // Store the fetched data in local storage
        await storage.write(key: "photowall", value: jsonEncode(photowall));
        log('Fetched ${photowall.length} images from Firebase and stored in local storage.');
      } catch (e) {
        log('Error fetching documents: $e');
      }
    }
    return photowall; // Return the photowall list at the end
  }

  Future<List<String>> fetchPhotoWallFirebase() async {
    final storage = FlutterSecureStorage();
    try {
      final querySnapshot =
          await FirebaseFirestore.instance.collection('photowall').get();

      // Extract image URLs from the documents
      List<String> imageUrls = querySnapshot.docs.map((doc) {
        return doc['url']
            as String; // Assumes 'url' field contains the image URL
      }).toList();

      // Store the fetched data in local storage
      await storage.write(key: "photowall", value: jsonEncode(imageUrls));
      log('Fetched ${imageUrls.length} images from Firebase and stored in local storage.');

      return imageUrls;
    } catch (e) {
      log('Error fetching photo wall: $e');
      return []; // Return an empty list in case of error
    }
  }
}
