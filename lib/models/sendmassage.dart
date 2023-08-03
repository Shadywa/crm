import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SendMessageScreen extends StatefulWidget {
  SendMessageScreen() {}
  @override
  _SendMessageScreenState createState() => _SendMessageScreenState();
}

class _SendMessageScreenState extends State<SendMessageScreen> {
  final _formKey = GlobalKey<FormState>();
  final _messageController = TextEditingController();
  String _selectedPlatform = 'Email';

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  void _send() {
    final message = _messageController.text.trim();
    if (message.isNotEmpty) {
      if (_selectedPlatform == 'Email') {
        _sendEmail(message);
      } else if (_selectedPlatform == 'WhatsApp') {
        _sendWhatsApp(message);
      }
    }
  }

  void _sendEmail(String message) async {
    final emailUrl = 'mailto:?body=$message';
    if (await canLaunch(emailUrl)) {
      await launch(emailUrl);
    } else {
      // Handle error
    }
  }

  void _sendWhatsApp(String message) async {
    final whatsappUrl = 'https://wa.me/?text=$message';
    if (await canLaunch(whatsappUrl)) {
      await launch(whatsappUrl);
    } else {
      // Handle error
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('send massage'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 200,
                width: double.infinity,
                color: Colors.white,
                child: Column(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _messageController,
                        maxLines: 13,
                        decoration: const InputDecoration(
                          labelText: 'Message',
                        ),
                        validator: (value) {
                          if (value!.trim().isEmpty) {
                            return 'Please enter a message';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16.0),
              const Text('Send via'),
              const SizedBox(height: 8.0),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _selectedPlatform = 'Email';
                        });
                      },
                      child: const Text('Email'),
                      style: _selectedPlatform == 'Email'
                          ? ElevatedButton.styleFrom(
                              primary: Colors.blue,
                            )
                          : null,
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _selectedPlatform = 'WhatsApp';
                        });
                      },
                      child: const Text('WhatsApp'),
                      style: _selectedPlatform == 'WhatsApp'
                          ? ElevatedButton.styleFrom(
                              primary: Colors.green,
                            )
                          : null,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              Center(
                child: ElevatedButton(
                  onPressed: _send,
                  child: const Text('Send'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
