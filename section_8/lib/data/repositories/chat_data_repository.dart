import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rxdart/src/streams/value_stream.dart';
import 'package:rxdart/subjects.dart';
import 'package:section_8/domain/enums/chat_image_source.dart';
import 'package:section_8/domain/models/chat_message_model.dart';
import 'package:section_8/domain/repositories/auth_repository.dart';
import 'package:section_8/domain/repositories/chat_repository.dart';
import 'package:section_8/domain/service/geocoding_service.dart';
import 'package:section_8/domain/service/image_service.dart';
import 'package:section_8/domain/service/location_service.dart';

class ChatDataRepository implements ChatRepository {
  final AuthRepository _authRepository;
  final FirebaseFirestore _firestore;
  final LocationService _locationService;
  final GeocodingService _geocodingService;
  final ImageService _imageService;

  late StreamSubscription<Object>? _messageSubscription;
  BehaviorSubject<List<ChatMessageModel>> _messagesSubject =
      BehaviorSubject<List<ChatMessageModel>>.seeded([]);

  @override
  ValueStream<List<ChatMessageModel>> get messages => _messagesSubject.stream;

  CollectionReference get _chatRef =>
      _firestore.collection('chat').withConverter<ChatMessageModel>(
            fromFirestore: (snapshot, _) => ChatMessageModel.fromJson(
              snapshot.data()!,
            ),
            toFirestore: (model, _) => model.toJson(),
          );

  ChatDataRepository(
    this._authRepository,
    this._firestore,
    this._locationService,
    this._geocodingService,
    this._imageService,
  );

  @override
  Future<void> listenForMessages() async {
    final stream = _chatRef.snapshots();
    final subscription = stream.listen((snapshot) {
      final messages =
          snapshot.docs.map((doc) => doc.data()! as ChatMessageModel).toList();
      _messagesSubject.add(messages);
    });
    _messageSubscription = subscription;
  }

  @override
  Future<void> sendMessage(String message) async {
    final model = await _buildMessage(message);
    await _chatRef.add(model);
  }

  @override
  Future<void> stopListeningToMessages() async {
    _messageSubscription?.cancel();
    _messageSubscription = null;
  }

  @override
  Future<void> sendPictureMessage(String? message, String filePath) async {
    final m = await _buildMessage(message ?? '');
    final completeModel = m.copyWith(fileLocation: filePath);
    await _chatRef.add(completeModel);
  }

  Future<ChatMessageModel> _buildMessage(String message) async {
    final user = (await _authRepository.getUser())!;
    final location = await _locationService.getLocation();
    final geocodedLocation = await _geocodingService.reverseLookup(location);
    final model = ChatMessageModel(
      message: message,
      sender: user.email!,
      timestamp: DateTime.now(),
      location: location,
      geocoded: geocodedLocation,
      fileLocation: null,
    );
    return model;
  }
}
