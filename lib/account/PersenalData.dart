import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

enum Gender { male, female }

class PersonalDataScreen extends StatefulWidget {
  @override
  _PersonalDataScreenState createState() => _PersonalDataScreenState();
}

class _PersonalDataScreenState extends State<PersonalDataScreen> {
  final _nameController = TextEditingController();
  final _jobController = TextEditingController();
  final _dateController = TextEditingController();
  final _incomeController = TextEditingController();
  DateTime? _selectedDate;
  Gender _selectedGender = Gender.male;

  @override
  Widget build(BuildContext context) {
    // Get screen size
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/Profile');
          },
        ),
        centerTitle: true,
        title: const Text(
          'Personal Data',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 1, 59, 107),
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        height: screenSize.height, // Use height of the screen
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 10,
                    ),
                  ],
                  image: DecorationImage(
                    image: AssetImage('assets/will_smith.png'),
                  ),
                ),
                child: Stack(
                  alignment: Alignment.bottomRight,
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      bottom: -10,
                      right: -10,
                      child: Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 227, 232, 255),
                          shape: BoxShape.rectangle,
                          border: Border.all(color: Colors.white, width: 3),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.camera_alt,
                            size: 20,
                            color: Color.fromARGB(255, 106, 120, 255),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40),
              _buildInputField(
                title: 'Your Name',
                controller: _nameController..text = 'Will Smith',
              ),
              _buildDateInputField(), // Use the new date input field method
              _buildInputField(
                title: 'Your Job',
                controller: _jobController..text = 'Actor',
              ),
              _buildIncomeField(
                title: 'Monthly Income',
                controller: _incomeController..text = '100000 - 1500000 / year',
              ),
              SizedBox(height: 5),
              _buildGenderSelection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputField(
      {required String title, required TextEditingController controller}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              color: Color.fromARGB(255, 3, 26, 117),
            ),
          ),
          SizedBox(height: 4),
          TextFormField(
            controller: controller,
            style: TextStyle(
              color: Color.fromARGB(255, 1, 59, 107),
              fontWeight: FontWeight.bold,
            ),
            decoration: InputDecoration(
              filled: true,
              fillColor: Color.fromARGB(255, 227, 232, 255),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 12.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(
                    color: Color.fromARGB(255, 57, 96, 253), width: 2.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide:
                    BorderSide(color: Color.fromARGB(255, 136, 158, 245)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(color: Colors.blueAccent),
              ),
            ),
          ),
          SizedBox(height: 25),
        ],
      ),
    );
  }

  Widget _buildIncomeField(
      {required String title, required TextEditingController controller}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              color: Color.fromARGB(255, 3, 26, 117),
            ),
          ),
          SizedBox(height: 4),
          TextFormField(
            controller: controller,
            style: TextStyle(
              color: Color.fromARGB(255, 1, 59, 107),
              fontWeight: FontWeight.bold,
            ),
            decoration: InputDecoration(
              filled: true,
              fillColor: Color.fromARGB(255, 227, 232, 255),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 12.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(
                    color: Color.fromARGB(255, 57, 96, 253), width: 2.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide:
                    BorderSide(color: Color.fromARGB(255, 136, 158, 245)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(color: Colors.blueAccent),
              ),
              suffixIcon: Icon(Icons.keyboard_arrow_down_outlined),
            ),
          ),
          SizedBox(height: 25),
        ],
      ),
    );
  }

  Widget _buildDateInputField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Date of Birth',
            style: TextStyle(
              fontSize: 16,
              color: Color.fromARGB(255, 3, 26, 117),
            ),
          ),
          SizedBox(height: 4),
          InkWell(
            onTap: () async {
              DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: _selectedDate ?? DateTime.now(),
                firstDate: DateTime(1900),
                lastDate: DateTime.now(),
              );

              if (pickedDate != null && pickedDate != _selectedDate) {
                setState(() {
                  _selectedDate = pickedDate;
                  _selectedDate = pickedDate;
                  _dateController.text =
                      DateFormat('d MMMM yyyy').format(pickedDate);
                });
              }
            },
            child: AbsorbPointer(
              child: TextFormField(
                controller: _dateController
                  ..text = _selectedDate != null
                      ? "${_selectedDate!.day} ${DateFormat('MMMM').format(_selectedDate!)} ${_selectedDate!.year}"
                      : '25 September 1968',
                style: TextStyle(
                  color: Color.fromARGB(255, 1, 59, 107),
                  fontWeight: FontWeight.bold,
                ),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color.fromARGB(255, 227, 232, 255),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 20.0,
                    horizontal: 12.0,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 57, 96, 253),
                      width: 2.0,
                    ),
                  ),
                  suffixIcon: Icon(Icons.keyboard_arrow_down_outlined),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 136, 158, 245)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(color: Colors.blueAccent),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 25),
        ],
      ),
    );
  }

  Widget _buildGenderSelection() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Gender",
            style: TextStyle(
              fontSize: 16,
              color: Color.fromARGB(255, 3, 26, 117),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildGenderOption(Gender.male, 'Male'),
              _buildGenderOption(Gender.female, 'Female'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildGenderOption(Gender gender, String label) {
    return Container(
      width: 150,
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      margin: const EdgeInsets.only(right: 20, top: 10),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 227, 232, 255),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Radio<Gender>(
            value: gender,
            groupValue: _selectedGender,
            fillColor:
                MaterialStatePropertyAll(Color.fromARGB(255, 3, 90, 161)),
            onChanged: (value) {
              setState(() {
                _selectedGender = value!;
              });
            },
          ),
          Text(
            label,
            style: TextStyle(
                color: Color.fromARGB(255, 19, 32, 146),
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
