//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:collector/generated/openapi/collector-api/model/item_status_enum.dart';
import 'package:collector/generated/openapi/collector-api/model/item_ownership_status_enum.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'create_item_request.g.dart';

/// Stores information about each item that can be part of a user's collection.
///
/// Properties:
/// * [title] - The title of the item (e.g., the name of the book, movie, or comic).
/// * [itemType] - The type of the item (e.g., book, movie, game, comic).
/// * [description] - A brief description or summary of the item.
/// * [locationId] - The id of the location.
/// * [isLendable] - Information about whether the user (owner) would lend the item.
/// * [ownershipStatus]
/// * [status]
@BuiltValue()
abstract class CreateItemRequest
    implements Built<CreateItemRequest, CreateItemRequestBuilder> {
  /// The title of the item (e.g., the name of the book, movie, or comic).
  @BuiltValueField(wireName: r'title')
  String get title;

  /// The type of the item (e.g., book, movie, game, comic).
  @BuiltValueField(wireName: r'itemType')
  String? get itemType;

  /// A brief description or summary of the item.
  @BuiltValueField(wireName: r'description')
  String? get description;

  /// The id of the location.
  @BuiltValueField(wireName: r'locationId')
  String? get locationId;

  /// Information about whether the user (owner) would lend the item.
  @BuiltValueField(wireName: r'isLendable')
  bool get isLendable;

  @BuiltValueField(wireName: r'ownershipStatus')
  ItemOwnershipStatusEnum get ownershipStatus;
  // enum ownershipStatusEnum {  OWNER,  BORROWER,  WISHLIST,  };

  @BuiltValueField(wireName: r'status')
  ItemStatusEnum get status;
  // enum statusEnum {  TODO,  PROCESSING,  DONE,  };

  CreateItemRequest._();

  factory CreateItemRequest([void updates(CreateItemRequestBuilder b)]) =
      _$CreateItemRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CreateItemRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CreateItemRequest> get serializer =>
      _$CreateItemRequestSerializer();
}

class _$CreateItemRequestSerializer
    implements PrimitiveSerializer<CreateItemRequest> {
  @override
  final Iterable<Type> types = const [CreateItemRequest, _$CreateItemRequest];

  @override
  final String wireName = r'CreateItemRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CreateItemRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'title';
    yield serializers.serialize(
      object.title,
      specifiedType: const FullType(String),
    );
    if (object.itemType != null) {
      yield r'itemType';
      yield serializers.serialize(
        object.itemType,
        specifiedType: const FullType(String),
      );
    }
    if (object.description != null) {
      yield r'description';
      yield serializers.serialize(
        object.description,
        specifiedType: const FullType(String),
      );
    }
    if (object.locationId != null) {
      yield r'locationId';
      yield serializers.serialize(
        object.locationId,
        specifiedType: const FullType(String),
      );
    }
    yield r'isLendable';
    yield serializers.serialize(
      object.isLendable,
      specifiedType: const FullType(bool),
    );
    yield r'ownershipStatus';
    yield serializers.serialize(
      object.ownershipStatus,
      specifiedType: const FullType(ItemOwnershipStatusEnum),
    );
    yield r'status';
    yield serializers.serialize(
      object.status,
      specifiedType: const FullType(ItemStatusEnum),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    CreateItemRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object,
            specifiedType: specifiedType)
        .toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CreateItemRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'title':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.title = valueDes;
          break;
        case r'itemType':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.itemType = valueDes;
          break;
        case r'description':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.description = valueDes;
          break;
        case r'locationId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.locationId = valueDes;
          break;
        case r'isLendable':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.isLendable = valueDes;
          break;
        case r'ownershipStatus':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ItemOwnershipStatusEnum),
          ) as ItemOwnershipStatusEnum;
          result.ownershipStatus = valueDes;
          break;
        case r'status':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ItemStatusEnum),
          ) as ItemStatusEnum;
          result.status = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  CreateItemRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CreateItemRequestBuilder();
    final serializedList = (serialized as Iterable<Object?>).toList();
    final unhandled = <Object?>[];
    _deserializeProperties(
      serializers,
      serialized,
      specifiedType: specifiedType,
      serializedList: serializedList,
      unhandled: unhandled,
      result: result,
    );
    return result.build();
  }
}
