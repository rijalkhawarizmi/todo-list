// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:todo_list/src/home/domain/entities/tasks_entity.dart';

class TasksModel extends TasksEntity {
  TasksModel({
    super.id,
    super.title,
    super.description,
    super.recordType,
    super.type,
    super.priority,
    super.impactLevel,
    super.ticketNumber,
    super.meetingLocation,
    super.parentId,
    super.recordStatus,
    super.recordOrdering,
    super.createdBy,
    super.createdAt,
    super.updatedAt,
    super.startDate,
    super.dueDate,
    super.timeline,
    super.isOverdue,
    super.isPending,
    super.isRejected,
    super.isUnscheduled,
    super.deadline,
    super.progress,
    super.recurrence,
    super.project,
    super.taskStatus,
    super.board,
    super.score,
    super.assignments,
    super.thumbnail,
    super.attachments,
    super.draftFiles,
    super.signedFiles,
    super.quotationFiles,
    super.analysisFiles,
    super.children,
    super.childrenCount,
  });

  TasksModel copyWith({
    int? id,
    String? title,
    String? description,
    String? recordType,
    String? type,
    dynamic? priority,
    dynamic? impactLevel,
    dynamic? ticketNumber,
    dynamic? meetingLocation,
    dynamic? parentId,
    String? recordStatus,
    int? recordOrdering,
    int? createdBy,
    String? createdAt,
    String? updatedAt,
    String? startDate,
    String? dueDate,
    String? timeline,
    bool? isOverdue,
    bool? isPending,
    bool? isRejected,
    bool? isUnscheduled,
    String? deadline,
    int? progress,
    String? recurrence,
    dynamic? project,
    List<dynamic>? taskStatus,
    Board? board,
    int? score,
    List<Assignment>? assignments,
    dynamic? thumbnail,
    List<dynamic>? attachments,
    List<dynamic>? draftFiles,
    List<dynamic>? signedFiles,
    List<dynamic>? quotationFiles,
    List<dynamic>? analysisFiles,
    List<Child>? children,
    int? childrenCount,
  }) {
    return TasksModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      recordType: recordType ?? this.recordType,
      type: type ?? this.type,
      priority: priority ?? this.priority,
      impactLevel: impactLevel ?? this.impactLevel,
      ticketNumber: ticketNumber ?? this.ticketNumber,
      meetingLocation: meetingLocation ?? this.meetingLocation,
      parentId: parentId ?? this.parentId,
      recordStatus: recordStatus ?? this.recordStatus,
      recordOrdering: recordOrdering ?? this.recordOrdering,
      createdBy: createdBy ?? this.createdBy,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      startDate: startDate ?? this.startDate,
      dueDate: dueDate ?? this.dueDate,
      timeline: timeline ?? this.timeline,
      isOverdue: isOverdue ?? this.isOverdue,
      isPending: isPending ?? this.isPending,
      isRejected: isRejected ?? this.isRejected,
      isUnscheduled: isUnscheduled ?? this.isUnscheduled,
      deadline: deadline ?? this.deadline,
      progress: progress ?? this.progress,
      recurrence: recurrence ?? this.recurrence,
      project: project ?? this.project,
      taskStatus: taskStatus ?? this.taskStatus,
      board: board ?? this.board,
      score: score ?? this.score,
      assignments: assignments ?? this.assignments,
      thumbnail: thumbnail ?? this.thumbnail,
      attachments: attachments ?? this.attachments,
      draftFiles: draftFiles ?? this.draftFiles,
      signedFiles: signedFiles ?? this.signedFiles,
      quotationFiles: quotationFiles ?? this.quotationFiles,
      analysisFiles: analysisFiles ?? this.analysisFiles,
      children: children ?? this.children,
      childrenCount: childrenCount ?? this.childrenCount,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
      'recordType': recordType,
      'type': type,
      'priority': priority,
      'impactLevel': impactLevel,
      'ticketNumber': ticketNumber,
      'meetingLocation': meetingLocation,
      'parentId': parentId,
      'recordStatus': recordStatus,
      'recordOrdering': recordOrdering,
      'createdBy': createdBy,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'startDate': startDate,
      'dueDate': dueDate,
      'timeline': timeline,
      'isOverdue': isOverdue,
      'isPending': isPending,
      'isRejected': isRejected,
      'isUnscheduled': isUnscheduled,
      'deadline': deadline,
      'progress': progress,
      'recurrence': recurrence,
      'project': project,
      'taskStatus': taskStatus,
      'board': board,
      'score': score,
      'assignments': assignments,
      'thumbnail': thumbnail,
      'attachments': attachments,
      'draftFiles': draftFiles,
      'signedFiles': signedFiles,
      'quotationFiles': quotationFiles,
      'analysisFiles': analysisFiles,
      'children': children,
      'childrenCount': childrenCount,
    };
  }

  factory TasksModel.fromMap(Map<String, dynamic> map) {
    return TasksModel(
      id: map['id'] != null ? map['id'] as int : null,
      title: map['title'] != null ? map['title'] as String : null,
      description:
          map['description'] != null ? map['description'] as String : null,
      recordType:
          map['recordType'] != null ? map['recordType'] as String : null,
      type: map['type'] != null ? map['type'] as String : null,
      priority: map['priority'] as dynamic,
      impactLevel: map['impactLevel'] as dynamic,
      ticketNumber: map['ticketNumber'] as dynamic,
      meetingLocation: map['meetingLocation'] as dynamic,
      parentId: map['parentId'] as dynamic,
      recordStatus:
          map['recordStatus'] != null ? map['recordStatus'] as String : null,
      recordOrdering:
          map['recordOrdering'] != null ? map['recordOrdering'] as int : null,
      createdBy: map['createdBy'] != null ? map['createdBy'] as int : null,
      createdAt: map['createdAt'] != null
          ? map['createdAt'] as String
          : null,
      updatedAt: map['updatedAt'] != null
          ? map['updatedAt'] as String
          : null,
      startDate: map['startDate'] != null ? map['startDate'] as String : null,
      dueDate: map['dueDate'] != null ? map['dueDate'] as String : null,
      timeline: map['timeline'] != null ? map['timeline'] as String : null,
      isOverdue: map['isOverdue'] != null ? map['isOverdue'] as bool : null,
      isPending: map['isPending'] != null ? map['isPending'] as bool : null,
      isRejected: map['isRejected'] != null ? map['isRejected'] as bool : null,
      isUnscheduled:
          map['isUnscheduled'] != null ? map['isUnscheduled'] as bool : null,
      deadline: map['deadline'] != null ? map['deadline'] as String : null,
      progress: map['progress'] != null ? map['progress'] as int : null,
      recurrence:
          map['recurrence'] != null ? map['recurrence'] as String : null,
      project: map['project'] as dynamic,
      taskStatus: map['taskStatus'] != null
          ? List<dynamic>.from((map['taskStatus'] as List<dynamic>))
          : null,
      board: map['board'] != null
          ? Board.fromMap(map['board'] as Map<String, dynamic>)
          : null,
      score: map['score'] != null ? map['score'] as int : null,
      assignments: map['assignments'] != null
          ? List<Assignment>.from(
              (map['assignments'] as List<dynamic>).map<Assignment?>(
                (x) => Assignment.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      thumbnail: map['thumbnail'] as dynamic,
      attachments: map['attachments'] != null
          ? List<dynamic>.from((map['attachments'] as List<dynamic>))
          : null,
      draftFiles: map['draftFiles'] != null
          ? List<dynamic>.from((map['draftFiles'] as List<dynamic>))
          : null,
      signedFiles: map['signedFiles'] != null
          ? List<dynamic>.from((map['signedFiles'] as List<dynamic>))
          : null,
      quotationFiles: map['quotationFiles'] != null
          ? List<dynamic>.from((map['quotationFiles'] as List<dynamic>))
          : null,
      analysisFiles: map['analysisFiles'] != null
          ? List<dynamic>.from((map['analysisFiles'] as List<dynamic>))
          : null,
      children: map['children'] != null
          ? List<Child>.from(
              (map['children'] as List<dynamic>).map<Child?>(
                (x) => Child.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      childrenCount:
          map['childrenCount'] != null ? map['childrenCount'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory TasksModel.fromJson(String source) =>
      TasksModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'TasksModel(id: $id, title: $title, description: $description, recordType: $recordType, type: $type, priority: $priority, impactLevel: $impactLevel, ticketNumber: $ticketNumber, meetingLocation: $meetingLocation, parentId: $parentId, recordStatus: $recordStatus, recordOrdering: $recordOrdering, createdBy: $createdBy, createdAt: $createdAt, updatedAt: $updatedAt, startDate: $startDate, dueDate: $dueDate, timeline: $timeline, isOverdue: $isOverdue, isPending: $isPending, isRejected: $isRejected, isUnscheduled: $isUnscheduled, deadline: $deadline, progress: $progress, recurrence: $recurrence, project: $project, taskStatus: $taskStatus, board: $board, score: $score, assignments: $assignments, thumbnail: $thumbnail, attachments: $attachments, draftFiles: $draftFiles, signedFiles: $signedFiles, quotationFiles: $quotationFiles, analysisFiles: $analysisFiles, children: $children, childrenCount: $childrenCount)';
  }

  @override
  bool operator ==(covariant TasksModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.description == description &&
        other.recordType == recordType &&
        other.type == type &&
        other.priority == priority &&
        other.impactLevel == impactLevel &&
        other.ticketNumber == ticketNumber &&
        other.meetingLocation == meetingLocation &&
        other.parentId == parentId &&
        other.recordStatus == recordStatus &&
        other.recordOrdering == recordOrdering &&
        other.createdBy == createdBy &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        other.startDate == startDate &&
        other.dueDate == dueDate &&
        other.timeline == timeline &&
        other.isOverdue == isOverdue &&
        other.isPending == isPending &&
        other.isRejected == isRejected &&
        other.isUnscheduled == isUnscheduled &&
        other.deadline == deadline &&
        other.progress == progress &&
        other.recurrence == recurrence &&
        other.project == project &&
        listEquals(other.taskStatus, taskStatus) &&
        other.board == board &&
        other.score == score &&
        listEquals(other.assignments, assignments) &&
        other.thumbnail == thumbnail &&
        listEquals(other.attachments, attachments) &&
        listEquals(other.draftFiles, draftFiles) &&
        listEquals(other.signedFiles, signedFiles) &&
        listEquals(other.quotationFiles, quotationFiles) &&
        listEquals(other.analysisFiles, analysisFiles) &&
        listEquals(other.children, children) &&
        other.childrenCount == childrenCount;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        description.hashCode ^
        recordType.hashCode ^
        type.hashCode ^
        priority.hashCode ^
        impactLevel.hashCode ^
        ticketNumber.hashCode ^
        meetingLocation.hashCode ^
        parentId.hashCode ^
        recordStatus.hashCode ^
        recordOrdering.hashCode ^
        createdBy.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode ^
        startDate.hashCode ^
        dueDate.hashCode ^
        timeline.hashCode ^
        isOverdue.hashCode ^
        isPending.hashCode ^
        isRejected.hashCode ^
        isUnscheduled.hashCode ^
        deadline.hashCode ^
        progress.hashCode ^
        recurrence.hashCode ^
        project.hashCode ^
        taskStatus.hashCode ^
        board.hashCode ^
        score.hashCode ^
        assignments.hashCode ^
        thumbnail.hashCode ^
        attachments.hashCode ^
        draftFiles.hashCode ^
        signedFiles.hashCode ^
        quotationFiles.hashCode ^
        analysisFiles.hashCode ^
        children.hashCode ^
        childrenCount.hashCode;
  }
}

class Assignment extends AssignmentEntity {
  Assignment({
    super.id,
    super.userId,
    super.fullName,
    super.company,
    super.role,
    super.avatar,
    super.initial,
  });

  Assignment copyWith({
    int? id,
    int? userId,
    String? fullName,
    String? company,
    String? role,
    String? avatar,
    String? initial,
  }) {
    return Assignment(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      fullName: fullName ?? this.fullName,
      company: company ?? this.company,
      role: role ?? this.role,
      avatar: avatar ?? this.avatar,
      initial: initial ?? this.initial,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'userId': userId,
      'fullName': fullName,
      'company': company,
      'role': role,
      'avatar': avatar,
      'initial': initial,
    };
  }

  factory Assignment.fromMap(Map<String, dynamic> map) {
    return Assignment(
      id: map['id'] != null ? map['id'] as int : null,
      userId: map['user_id'] != null ? map['user_id'] as int : null,
      fullName: map['full_name'] != null ? map['full_name'] as String : null,
      company: map['company'] != null ? map['company'] as String : null,
      role: map['role'] != null ? map['role'] as String : null,
      avatar: map['avatar'] != null ? map['avatar'] as String : null,
      initial: map['initial'] != null ? map['initial'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Assignment.fromJson(String source) =>
      Assignment.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Assignment(id: $id, userId: $userId, fullName: $fullName, company: $company, role: $role, avatar: $avatar, initial: $initial)';
  }

  @override
  bool operator ==(covariant Assignment other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.userId == userId &&
        other.fullName == fullName &&
        other.company == company &&
        other.role == role &&
        other.avatar == avatar &&
        other.initial == initial;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        userId.hashCode ^
        fullName.hashCode ^
        company.hashCode ^
        role.hashCode ^
        avatar.hashCode ^
        initial.hashCode;
  }
}

class Board extends BoardEntity {
  Board({
    super.id,
    super.name,
    super.code,
    super.slug,
    super.description,
    super.value,
    super.metadata,
    super.recordStatus,
    super.recordLeft,
    super.recordRight,
    super.recordOrdering,
    super.parentId,
    super.createdBy,
    super.updatedBy,
    super.deletedBy,
    super.createdAt,
    super.updatedAt,
    super.deletedAt,
    super.workspaceId,
    super.pivot,
    super.taskId,
    super.content,
  });

  Board copyWith({
    int? id,
    String? name,
    String? code,
    String? slug,
    String? description,
    String? value,
    Metadata? metadata,
    String? recordStatus,
    int? recordLeft,
    int? recordRight,
    int? recordOrdering,
    int? parentId,
    int? createdBy,
    int? updatedBy,
    dynamic? deletedBy,
    String? createdAt,
    String? updatedAt,
    dynamic? deletedAt,
    int? workspaceId,
    Pivot? pivot,
    int? taskId,
    String? content,
  }) {
    return Board(
      id: id ?? this.id,
      name: name ?? this.name,
      code: code ?? this.code,
      slug: slug ?? this.slug,
      description: description ?? this.description,
      value: value ?? this.value,
      metadata: metadata ?? this.metadata,
      recordStatus: recordStatus ?? this.recordStatus,
      recordLeft: recordLeft ?? this.recordLeft,
      recordRight: recordRight ?? this.recordRight,
      recordOrdering: recordOrdering ?? this.recordOrdering,
      parentId: parentId ?? this.parentId,
      createdBy: createdBy ?? this.createdBy,
      updatedBy: updatedBy ?? this.updatedBy,
      deletedBy: deletedBy ?? this.deletedBy,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      workspaceId: workspaceId ?? this.workspaceId,
      pivot: pivot ?? this.pivot,
      taskId: taskId ?? this.taskId,
      content: content ?? this.content,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'code': code,
      'slug': slug,
      'description': description,
      'value': value,
      'metadata': metadata,
      'recordStatus': recordStatus,
      'recordLeft': recordLeft,
      'recordRight': recordRight,
      'recordOrdering': recordOrdering,
      'parentId': parentId,
      'createdBy': createdBy,
      'updatedBy': updatedBy,
      'deletedBy': deletedBy,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'deletedAt': deletedAt,
      'workspaceId': workspaceId,
      'pivot': pivot,
      'taskId': taskId,
      'content': content,
    };
  }

  factory Board.fromMap(Map<String, dynamic> map) {
    return Board(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      code: map['code'] != null ? map['code'] as String : null,
      slug: map['slug'] != null ? map['slug'] as String : null,
      description:
          map['description'] != null ? map['description'] as String : null,
      value: map['value'] != null ? map['value'] as String : null,
      metadata: map['metadata'] != null
          ? Metadata.fromMap(map['metadata'] as Map<String, dynamic>)
          : null,
      recordStatus:
          map['recordStatus'] != null ? map['recordStatus'] as String : null,
      recordLeft: map['recordLeft'] != null ? map['recordLeft'] as int : null,
      recordRight:
          map['recordRight'] != null ? map['recordRight'] as int : null,
      recordOrdering:
          map['recordOrdering'] != null ? map['recordOrdering'] as int : null,
      parentId: map['parentId'] != null ? map['parentId'] as int : null,
      createdBy: map['createdBy'] != null ? map['createdBy'] as int : null,
      updatedBy: map['updatedBy'] != null ? map['updatedBy'] as int : null,
      deletedBy: map['deletedBy'] as dynamic,
      createdAt: map['createdAt'] != null
          ? map['createdAt'] as String
          : null,
      updatedAt: map['updatedAt'] != null
          ? map['updatedAt'] as String
          : null,
      deletedAt: map['deletedAt'] as dynamic,
      workspaceId:
          map['workspaceId'] != null ? map['workspaceId'] as int : null,
      pivot: map['pivot'] != null
          ? Pivot.fromMap(map['pivot'] as Map<String, dynamic>)
          : null,
      taskId: map['taskId'] != null ? map['taskId'] as int : null,
      content: map['content'] != null ? map['content'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Board.fromJson(String source) =>
      Board.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Board(id: $id, name: $name, code: $code, slug: $slug, description: $description, value: $value, metadata: $metadata, recordStatus: $recordStatus, recordLeft: $recordLeft, recordRight: $recordRight, recordOrdering: $recordOrdering, parentId: $parentId, createdBy: $createdBy, updatedBy: $updatedBy, deletedBy: $deletedBy, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt, workspaceId: $workspaceId, pivot: $pivot, taskId: $taskId, content: $content)';
  }

  @override
  bool operator ==(covariant Board other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.code == code &&
        other.slug == slug &&
        other.description == description &&
        other.value == value &&
        other.metadata == metadata &&
        other.recordStatus == recordStatus &&
        other.recordLeft == recordLeft &&
        other.recordRight == recordRight &&
        other.recordOrdering == recordOrdering &&
        other.parentId == parentId &&
        other.createdBy == createdBy &&
        other.updatedBy == updatedBy &&
        other.deletedBy == deletedBy &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        other.deletedAt == deletedAt &&
        other.workspaceId == workspaceId &&
        other.pivot == pivot &&
        other.taskId == taskId &&
        other.content == content;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        code.hashCode ^
        slug.hashCode ^
        description.hashCode ^
        value.hashCode ^
        metadata.hashCode ^
        recordStatus.hashCode ^
        recordLeft.hashCode ^
        recordRight.hashCode ^
        recordOrdering.hashCode ^
        parentId.hashCode ^
        createdBy.hashCode ^
        updatedBy.hashCode ^
        deletedBy.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode ^
        deletedAt.hashCode ^
        workspaceId.hashCode ^
        pivot.hashCode ^
        taskId.hashCode ^
        content.hashCode;
  }
}

class Metadata extends MetadataEntity {
  Metadata({
    super.bg,
    super.font,
  });

  Metadata copyWith({
    String? bg,
    String? font,
  }) {
    return Metadata(
      bg: bg ?? this.bg,
      font: font ?? this.font,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'bg': bg,
      'font': font,
    };
  }

  factory Metadata.fromMap(Map<String, dynamic> map) {
    return Metadata(
      bg: map['bg'] != null ? map['bg'] as String : null,
      font: map['font'] != null ? map['font'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Metadata.fromJson(String source) =>
      Metadata.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Metadata(bg: $bg, font: $font)';

  @override
  bool operator ==(covariant Metadata other) {
    if (identical(this, other)) return true;

    return other.bg == bg && other.font == font;
  }

  @override
  int get hashCode => bg.hashCode ^ font.hashCode;
}

class Pivot extends PivotEntity {
  Pivot({
    super.pivotableType,
    super.pivotableId,
    super.entityId,
    super.role,
    super.timestamp,
    super.metadata,
  });

  Pivot copyWith({
    String? pivotableType,
    int? pivotableId,
    int? entityId,
    String? role,
    String? timestamp,
    String? metadata,
  }) {
    return Pivot(
      pivotableType: pivotableType ?? this.pivotableType,
      pivotableId: pivotableId ?? this.pivotableId,
      entityId: entityId ?? this.entityId,
      role: role ?? this.role,
      timestamp: timestamp ?? this.timestamp,
      metadata: metadata ?? this.metadata,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'pivotableType': pivotableType,
      'pivotableId': pivotableId,
      'entityId': entityId,
      'role': role,
      'timestamp': timestamp,
      'metadata': metadata,
    };
  }

  factory Pivot.fromMap(Map<String, dynamic> map) {
    return Pivot(
      pivotableType:
          map['pivotableType'] != null ? map['pivotable_type'] as String : null,
      pivotableId:
          map['pivotable_id'] != null ? map['pivotable_id'] as int : null,
      entityId: map['entity_id'] != null ? map['entity_id'] as int : null,
      role: map['role'] != null ? map['role'] as String : null,
      timestamp: map['timestamp'] != null ? map['timestamp'] as String : null,
      metadata: map['metadata'] != null ? map['metadata'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Pivot.fromJson(String source) =>
      Pivot.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Pivot(pivotableType: $pivotableType, pivotableId: $pivotableId, entityId: $entityId, role: $role, timestamp: $timestamp, metadata: $metadata)';
  }

  @override
  bool operator ==(covariant Pivot other) {
    if (identical(this, other)) return true;

    return other.pivotableType == pivotableType &&
        other.pivotableId == pivotableId &&
        other.entityId == entityId &&
        other.role == role &&
        other.timestamp == timestamp &&
        other.metadata == metadata;
  }

  @override
  int get hashCode {
    return pivotableType.hashCode ^
        pivotableId.hashCode ^
        entityId.hashCode ^
        role.hashCode ^
        timestamp.hashCode ^
        metadata.hashCode;
  }
}

class Child extends ChildEntity {
  Child({
    super.id,
    super.title,
    super.estimationValue,
    super.estimationTime,
    super.recordType,
    super.priority,
    super.impactLevel,
    super.recordStatus,
    super.recordLeft,
    super.recordRight,
    super.recordOrdering,
    super.parentId,
    super.deletedAt,
    super.createdBy,
    super.updatedBy,
    super.deletedBy,
    super.createdAt,
    super.updatedAt,
    super.workspaceId,
    super.type,
    super.assessment,
    super.startAt,
    super.endAt,
    super.fields,
    super.children,
    super.isExpanded
  });

  Child copyWith({
    int? id,
    String? title,
    dynamic? estimationValue,
    dynamic? estimationTime,
    String? recordType,
    dynamic? priority,
    dynamic? impactLevel,
    String? recordStatus,
    int? recordLeft,
    int? recordRight,
    int? recordOrdering,
    int? parentId,
    dynamic? deletedAt,
    int? createdBy,
    int? updatedBy,
    dynamic? deletedBy,
    String? createdAt,
    String? updatedAt,
    int? workspaceId,
    String? type,
    int? assessment,
    String? startAt,
    String? endAt,
    List<Board>? fields,
    List<ChildEntity>? children,
    bool? isExpanded
  }) {
    return Child(
      id: id ?? this.id,
      title: title ?? this.title,
      estimationValue: estimationValue ?? this.estimationValue,
      estimationTime: estimationTime ?? this.estimationTime,
      recordType: recordType ?? this.recordType,
      priority: priority ?? this.priority,
      impactLevel: impactLevel ?? this.impactLevel,
      recordStatus: recordStatus ?? this.recordStatus,
      recordLeft: recordLeft ?? this.recordLeft,
      recordRight: recordRight ?? this.recordRight,
      recordOrdering: recordOrdering ?? this.recordOrdering,
      parentId: parentId ?? this.parentId,
      deletedAt: deletedAt ?? this.deletedAt,
      createdBy: createdBy ?? this.createdBy,
      updatedBy: updatedBy ?? this.updatedBy,
      deletedBy: deletedBy ?? this.deletedBy,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      workspaceId: workspaceId ?? this.workspaceId,
      type: type ?? this.type,
      assessment: assessment ?? this.assessment,
      startAt: startAt ?? this.startAt,
      endAt: endAt ?? this.endAt,
      fields: fields ?? this.fields,
      children: children ?? this.children,
      isExpanded: isExpanded ?? isExpanded
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'estimationValue': estimationValue,
      'estimationTime': estimationTime,
      'recordType': recordType,
      'priority': priority,
      'impactLevel': impactLevel,
      'recordStatus': recordStatus,
      'recordLeft': recordLeft,
      'recordRight': recordRight,
      'recordOrdering': recordOrdering,
      'parentId': parentId,
      'deletedAt': deletedAt,
      'createdBy': createdBy,
      'updatedBy': updatedBy,
      'deletedBy': deletedBy,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'workspaceId': workspaceId,
      'type': type,
      'assessment': assessment,
      'startAt': startAt,
      'endAt': endAt,
      'fields': fields,
    };
  }

  factory Child.fromMap(Map<String, dynamic> map) {
    return Child(
      id: map['id'] != null ? map['id'] as int : null,
      title: map['title'] != null ? map['title'] as String : null,
      estimationValue: map['estimation_value'] as dynamic,
      estimationTime: map['estimation_time'] as dynamic,
      recordType:
          map['record_type'] != null ? map['record_type'] as String : null,
      priority: map['priority'] as dynamic,
      impactLevel: map['impact_level'] as dynamic,
      recordStatus:
          map['record_status'] != null ? map['record_status'] as String : null,
      recordLeft: map['record_left'] != null ? map['record_left'] as int : null,
      recordRight:
          map['record_right'] != null ? map['record_right'] as int : null,
      recordOrdering:
          map['record_ordering'] != null ? map['record_ordering'] as int : null,
      parentId: map['parent_id'] != null ? map['parent_id'] as int : null,
      deletedAt: map['deleted_at'] as dynamic,
      createdBy: map['created_by'] != null ? map['created_by'] as int : null,
      updatedBy: map['updated_by'] != null ? map['updated_by'] as int : null,
      deletedBy: map['deleted_by'] as dynamic,
      createdAt: map['created_at'] != null
          ? map['created_at'] as String
          : null,
      updatedAt: map['updateda_at'] != null
          ? map['updated_at'] as String
          : null,
      workspaceId:
          map['workspace_id'] != null ? map['workspace_id'] as int : null,
      type: map['type'] != null ? map['type'] as String : null,
      assessment: map['assessment'] != null ? map['assessment'] as int : null,
      startAt: map['start_at'] != null
          ? map['start_at'] as String
          : null,
      endAt: map['end_at'] != null
          ? map['end_at'] as String
          : null,
      fields: map['fields'] != null
          ? List<Board>.from(
              (map['fields'] as List<dynamic>).map<Board?>(
                (x) => Board.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Child.fromJson(String source) =>
      Child.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Child(id: $id, title: $title, estimationValue: $estimationValue, estimationTime: $estimationTime, recordType: $recordType, priority: $priority, impactLevel: $impactLevel, recordStatus: $recordStatus, recordLeft: $recordLeft, recordRight: $recordRight, recordOrdering: $recordOrdering, parentId: $parentId, deletedAt: $deletedAt, createdBy: $createdBy, updatedBy: $updatedBy, deletedBy: $deletedBy, createdAt: $createdAt, updatedAt: $updatedAt, workspaceId: $workspaceId, type: $type, assessment: $assessment, startAt: $startAt, endAt: $endAt, fields: $fields)';
  }

  @override
  bool operator ==(covariant Child other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.estimationValue == estimationValue &&
        other.estimationTime == estimationTime &&
        other.recordType == recordType &&
        other.priority == priority &&
        other.impactLevel == impactLevel &&
        other.recordStatus == recordStatus &&
        other.recordLeft == recordLeft &&
        other.recordRight == recordRight &&
        other.recordOrdering == recordOrdering &&
        other.parentId == parentId &&
        other.deletedAt == deletedAt &&
        other.createdBy == createdBy &&
        other.updatedBy == updatedBy &&
        other.deletedBy == deletedBy &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        other.workspaceId == workspaceId &&
        other.type == type &&
        other.assessment == assessment &&
        other.startAt == startAt &&
        other.endAt == endAt &&
        listEquals(other.fields, fields);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        estimationValue.hashCode ^
        estimationTime.hashCode ^
        recordType.hashCode ^
        priority.hashCode ^
        impactLevel.hashCode ^
        recordStatus.hashCode ^
        recordLeft.hashCode ^
        recordRight.hashCode ^
        recordOrdering.hashCode ^
        parentId.hashCode ^
        deletedAt.hashCode ^
        createdBy.hashCode ^
        updatedBy.hashCode ^
        deletedBy.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode ^
        workspaceId.hashCode ^
        type.hashCode ^
        assessment.hashCode ^
        startAt.hashCode ^
        endAt.hashCode ^
        fields.hashCode;
  }
}
