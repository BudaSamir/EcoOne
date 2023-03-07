/*
* All Shared Variables, Methods that ViewModels Will need it  
*/
abstract class BaseViewModel extends BaseViewModelInputs
    with BaseViewModelOutputs {}

/* 
* All Views Requestes Form ViewModel 
*/
abstract class BaseViewModelInputs {
  void start(); // Starting THe Operation
  void dispose(); // End THe Operation
}

/* 
* All ViewModel Responses To Views 
*/
abstract class BaseViewModelOutputs {}
