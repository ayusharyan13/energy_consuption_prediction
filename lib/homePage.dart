import 'package:energy_consumption/widgets/mappingInputs.dart';
import 'package:energy_consumption/widgets/powerCategory.dart';
import 'package:energy_consumption/widgets/regionDropDown.dart';
import 'package:energy_consumption/widgets/selectMonth.dart';
import 'package:energy_consumption/widgets/stateDropDown.dart';
import 'package:energy_consumption/widgets/subCategoryDropdown.dart';
import 'package:energy_consumption/widgets/variable.dart';
import 'package:energy_consumption/widgets/yearDropDown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class HomeController extends  GetxController {
  var selectedState = 17.obs;
  var selectedRegion = 2.obs;
  var selectedCategory = 0.obs;
  var selectedSubCategory = 0.obs;
  var selectedVariable = 0.obs;
  var selectedMonth = 1.obs;
  var selectedYear = 2.obs;
  var predictionResult = ''.obs;
  final ngrokUrl = "https://cd37-103-139-191-219.ngrok-free.app";

  Future<void> sendPredictionRequest() async {
    final url = "$ngrokUrl/predict";

    print('Sending prediction request with parameters:');
    print('selectedState: ${selectedState.value}');
    print('selectedPowerCategory: ${selectedCategory.value}');
    print('selectedVariable: ${selectedVariable.value}');
    print('selectedRegion: ${selectedRegion.value}');
    print('selectedMonth: ${selectedMonth.value}');
    print('selectedSubCategory: ${selectedSubCategory.value}');


    final response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, dynamic>{
        "selectedState": selectedState.value,
        "selectedPowerCategory": selectedCategory.value,
        "selectedVariable": selectedVariable.value,
        "selectedRegion": selectedRegion.value,
        "selectedMonth": selectedMonth.value,
        "selectedSubCategory": selectedSubCategory.value,
        "selectedYear" : selectedYear.value,
      }),
    );

    if (response.statusCode == 200) {

      final Map<String, dynamic> responseData = jsonDecode(response.body);
      final prediction = responseData['prediction'];
      print('Predicted energy value: $prediction');

      predictionResult.value = prediction;
    } else {
      print('Failed to get prediction: ${response.statusCode}');
    }
  }
}

class HomePage extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());

   HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Energy prediction",
          style: TextStyle(
            color: Colors.blue,
            fontSize: 25
          ),)),
      ),
      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background_home.jpg'),
            fit: BoxFit.cover,
            opacity: 0.15
          )
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              IndianStatesDropdown(
                selectedState: 'Kerala', // Set the initial selected state
                onChanged: (value) {
                  print('Selected state: $value');
                  if (mappingState[value] != null) {
                    controller.selectedState.value = mappingState[value]!;
                  } else {
                    Get.snackbar("Invalid option selected", "No mapping found for this input");
                  }
                },
              ),


              PowerCategoryDropdown(
                selectedPowerCategory: 'Electricity generation',
                onChanged: (value) {
                  if (mappingCategory[value] != null) {
                    controller.selectedCategory.value = mappingCategory[value]!;
                  } else {
                    Get.snackbar("Invalid option selected", "No mapping found for this input");
                  }
                },
              ),

              VariableFossilDropdown(
                selectedVaraiable: 'Clean',
                onChanged: (value){
                  print("Selected Variable: $value)");
                  if (mappingVariable[value] != null) {
                    controller.selectedVariable.value = mappingVariable[value]!;
                  } else {
                    Get.snackbar("Invalid option selected", "No mapping found for this input");
                  }
                },
              ),


              RegionDropdown(
                selectedRegion: 'North',
                onChanged: (value) {
                  print("Selected Region is $value");
                  print(mappingRegion[value]);
                  if (mappingRegion[value] != null) {
                    controller.selectedRegion.value = mappingRegion[value]!;
                  } else {
                    Get.snackbar("Invalid option selected", "No mapping found for this input");
                  }
                },
              ),



              MonthDropdown(
                selectedMonth: 'January',
                onChanged: (value){
                  print("selected months is $value");
                  if (mappingMonth[value] != null) {
                    controller.selectedMonth.value = mappingMonth[value]!;
                  } else {
                    Get.snackbar("Invalid option selected", "No mapping found for this input");
                  }
                },
              ),


              SubcategoryDropdown(
                selectedSubCategory: 'Aggregate fuel',
                onChanged: (value) {
                  print('Selected SubCategory is $value');
                  if (mappingSubcategory[value] != null) {
                    controller.selectedSubCategory.value = mappingSubcategory[value]!;
                  } else {
                    Get.snackbar("Invalid option selected", "No mapping found for this input");
                  }
                }
              ),


              yearDropdown(
                selectedYear: '2020',
                  onChanged: (value) {
                    print('Selected year is $value');
                    if (mappingYear[value] != null) {
                      controller.selectedYear.value = mappingYear[value]!;
                    } else {
                      Get.snackbar("Invalid option selected", "No mapping found for this input");
                    }
                  }

              ),

              Container(
                decoration: BoxDecoration(
                  color: Colors.blue.shade100,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: TextButton(onPressed:()  {
                  controller.sendPredictionRequest();
                }, child: const Text("Predict",
                style: TextStyle(
                  color: Colors.deepOrange,
                  fontSize: 18,
                ),)),
              ),

              const SizedBox(height: 15),

              Obx(() => Text(controller.predictionResult.value,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.indigo,
                fontSize: 22
              ),)),
            ],
          ),
        ),
      ),
    );
  }
}

