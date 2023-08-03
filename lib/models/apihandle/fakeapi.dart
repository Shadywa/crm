import 'cus_buy.dart';

class FakeApiService {
  Future<List<Customer>> fetchCustomers() async {
    await Future.delayed(Duration(seconds: 1)); // Simulate delay

    return [
      Customer(
        id: "1",
        name: 'shady',
        email: 'shady@example.com',
        phone: '01206658095',
        emailId: '1',
        profilePictureUrl:
            'https://www.facebook.com/photo/?fbid=1040652400179688&set=pb.100027048139789.-2207520000.',
      ),
      Customer(
        id: "2",
        name: 'kareem',
        email: 'kemo@example.com',
        emailId: '2',
        phone: '0120899442',
        profilePictureUrl:
            'https://www.facebook.com/photo/?fbid=1082556249322636&set=pb.100027048139789.-2207520000.',
      ),
      Customer(
        id: "3",
        emailId: '3',
        name: 'koky',
        email: 'kookeee@example.com',
        phone: '01552399078',
        profilePictureUrl:
            'https://www.facebook.com/photo/?fbid=767244004187197&set=pb.100027048139789.-2207520000.',
      ),
      Customer(
        id: "1",
        name: 'shady',
        email: 'shady@example.com',
        phone: '01206658095',
        emailId: '1',
        profilePictureUrl:
            'https://www.facebook.com/photo/?fbid=1040652400179688&set=pb.100027048139789.-2207520000.',
      ),
    ];
  }
}
