import 'package:barberapp/app/data/model/company_model.dart';
import 'package:barberapp/app/data/provider/company_provider.dart';
import 'package:get/get.dart';

class CompanyRepository {
  final CompanyApiClient apiClient = Get.find<CompanyApiClient>();

  getAll() async{
    List<Company> list = <Company>[];
    var response = await apiClient.getAll();
    if(response != null){
      response.forEach((e){
        print(Company.fromJson(e).toJson());
        list.add(Company.fromJson(e));
      });
    }

    return list;
    
  }
}
