import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../models/discussion_model.dart';

class DiscussionDataSource {
  static const String discussionPath = 'Discussions';

  Future<void> createDiscussion(DiscussionModel discussionModel) async {
    await FirebaseFirestore.instance.doc('$discussionPath/${_createUniqueId()}').set(discussionModel.toMap());
  }

  String _createUniqueId() {
    return DateTime.now().microsecondsSinceEpoch.toString();
  }
}
