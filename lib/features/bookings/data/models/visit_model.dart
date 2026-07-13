import 'package:equatable/equatable.dart';

import '../../../../core/graphql/graphql_api.dart';
import '../../domain/entities/visit_entity.dart';

class VisitModel extends Equatable {
  const VisitModel({
    required this.id,
    required this.memberId,
    required this.clubId,
    required this.visitingClubId,
    required this.status,
    required this.checkedInAt,
    this.checkedOutAt,
    this.services,
    this.cost,
    this.verified = false,
    this.blockchainTxId,
    this.createdAt,
  });

  final String id;
  final String memberId;
  final String clubId;
  final String visitingClubId;
  final Enum$VisitStatus status;
  final DateTime checkedInAt;
  final DateTime? checkedOutAt;
  final List<String>? services;
  final double? cost;
  final bool verified;
  final String? blockchainTxId;
  final DateTime? createdAt;

  factory VisitModel.fromJson(Map<String, dynamic> json) {
    return VisitModel(
      id: json['id'] as String,
      memberId: (json['memberId'] as String?) ?? '',
      clubId: (json['clubId'] as String?) ?? '',
      visitingClubId: (json['visitingClubId'] as String?) ?? '',
      status: fromJson$Enum$VisitStatus(json['status'] as String? ?? 'PLANNED'),
      checkedInAt: json['checkInTime'] != null
          ? DateTime.parse(json['checkInTime'] as String)
          : DateTime.now(),
      checkedOutAt: json['checkOutTime'] != null
          ? DateTime.parse(json['checkOutTime'] as String)
          : null,
      services: (json['services'] as List<dynamic>?)
          ?.map((s) => s as String)
          .toList(),
      cost: (json['cost'] as num?)?.toDouble(),
      verified: (json['verified'] as bool?) ?? false,
      blockchainTxId: json['blockchainTxId'] as String?,
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'] as String)
          : null,
    );
  }

  VisitEntity toEntity() {
    return VisitEntity(
      id: id,
      clubId: visitingClubId,
      userId: memberId,
      status: status,
      checkedInAt: checkedInAt,
      checkedOutAt: checkedOutAt,
      blockchainTxId: blockchainTxId,
      createdAt: createdAt,
    );
  }

  @override
  List<Object?> get props => [
    id,
    memberId,
    clubId,
    visitingClubId,
    status,
    checkedInAt,
    checkedOutAt,
    services,
    cost,
    verified,
    blockchainTxId,
    createdAt,
  ];
}
