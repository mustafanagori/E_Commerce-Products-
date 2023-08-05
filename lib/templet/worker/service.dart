import 'dart:core';
import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contruction0/core/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import '../../a_widgets/text.dart';

class ServiceScreen extends StatefulWidget {
  @override
  State<ServiceScreen> createState() => _ServiceScreenState();
}

class _ServiceScreenState extends State<ServiceScreen> {
  final currentuser = FirebaseAuth.instance.currentUser;
  final TextEditingController _serviceNameController = TextEditingController();
  final TextEditingController _serviceDesController = TextEditingController();
  final TextEditingController _ypController = TextEditingController();
  final TextEditingController _cpController = TextEditingController();
  final TextEditingController _itemcodeController = TextEditingController();
  String _imagePath = "";
  File? _selectedImageFile;

  String name = "";
  String contact = "";
  @override
  void initState() {
    getData();
    super.initState();
  }

  // when edit text
  void _clearTextControllers() {
    _serviceNameController.text = '';
    _serviceDesController.text = '';
    _cpController.text = '';
    _ypController.text = '';
    _itemcodeController.text = '';
  }

  // get worker Data
  void getData() async {
    User? user = FirebaseAuth.instance.currentUser;
    var var1 = await FirebaseFirestore.instance
        .collection("worker")
        .doc(user?.uid)
        .get();
    setState(() {
      name = var1.data()?['name'];
      contact = var1.data()?['contact'];
    });
  }

