// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';

class Task {
  final String? description;
  final String? subject;
  final DateTime? date;
  final TimeOfDay? time;
  final bool? isCompleted;
  Task({
    this.description,
    this.subject,
    this.date,
    this.time,
    this.isCompleted,
  });

  Task copyWith({
    String? description,
    String? subject,
    DateTime? date,
    TimeOfDay? time,
    bool? isCompleted,
  }) {
    return Task(
      description: description ?? this.description,
      subject: subject ?? this.subject,
      date: date ?? this.date,
      time: time ?? this.time,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'description': description,
      'subject': subject,
      'date': date?.millisecondsSinceEpoch,
      'time': time,
      'isCompleted': isCompleted,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      description:
          map['description'] != null ? map['description'] as String : null,
      subject: map['subject'] != null ? map['subject'] as String : null,
      date: map['date'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['date'] as int)
          : null,
      time: map['time'],
      isCompleted:
          map['isCompleted'] != null ? map['isCompleted'] as bool : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Task.fromJson(String source) =>
      Task.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Task(description: $description, subject: $subject, date: $date, time: $time, isCompleted: $isCompleted)';
  }

  @override
  bool operator ==(covariant Task other) {
    if (identical(this, other)) return true;

    return other.description == description &&
        other.subject == subject &&
        other.date == date &&
        other.time == time &&
        other.isCompleted == isCompleted;
  }

  @override
  int get hashCode {
    return description.hashCode ^
        subject.hashCode ^
        date.hashCode ^
        time.hashCode ^
        isCompleted.hashCode;
  }
}
