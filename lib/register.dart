import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'user_type.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dashboard.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  bool isLoading = false;
  String selectedUserType = "consumer";

  Future<void> registerUser() async {
    if (nameController.text.trim().isEmpty ||
        emailController.text.trim().isEmpty ||
        phoneController.text.trim().isEmpty ||
        passwordController.text.trim().isEmpty ||
        confirmPasswordController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please fill all fields"),
        ),
      );
      return;
    }

    if (passwordController.text != confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Passwords do not match"),
        ),
      );
      return;
    }

    try {
      setState(() {
        isLoading = true;
      });

      final userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      print("USER CREATED: ${userCredential.user?.email}");

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Account created successfully"),
          backgroundColor: Colors.green,
        ),
      );

      await Future.delayed(const Duration(seconds: 2));
final prefs = await SharedPreferences.getInstance();

await prefs.setString(
  "userType",
  selectedUserType,
);
     Navigator.pushReplacement(
  context,
  MaterialPageRoute(
    builder: (context) => Dashboard(
      isBusinessOwner:
          selectedUserType == "business",
    ),
  ),

      );
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.message ?? "Registration failed"),
          backgroundColor: Colors.red,
        ),
      );

      print("FIREBASE ERROR: ${e.code}");
      print("FIREBASE MESSAGE: ${e.message}");
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
          backgroundColor: Colors.red,
        ),
      );

      print("GENERAL ERROR: $e");
    }

    if (mounted) {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange.shade50,
      appBar: AppBar(
        title: const Text("Create Account"),
        centerTitle: true,
        backgroundColor: const Color(0xffFF6F00),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 20),

            const CircleAvatar(
              radius: 50,
              backgroundColor: Color(0xffFF6F00),
              child: Icon(
                Icons.person_add,
                size: 50,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              "Create Your Account",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 25),

            TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: "Full Name",
                prefixIcon: const Icon(Icons.person),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),

            const SizedBox(height: 15),

            TextFormField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: "Email",
                prefixIcon: const Icon(Icons.email),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),

            const SizedBox(height: 15),

            TextFormField(
              controller: phoneController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: "Phone Number",
                prefixIcon: const Icon(Icons.phone),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),

            const SizedBox(height: 15),

            TextFormField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Password",
                prefixIcon: const Icon(Icons.lock),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),

            const SizedBox(height: 15),

            TextFormField(
              controller: confirmPasswordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Confirm Password",
                prefixIcon: const Icon(Icons.lock_outline),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),

            const SizedBox(height: 30),
const SizedBox(height: 20),

const Align(
  alignment: Alignment.centerLeft,
  child: Text(
    "Account Type",
    style: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 16,
    ),
  ),
),

RadioListTile<String>(
  title: const Text("Business Owner"),
  value: "business",
  groupValue: selectedUserType,
  onChanged: (value) {
    setState(() {
      selectedUserType = value!;
    });
  },
),

RadioListTile<String>(
  title: const Text("Consumer"),
  value: "consumer",
  groupValue: selectedUserType,
  onChanged: (value) {
    setState(() {
      selectedUserType = value!;
    });
  },
),

const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xffFF6F00),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onPressed: isLoading ? null : registerUser,
                child: isLoading
                    ? const CircularProgressIndicator(
                        color: Colors.white,
                      )
                    : const Text(
                        "CREATE ACCOUNT",
                        style: TextStyle(fontSize: 18),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}