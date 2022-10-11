part of '../pages.dart';

class Buy extends StatefulWidget {
  const Buy({Key? key}) : super(key: key);

  @override
  State<Buy> createState() => _BuyState();
}

class _BuyState extends State<Buy> {
  @override
  void initState() {
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();
  final ctrlFullName = TextEditingController();
  final ctrlEmail = TextEditingController();
  final ctrlPhone = TextEditingController();
  final ctrlCity = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    ctrlFullName.dispose();
    ctrlEmail.dispose();
    ctrlPhone.dispose();
    ctrlCity.dispose();
  }

  void handleFormSubmit() {
    if (_formKey.currentState!.validate()) {
      showDialog(
          context: context,
          builder: (_) => AlertDialog(
                title: const Text('Purchase Confirmation'),
                content: Wrap(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Name: ${ctrlFullName.text}'),
                        Text('Email: ${ctrlEmail.text}'),
                        Text('Phone: ${ctrlPhone.text}'),
                        Text('City: ${ctrlCity.text}'),
                      ],
                    ),
                  ],
                ),
                actions: [
                  TextButton(
                    child: const Text("OK"),
                    onPressed: () {
                      Navigator.of(context).popUntil((route) => route.isFirst);
                    },
                  ),
                ],
              ));
    } else {
      showDialog(
          context: context,
          builder: (_) => AlertDialog(
                title: const Text('Purchase Failed'),
                content: const Text('This is my content'),
                actions: [
                  TextButton(
                    child: const Text("OK"),
                    onPressed: () {
                      Navigator.of(context, rootNavigator: true).pop('dialog');
                    },
                  ),
                ],
              ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Login Page"),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.fromLTRB(24, 16, 24, 16),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    keyboardType: TextInputType.name,
                    decoration: const InputDecoration(
                        labelText: "Full Name", prefixIcon: Icon(Icons.person)),
                    controller: ctrlFullName,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      return value.toString().length < 8
                          ? 'Nama Harus Terdiri dari 8 Karakter Ke Atas!'
                          : null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                        labelText: "Email", prefixIcon: Icon(Icons.email)),
                    controller: ctrlEmail,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      return value.toString().length < 8
                          ? 'Email Harus Terdiri dari 8 Karakter Ke Atas!'
                          : null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        labelText: "Phone Number",
                        prefixIcon: Icon(Icons.phone)),
                    controller: ctrlPhone,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      return value.toString().length < 8
                          ? 'Nomor Telepon Harus Terdiri dari 8 Karakter Ke Atas!'
                          : null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                        labelText: "City",
                        prefixIcon: Icon(Icons.location_city)),
                    controller: ctrlCity,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      return value.toString().length < 8
                          ? 'Kota Harus Terdiri dari 8 Karakter Ke Atas!'
                          : null;
                    },
                  ),
                  const SizedBox(height: 32),
                  ElevatedButton(
                    onPressed: () {
                      handleFormSubmit();
                    },
                    child: const Text('Login'),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
