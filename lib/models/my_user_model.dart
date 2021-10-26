import 'package:cloud_firestore/cloud_firestore.dart';

class MyUser {
  MyUser(
      {this.notifications,
      this.person,
      this.contactInformation,
      this.authentication,
      this.roles,
      this.gsuiteId,
      this.branch,
      this.graduationYear,
      this.currentYear,
      this.id,
      this.enrollmentNumber});

  final int id;
  final int enrollmentNumber;
  final String gsuiteId;
  final String branch;
  final String graduationYear;
  final String currentYear;
  final Person person;
  final ContactInformation contactInformation;
  final Authentication authentication;
  final Roles roles;
  final List<Notifications> notifications;
}

class Notifications {
  final String message;
  final String redirect;
  final bool status;

  Notifications(this.message, this.redirect, this.status);
}

class Roles {
  final bool isAdmin;
  final bool isCoreMember;
  final bool isMentor;
  final bool isMentee;

  Roles(this.isAdmin, this.isCoreMember, this.isMentor, this.isMentee);
}

class Authentication {
  final String accessToken;
  final String refreshToken;
  final Timestamp tokenExpiry;

  Authentication(this.accessToken, this.refreshToken, this.tokenExpiry);
}

class ContactInformation {
  final String contactNumber;
  final String whatsappNumber;
  final String contactEmail;

  ContactInformation(
      this.contactNumber, this.whatsappNumber, this.contactEmail);
}

class Person {
  final String shortName;
  final String fullName;
  final String state;

  Person(this.shortName, this.fullName, this.state);
}
