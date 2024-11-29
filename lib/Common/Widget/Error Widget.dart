import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp/Common/Result/Result.dart';

class ErrorWidget extends StatelessWidget {
   ErrorWidget({super.key , this.serverError , this.error , this.retryButtonText , this.retryButtonAction});
  ServerError? serverError;
  Error? error;
  String? retryButtonText ;
  VoidCallback?retryButtonAction ;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(extractError()),
        SizedBox(height: 4.h),
        if(retryButtonAction != null)
        ElevatedButton(onPressed: () {
             retryButtonAction?.call();
        }, child: Text(retryButtonText!))
      ],
    );
  }
  String extractError(){
     if(serverError?.message != null){
       return serverError!.message ;
     }
     if(error?.exception != null){
       return error!.exception.toString();
     }
     return "Something went Wrong" ;
  }
}
