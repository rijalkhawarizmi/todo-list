

import 'package:equatable/equatable.dart';

class ApiException extends Equatable implements Exception{
  const ApiException({required this.message});

  final String message;
  
  @override
  // TODO: implement props
  List<Object?> get props => [message];

}

