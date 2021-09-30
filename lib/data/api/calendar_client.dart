import 'package:googleapis/calendar/v3.dart';

class CalendarClient {
  static CalendarApi? calendar;

  Future<Map<String, String>> insert({
    required String title,
    required String description,
    required String location,
    required List<EventAttendee> attendeeEmailList,
    required bool shouldNotifyAttendees,
    required bool hasConferenceSupport,
    required DateTime startTime,
    required DateTime endTime,
  }) async {
    Map<String, String> eventData = {};

    Event event = Event();
    String calendarId = "primary";

    event.summary = title;
    event.description = description;
    event.attendees = attendeeEmailList;
    event.location = location;

    EventDateTime start = EventDateTime();
    start.dateTime = startTime;
    start.timeZone = "GMT+07.00";
    event.start = start;

    EventDateTime end = EventDateTime();
    end.dateTime = endTime;
    end.timeZone = "GMT+07.00";
    event.end = end;

    ConferenceData conferenceData = ConferenceData();
    CreateConferenceRequest conferenceRequest = CreateConferenceRequest();

    conferenceRequest.requestId =
        "${startTime.millisecondsSinceEpoch - endTime.millisecondsSinceEpoch}";
    conferenceData.createRequest;
    event.conferenceData = conferenceData;

    try {
      await calendar!.events
          .insert(event, calendarId,
              conferenceDataVersion: hasConferenceSupport ? 1 : 0,
              sendUpdates: shouldNotifyAttendees ? "all" : "none")
          .then((value) {
        print('Event status: ${value.status}');
        if (value.status == "confirmed") {
          String joinLink = '';
          String eventId;

          eventId = value.id!;

          if (hasConferenceSupport) {
            joinLink =
                "https://meet.google.com/${value.conferenceData!.conferenceId}";
          }

          eventData = {
            'id': eventId,
            'link': joinLink,
          };

          print('Event added to Google Calendar');
        } else {
          print('Unable to add event to Google Calendar');
        }
      });
    } catch (e) {
      print('Error creating event');
    }
    return eventData;
  }

  Future<Map<String, String>> modify({
    required String id,
    required String title,
    required String description,
    required String location,
    required List<EventAttendee> attendeeEmailList,
    required bool shouldNotifyAttendees,
    required bool hasConferenceSupport,
    required DateTime startTime,
    required DateTime endTime,
  }) async {
    Map<String, String> eventData = {};
    String calendarId = "primary";

    Event event = Event();
    event.summary = title;
    event.description = description;
    event.location = location;
    event.attendees = attendeeEmailList;

    EventDateTime start = EventDateTime();
    start.dateTime = startTime;
    start.timeZone = "GMT+07:00";
    event.start = start;

    EventDateTime end = EventDateTime();
    start.dateTime = endTime;
    start.timeZone = "GMT+07:00";
    event.end = end;

    try {
      await calendar!.events
          .patch(event, calendarId, id,
              conferenceDataVersion: hasConferenceSupport ? 1 : 0,
              sendUpdates: shouldNotifyAttendees ? "all" : "none")
          .then((value) {
        print('Event status ${value.status}');
        if (value.status == "confirmed") {
          String joiningLink = '';
          String eventId = '';

          eventId = value.id!;
          if (hasConferenceSupport) {
            joiningLink =
                "https://meet.google.com/${value.conferenceData!.conferenceId}";
          }
          eventData = {'id': eventId, 'link': joiningLink};
          print('Event updated in Google Calendar');
        } else {
          print('Unable to update event in Google Calendar');
        }
      });
    } catch (e) {
      print('Error while updating an event $e');
    }

    return eventData;
  }

  Future<void> delete(String eventId, bool shouldNotify) async {
    String calendarId = "primary";

    try {
      await calendar!.events
          .delete(calendarId, eventId,
              sendUpdates: shouldNotify ? "all" : "none")
          .then((value) {
        print('Event deleted from Google Calendar');
      });
    } catch (e) {
      print('Error deleting event: $e');
    }
  }
}
