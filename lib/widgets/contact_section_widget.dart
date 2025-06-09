import 'package:flutter/material.dart';

class ContactSectionWidget extends StatefulWidget {
  @override
  _ContactSectionWidgetState createState() => _ContactSectionWidgetState();
}

class _ContactSectionWidgetState extends State<ContactSectionWidget> {
  // TODO: Implement state management for form fields

  // Define a list of services for the radio buttons
  final List<String> services = [
    'Precision Laser Cutting',
    'CNC Precision Trimming',
    'Automotive Spot Welding',
    'Component Joining',
    'Waterjet Cutting',
    'MIG Welding Services',
    'Custom Project',
    'Other',
  ];

  // Define dropdown options for quantity and timeline
  final List<String> quantityOptions = [
    'Select quantity range',
    '1-10 units',
    '11-50 units',
    '51-100 units',
    '101-500 units',
    '501+ units',
  ];

  final List<String> timelineOptions = [
    'Select timeline',
    'Urgent (1-2 weeks)',
    'Standard (3-4 weeks)',
    'Flexible (1-2 months)',
    'Planning Phase (3+ months)',
  ];

  String? _selectedQuantity;
  String? _selectedTimeline;
  String? _selectedService; // For radio buttons

  @override
  void initState() {
    super.initState();
    _selectedQuantity = quantityOptions.first; // Set initial value
    _selectedTimeline = timelineOptions.first; // Set initial value
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80.0), // py-20
      color: Colors.grey[900], // bg-gray-900
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16.0), // px-4
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Contact Us',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 28, // text-3xl (adjust for responsiveness)
                fontWeight: FontWeight.bold,
                color: Colors.white, // text-white
              ),
            ),
            SizedBox(height: 16), // mb-4
            Container(
              constraints: BoxConstraints(maxWidth: 600), // max-w-3xl
              child: Text(
                'Request a quote or get in touch with our team to discuss your manufacturing needs.',
                textAlign: TextAlign.center, // text-center
                style: TextStyle(
                  fontSize: 16, // text-gray-400
                  color: Colors.grey[400],
                ),
              ),
            ),
            SizedBox(height: 48), // mb-12
            Container(
              constraints: BoxConstraints(maxWidth: 600), // max-w-2xl (approx)
              child: Form(
                // form class="space-y-6"
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Your Name
                    _buildTextField('Your Name', 'name'),
                    SizedBox(height: 24), // space-y-6 (approx)
                    // Email Address
                    _buildTextField('Email Address', 'email', keyboardType: TextInputType.emailAddress),
                    SizedBox(height: 24), // space-y-6 (approx)
                    // Phone Number
                    _buildTextField('Phone Number', 'phone', keyboardType: TextInputType.phone),
                    SizedBox(height: 24), // space-y-6 (approx)
                    // Company Name
                    _buildTextField('Company Name', 'company'),
                    SizedBox(height: 24), // space-y-6 (approx)
                    // Product/Service Needed (Radio Buttons)
                    Text(
                      'Product/Service Needed',
                      style: TextStyle(
                        fontSize: 16, // block mb-2 (approx)
                        color: Colors.white, // text-white
                      ),
                    ),
                    SizedBox(height: 8), // mb-2
                    _buildServiceRadioButtons(),
                    SizedBox(height: 24), // space-y-6 (approx)
                    // Project Details (Textarea)
                    _buildTextArea('Project Details', 'project-details'),
                    SizedBox(height: 24), // space-y-6 (approx)
                    // Estimated Quantity (Dropdown)
                    _buildDropdown('Estimated Quantity', quantityOptions, _selectedQuantity, (newValue) {
                      setState(() {
                        _selectedQuantity = newValue;
                      });
                    }),
                    SizedBox(height: 24), // space-y-6 (approx)
                    // Project Timeline (Dropdown)
                    _buildDropdown('Project Timeline', timelineOptions, _selectedTimeline, (newValue) {
                      setState(() {
                        _selectedTimeline = newValue;
                      });
                    }),
                    SizedBox(height: 24), // space-y-6 (approx)
                    // Submit Button
                    ElevatedButton(
                      onPressed: () {
                        // TODO: Implement form submission logic
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue[600], // bg-blue-600
                        onPrimary: Colors.white, // text-white
                        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12), // px-6 py-3 (approx)
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8), // rounded-lg
                        ),
                        minimumSize: Size(double.infinity, 40), // h-10 w-full
                      ),
                      child: Text(
                        'Submit Quote Request',
                        style: TextStyle(
                          fontSize: 16, // text-sm (approx)
                          fontWeight: FontWeight.semibold, // font-semibold
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, String id, {TextInputType keyboardType = TextInputType.text}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 16, // block mb-2 (approx)
            color: Colors.white, // text-white
          ),
        ),
        SizedBox(height: 8), // mb-2
        TextField(
          // input with styling
          keyboardType: keyboardType,
          style: TextStyle(color: Colors.white), // text-white
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey[800], // bg-gray-800
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8), // rounded
              borderSide: BorderSide(color: Colors.grey[700]!), // border border-gray-700
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey[700]!),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.blue[500]!), // focus:ring-blue-500
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 10), // px-4 py-2 (approx)
            isDense: true, // flex h-10
            hintText: label, // placeholder
            hintStyle: TextStyle(color: Colors.grey[500]), // placeholder:text-muted-foreground (approx)
          ),
        ),
      ],
    );
  }

  Widget _buildTextArea(String label, String id) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 16, // block mb-2 (approx)
            color: Colors.white, // text-white
          ),
        ),
        SizedBox(height: 8), // mb-2
        TextField(
          // textarea with styling
          maxLines: 4, // rows-4
          style: TextStyle(color: Colors.white), // text-white
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey[800], // bg-gray-800
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8), // rounded
              borderSide: BorderSide(color: Colors.grey[700]!), // border border-gray-700
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey[700]!),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.blue[500]!), // focus:ring-blue-500
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 10), // px-4 py-2 (approx)
            hintText: 'Please provide details about your project requirements, specifications, timeline, etc.', // placeholder
            hintStyle: TextStyle(color: Colors.grey[500]), // placeholder:text-muted-foreground (approx)
          ),
        ),
      ],
    );
  }

  Widget _buildServiceRadioButtons() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: services.map((service) {
        return Container(
          margin: const EdgeInsets.only(bottom: 8.0), // space-y-2 (approx)
          decoration: BoxDecoration(
            color: Colors.grey[800], // bg-gray-800
            borderRadius: BorderRadius.circular(4.0), // rounded-md
            border: Border.all(color: Colors.grey[700]!), // border border-gray-700
          ),
          child: RadioListTile<String>(
            title: Text(
              service,
              style: TextStyle(color: Colors.white), // text-white
            ),
            value: service,
            groupValue: _selectedService,
            onChanged: (newValue) {
              setState(() {
                _selectedService = newValue;
              });
            },
            dense: true, // Adjust spacing
            contentPadding: EdgeInsets.symmetric(horizontal: 12.0), // p-3 (approx)
            activeColor: Colors.blue[600], // Primary color for selected radio button
          ),
        );
      }).toList(),
    );
  }

  Widget _buildDropdown(String label, List<String> options, String? selectedValue, ValueChanged<String?> onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 16, // block mb-2 (approx)
            color: Colors.white, // text-white
          ),
        ),
        SizedBox(height: 8), // mb-2
        DropdownButtonFormField<String>(
          // Dropdown with styling
          value: selectedValue,
          items: options.map((String option) {
            return DropdownMenuItem<String>(
              value: option,
              child: Text(option),
            );
          }).toList(),
          onChanged: onChanged,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey[800], // bg-gray-800
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8), // rounded-md
              borderSide: BorderSide(color: Colors.grey[700]!), // border border-gray-700
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey[700]!),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.blue[500]!), // focus:ring-blue-500
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 10), // px-3 py-2 (approx)
            isDense: true, // h-10
            hintStyle: TextStyle(color: Colors.grey[500]), // placeholder:text-muted-foreground (approx)
          ),
          dropdownColor: Colors.grey[800], // Dropdown menu background color
          style: TextStyle(color: Colors.white), // Dropdown item text color
        ),
      ],
    );
  }
}
