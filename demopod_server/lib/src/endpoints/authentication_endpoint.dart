import 'package:demopod_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class AuthenticationEndpoint extends Endpoint {
  Future<bool> signUp(Session session, User user, String password) async {
    user.password = password;
    user.registerDate = DateTime.now();
    user.lastModified = DateTime.now();
    user.lastLoginDate = DateTime.now();
    await User.insert(session, user);
    return checkUserExistbyEmail(session, user.email);
  }

  Future<AuthModel> login(
      Session session, String email, String password) async {
    User? user = await User.findSingleRow(
      session,
      where: (t) => t.email.equals(email),
    );
    if (user != null) {
      if (password == user.password) {
        await updateLastLogin(session, user.id!);
        return AuthModel(success: true, message: 'Success', data: user);
      } else {
        return AuthModel(
            success: false, message: 'Invalid credentials combination');
      }
    } else {
      return AuthModel(
          success: false,
          message:
              'We couldn\'t find user with the email address entered, If you are new try signup');
    }
  }

  Future<bool> checkUserExistbyEmail(Session session, String email) async {
    return await User.findSingleRow(
          session,
          where: (t) => t.email.equals(email),
        ) !=
        null;
  }

  Future updateLastLogin(Session session, int id, [DateTime? dateTime]) async {
    User? user = await User.findById(session, id);
    if (user != null) {
      user.lastLoginDate = DateTime.now();
      User.update(session, user);
    }
    // return session.db.query(
    //     'UPDATE userdata SET "lastLoginDate" = ${dateTime ?? DateTime.now()} where id = $id');
  }
}
