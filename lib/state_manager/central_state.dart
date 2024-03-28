part of 'central_bloc.dart';

class CentralBLocState extends Equatable {

  PatientDetailsResModel? patientDetails;

  @override
  List<Object?> get props => [ patientDetails, patientDetails?.subscriptionPlan, patientDetails?.patientPayment, patientDetails?.appointmentsPatient, patientDetails?.firstName, patientDetails?.lastName ];

}
