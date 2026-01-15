import 'package:equatable/equatable.dart';
import '../model/user/request_model.dart';

class RequestState extends Equatable {
  const RequestState({
    required this.isLoading,
    required this.req,
    required this.reqList,
  });
  final bool isLoading;
  final CustomerRequest req;
  final List<CustomerRequest> reqList;

  @override
  List<Object?> get props => [isLoading, req, reqList];
  RequestState copyWith({
    bool? isLoading,
    CustomerRequest? req,
    List<CustomerRequest>? reqList,
  }) => RequestState(
    isLoading: isLoading ?? this.isLoading,
    req: req ?? this.req,
    reqList: reqList ?? this.reqList,
  );
}