  // pick image
  void _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final _image = await _picker.pickImage(source: ImageSource.gallery);
    if (_image?.path != null) {
      setState(() {
        _selectedImageFile = File(_image!.path);
        _imagePath = _image.path;
      });
    }
  }

  //delete service
  Future<void> _deleteService(String documentId) async {
    User? user = FirebaseAuth.instance.currentUser;
    try {
      await FirebaseFirestore.instance
          .collection('services')
          .doc(user?.uid)
          .collection('myservices')
          .doc(documentId)
          .delete();
      Utils().toastMessage('delete sucessfully');
    } catch (error) {
      Utils().toastMessage('Failed to delete service  : $error');
    }
  }

  // edit service
  Future<void> _editServiceDetails(
      BuildContext context, DocumentSnapshot document) async {
    _serviceNameController.text = document['serviceName'];
    _serviceDesController.text = document['description'];
    _itemcodeController.text = document['itemcode'];
    _cpController.text = document['cp'];
    _ypController.text = document['yp'];

    await showModalBottomSheet(
      isScrollControlled:
          true, // This allows the content to scroll within the BottomSheet
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height - 220,
            color: Color.fromARGB(255, 251, 248, 248),
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Edit Product Details',
                  style: TextStyle(
                      fontSize: 24.0,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  controller: _serviceNameController,
                  decoration: InputDecoration(labelText: 'Product Name'),
                ),
                TextFormField(
                  controller: _serviceDesController,
                  decoration: InputDecoration(labelText: 'Service Description'),
                  keyboardType: TextInputType.name,
                ),
                TextFormField(
                  controller: _cpController,
                  decoration: InputDecoration(labelText: 'Product CP'),
                  keyboardType: TextInputType.number,
                ),
                TextFormField(
                  controller: _ypController,
                  decoration: InputDecoration(labelText: 'Product YP'),
                  keyboardType: TextInputType.number,
                ),
                TextFormField(
                  controller: _itemcodeController,
                  decoration: InputDecoration(labelText: 'Product Item Code'),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text(
                      "Update Product Image",
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.03),
                    IconButton(
                      onPressed: _pickImage,
                      icon: const Icon(
                        Icons.upload,
                        size: 30,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style:
                          ElevatedButton.styleFrom(backgroundColor: Colors.red),
                      onPressed: () {
                        Navigator.of(context).pop(); // Close the bottom sheet
                      },
                      child: Text('Close'),
                    ),
                    const SizedBox(
                      width: 70,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green),
                      onPressed: () {
                        _updateService(document.id);
                        Navigator.of(context)
                            .pop(); // Close the bottom sheet after editing
                      },
                      child: Text('Update '),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }

  //update service in fireabse
  Future<void> _updateService(String documentId) async {
    User? user = FirebaseAuth.instance.currentUser;
    final String serviceName = _serviceNameController.text;
    final String description = _serviceDesController.text;
    final String cp = _cpController.text;
    final String yp = _ypController.text;
    final String itemcode = _itemcodeController.text;

    if (serviceName.isNotEmpty) {
      try {
        String? imageUrl; // Declare a variable to store the updated image URL

        // Check if an image was selected for update
        if (_selectedImageFile != null) {
          // Upload the new image to Firebase Storage and get the updated image URL
          imageUrl = await _uploadImageToFirestore(imagePath: _imagePath);
        }
        await FirebaseFirestore.instance
            .collection('services')
            .doc(user?.uid)
            .collection('myservices')
            .doc(documentId)
            .update({
          'serviceName': serviceName,
          'cp': cp,
          'description': description,
          'itemcode': itemcode,
          'yp': yp,
          if (imageUrl != null) 'imageUrl': imageUrl,
        });

        Utils().toastMessage('Service details updated successfully');
      } catch (error) {
        Utils().toastMessage('Failed to update service details: $error');
      }
    } else {
      Utils().toastMessage("Please enter valid data");
    }
  }

  // add service
  Future<void> _addService(BuildContext context) async {
    User? user = FirebaseAuth.instance.currentUser;
    final String serviceName = _serviceNameController.text;
    final String description = _serviceDesController.text;
    final String cp = _cpController.text;
    final String yp = _ypController.text;
    final String itemcode = _itemcodeController.text;
    final String userID = currentuser!.uid;

    if (serviceName.isNotEmpty) {
      try {
        // Upload the image to Firebase Storage first and get the image URL
        String? imageUrl = await _uploadImageToFirestore(imagePath: _imagePath);

        if (imageUrl != null) {
          // Add service details to Firestore with the image URL
          await FirebaseFirestore.instance
              .collection('services')
              .doc(user?.uid)
              .collection('myservices')
              .add({
            'imageUrl': imageUrl,
            'serviceName': serviceName,
            'cp': cp,
            'description': description,
            'workerID': userID,
            'yp': yp,
            'itemcode': itemcode,
          });
          //Show success message or perform other actions
          Utils().toastMessage('Added successfully');
          Utils().toastMessage('All image replace with previous one');
          setState(() {
            _selectedImageFile = null;
            _imagePath = "";
          });
          Navigator.of(context).pop();
        }
      } catch (error) {
        Utils().toastMessage('Failed to add service: $error');
      }
    } else {
      Utils().toastMessage("Please select an image and enter valid data");
    }
  }

  // upload image to fireastore
  Future<String> _uploadImageToFirestore({
    required String? imagePath,
  }) async {
    File imageFile = File(imagePath!);

    // String _imageBaseName = basename(imageFile.path);
    Reference imageReference =
        FirebaseStorage.instance.ref().child("serivce_image");
    //.child(_imageBaseName);
    await imageReference.putFile(imageFile);
    String getImageUrl = await imageReference.getDownloadURL();
    return getImageUrl;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _clearTextControllers();
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return SingleChildScrollView(
                  child: AlertDialog(
                    title: const Text(
                      'Add Service',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                    content: Column(
                      children: [
                        TextFormField(
                          controller: _serviceNameController,
                          decoration:
                              const InputDecoration(labelText: 'Product Name'),
                        ),
                        TextFormField(
                          controller: _serviceDesController,
                          decoration: const InputDecoration(
                              labelText: 'Product Description'),
                          keyboardType: TextInputType.number,
                        ),
                        TextFormField(
                          controller: _itemcodeController,
                          decoration:
                              const InputDecoration(labelText: 'Item Code'),
                          keyboardType: TextInputType.name,
                        ),
                        TextFormField(
                          controller: _cpController,
                          decoration: const InputDecoration(
                              labelText: 'Enter Product C.P'),
                          keyboardType: TextInputType.name,
                        ),
                        TextFormField(
                          controller: _ypController,
                          decoration: const InputDecoration(
                              labelText: 'Enter Product Y.P'),
                          keyboardType: TextInputType.name,
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.03),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Text(
                              "Select Product Image",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                                width:
                                    MediaQuery.of(context).size.width * 0.03),
                            IconButton(
                              onPressed: _pickImage,
                              icon: const Icon(
                                Icons.upload,
                                size: 30,
                                color: Colors.green,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              border: Border.all(width: 1, color: Colors.blue)),
                          width: MediaQuery.of(context).size.height * 0.6,
                          height: MediaQuery.of(context).size.height * 0.04,
                          //color: const Color.fromARGB(255, 153, 144, 64),
                          child: _selectedImageFile != null
                              ? Center(
                                  child: Text(
                                  "image selected",
                                  style: TextStyle(color: Colors.white),
                                ))
                              : Center(
                                  child: Text("upload image",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20))),
                        )
                      ],
                    ),
                    actions: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          TextButton(
                            onPressed: () {
                              _addService(context);
                              setState(() {
                                _cpController.text = "";
                                _serviceNameController.text = "";
                                _serviceDesController.text = "";
                                _itemcodeController.text = "";
                                _ypController.text = "";
                                _selectedImageFile = null;
                                _imagePath = "";
                              });
                            },
                            child: const Text('Add'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                              setState(() {
                                _cpController.text = "";
                                _serviceNameController.text = "";
                                _serviceDesController.text = "";
                                _itemcodeController.text = "";
                                _ypController.text = "";
                                _selectedImageFile = null;
                                _imagePath = "";
                              });
                            },
                            child: const Text('Cancel'),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              },
            );
          },
          elevation: 5,
          child: const Icon(
            Icons.add,
            size: 30,
          ),
        ),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 5,
          title: const Text("Manage Products"),
          centerTitle: true,
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('services')
              .doc(currentuser?.uid)
              .collection('myservices')
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              print(snapshot);
              final List<DocumentSnapshot> documents = snapshot.data!.docs;
              return ListView.builder(
                key: ValueKey<String>('myListView'),
                itemCount: documents.length,
                itemBuilder: (context, index) {
                  final DocumentSnapshot document = documents[index];
                  final documentId = document.id;
                  final serviceName = document['serviceName'];
                  final img = document['imageUrl'];
                  final cp = document['cp'];
                  final des = document['description'];
                  final itemcode = document['itemcode'];
                  final yp = document['yp'];
                  return Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Container(
                      margin: const EdgeInsets.only(right: 10, left: 10),
                      height: MediaQuery.of(context).size.height * 0.27,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: const Color.fromARGB(255, 195, 179, 179),
                          width: 1,
                        ),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  //key: ValueKey<String>(img),
                                  img,
                                  height:
                                      MediaQuery.of(context).size.height * 0.19,
                                  width:
                                      MediaQuery.of(context).size.width * 0.3,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  AutoSizeText(
                                    "Woker Name : ${name}",
                                    style: GoogleFonts.abel(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                    minFontSize: 8,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Divider(),
                                  Row(
                                    children: [
                                      Text('C.P. =  $cp'),
                                      const Text("       "),
                                      Text('Y.C. = $yp')
                                    ],
                                  ),
                                  const Divider(),
                                  AutoSizeText(
                                    "Item Code :  $itemcode",
                                    style: GoogleFonts.acme(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    minFontSize: 8,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Divider(),
                                  AutoSizeText(
                                    "Product Name :  $serviceName",
                                    style: GoogleFonts.acme(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    minFontSize: 8,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  AutoSizeText(
                                    "Des:   $des",
                                    style: GoogleFonts.abel(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue,
                                    ),
                                    minFontSize: 8,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      TextStyleWidget(
                                        fontSize: 18,
                                        // text: "Rs ${cp.toStringAsFixed(1)}",
                                        text: "Rs $cp",
                                        color: Colors.green,
                                      ),
                                      Spacer(),
                                      Text("Edit"),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 5),
                                        child: IconButton(
                                            onPressed: () {
                                              _editServiceDetails(
                                                  context, document);
                                            },
                                            icon: const Icon(
                                              Icons.edit_attributes,
                                              size: 40,
                                              color: Colors.green,
                                            )),
                                      ),
                                      IconButton(
                                          onPressed: () =>
                                              _deleteService(documentId),
                                          icon: const Icon(
                                            Icons.delete,
                                            size: 30,
                                            color: Colors.red,
                                          )),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return const Text('Error fetching services');
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
