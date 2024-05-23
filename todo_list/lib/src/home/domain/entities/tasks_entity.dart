// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class TasksEntity extends Equatable {
    int? id;
    String? title;
    String? description;
    String? recordType;
    String? type;
    dynamic priority;
    dynamic impactLevel;
    dynamic ticketNumber;
    dynamic meetingLocation;
    dynamic parentId;
    String? recordStatus;
    int? recordOrdering;
    int? createdBy;
    String? createdAt;
    String? updatedAt;
    String? startDate;
    String? dueDate;
    String? timeline;
    bool? isOverdue;
    bool? isPending;
    bool? isRejected;
    bool? isUnscheduled;
    String? deadline;
    int? progress;
    String? recurrence;
    dynamic project;
    List<dynamic>? taskStatus;
    BoardEntity? board;
    int? score;
    List<AssignmentEntity>? assignments;
    dynamic thumbnail;
    List<dynamic>? attachments;
    List<dynamic>? draftFiles;
    List<dynamic>? signedFiles;
    List<dynamic>? quotationFiles;
    List<dynamic>? analysisFiles;
    List<ChildEntity>? children;
    int? childrenCount;

    TasksEntity({
        this.id,
        this.title,
        this.description,
        this.recordType,
        this.type,
        this.priority,
        this.impactLevel,
        this.ticketNumber,
        this.meetingLocation,
        this.parentId,
        this.recordStatus,
        this.recordOrdering,
        this.createdBy,
        this.createdAt,
        this.updatedAt,
        this.startDate,
        this.dueDate,
        this.timeline,
        this.isOverdue,
        this.isPending,
        this.isRejected,
        this.isUnscheduled,
        this.deadline,
        this.progress,
        this.recurrence,
        this.project,
        this.taskStatus,
        this.board,
        this.score,
        this.assignments,
        this.thumbnail,
        this.attachments,
        this.draftFiles,
        this.signedFiles,
        this.quotationFiles,
        this.analysisFiles,
        this.children,
        this.childrenCount,
    });


  @override
  List<Object?> get props {
    return [
      id,
      title,
      description,
      recordType,
      type,
      priority,
      impactLevel,
      ticketNumber,
      meetingLocation,
      parentId,
      recordStatus,
      recordOrdering,
      createdBy,
      createdAt,
      updatedAt,
      startDate,
      dueDate,
      timeline,
      isOverdue,
      isPending,
      isRejected,
      isUnscheduled,
      deadline,
      progress,
      recurrence,
      project,
      taskStatus,
      board,
      score,
      assignments,
      thumbnail,
      attachments,
      draftFiles,
      signedFiles,
      quotationFiles,
      analysisFiles,
      children,
      childrenCount,
    ];
  }
}

class AssignmentEntity extends Equatable {
    int? id;
    int? userId;
    String? fullName;
    String? company;
    String? role;
    String? avatar;
    String? initial;

    AssignmentEntity({
        this.id,
        this.userId,
        this.fullName,
        this.company,
        this.role,
        this.avatar,
        this.initial,
    });


  @override
  List<Object?> get props {
    return [
      id,
      userId,
      fullName,
      company,
      role,
      avatar,
      initial,
    ];
  }
}

class BoardEntity extends Equatable {
    int? id;
    String? name;
    String? code;
    String? slug;
    String? description;
    String? value;
    MetadataEntity? metadata;
    String? recordStatus;
    int? recordLeft;
    int? recordRight;
    int? recordOrdering;
    int? parentId;
    int? createdBy;
    int? updatedBy;
    dynamic deletedBy;
    String? createdAt;
    String? updatedAt;
    dynamic deletedAt;
    int? workspaceId;
    PivotEntity? pivot;
    int? taskId;
    String? content;

    BoardEntity({
        this.id,
        this.name,
        this.code,
        this.slug,
        this.description,
        this.value,
        this.metadata,
        this.recordStatus,
        this.recordLeft,
        this.recordRight,
        this.recordOrdering,
        this.parentId,
        this.createdBy,
        this.updatedBy,
        this.deletedBy,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.workspaceId,
        this.pivot,
        this.taskId,
        this.content,
    });


  @override
  List<Object?> get props {
    return [
      id,
      name,
      code,
      slug,
      description,
      value,
      metadata,
      recordStatus,
      recordLeft,
      recordRight,
      recordOrdering,
      parentId,
      createdBy,
      updatedBy,
      deletedBy,
      createdAt,
      updatedAt,
      deletedAt,
      workspaceId,
      pivot,
      taskId,
      content,
    ];
  }
}

class MetadataEntity extends Equatable {
    String? bg;
    String? font;

    MetadataEntity({
        this.bg,
        this.font,
    });


  @override
  List<Object?> get props => [bg, font];
}

class PivotEntity extends Equatable {
    String? pivotableType;
    int? pivotableId;
    int? entityId;
    String? role;
    String? timestamp;
    String? metadata;

    PivotEntity({
        this.pivotableType,
        this.pivotableId,
        this.entityId,
        this.role,
        this.timestamp,
        this.metadata,
    });


  @override
  List<Object?> get props {
    return [
      pivotableType,
      pivotableId,
      entityId,
      role,
      timestamp,
      metadata,
    ];
  }
}

class ChildEntity extends Equatable {
    int? id;
    String? title;
    dynamic estimationValue;
    dynamic estimationTime;
    String? recordType;
    dynamic priority;
    dynamic impactLevel;
    String? recordStatus;
    int? recordLeft;
    int? recordRight;
    int? recordOrdering;
    int? parentId;
    dynamic deletedAt;
    int? createdBy;
    int? updatedBy;
    dynamic deletedBy;
    String? createdAt;
    String? updatedAt;
    int? workspaceId;
    String? type;
    int? assessment;
    String? startAt;
    String? endAt;
    List<BoardEntity>? fields;
    List<ChildEntity> children;
    bool? isExpanded;

    ChildEntity({
        this.id,
        this.title,
        this.estimationValue,
        this.estimationTime,
        this.recordType,
        this.priority,
        this.impactLevel,
        this.recordStatus,
        this.recordLeft,
        this.recordRight,
        this.recordOrdering,
        this.parentId,
        this.deletedAt,
        this.createdBy,
        this.updatedBy,
        this.deletedBy,
        this.createdAt,
        this.updatedAt,
        this.workspaceId,
        this.type,
        this.assessment,
        this.startAt,
        this.endAt,
        this.fields,
        this.children=const [],
        this.isExpanded
    });


  @override
  List<Object?> get props {
    return [
      id,
      title,
      estimationValue,
      estimationTime,
      recordType,
      priority,
      impactLevel,
      recordStatus,
      recordLeft,
      recordRight,
      recordOrdering,
      parentId,
      deletedAt,
      createdBy,
      updatedBy,
      deletedBy,
      createdAt,
      updatedAt,
      workspaceId,
      type,
      assessment,
      startAt,
      endAt,
      fields,
    ];
  }
}
