import 'package:equatable/equatable.dart';
import '../model/resources_model.dart';
import '../model/user/request_model.dart';

class RequestState extends Equatable {
  const RequestState({
    required this.isLoading,
    required this.req,
    required this.reqList,
    required this.resourcesList,
  });
  final bool isLoading;
  final CustomerRequest req;
  final List<CustomerRequest> reqList;
  final List<ResourceModel> resourcesList;

  @override
  List<Object?> get props => [isLoading, req, reqList, resourcesList];
  RequestState copyWith({
    bool? isLoading,
    CustomerRequest? req,
    List<CustomerRequest>? reqList,
    List<ResourceModel>? resourcesList,
  }) => RequestState(
    isLoading: isLoading ?? this.isLoading,
    req: req ?? this.req,
    reqList: reqList ?? this.reqList,
    resourcesList: resourcesList ?? this.resourcesList,
  );
}
