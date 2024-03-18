import '../models/user.dart';
import '../models/verification.dart';

// Mock user data
final User mockUser = User(
  id: '1',
  name: 'Jane Doe',
  email: 'jane.doe@example.com',
  profilePictureUrl: '',
  isIdVerified: true,
  isPhoneVerified: true,
);

// Mock verification data
final Verification mockVerification = Verification(
  userId: '1',
  type: 'ID',
  status: true,
  verifiedOnDate: DateTime.now(),
);
