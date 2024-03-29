import 'dart:convert';

import 'package:logging/logging.dart';
import 'package:my24_flutter_core/api/base_crud.dart';
import 'models.dart';

final log = Logger('member_models.private_api');

class PrivateMemberApi extends BaseCrud<PrivateMember, PrivateMembers> {
  @override
  get basePath {
    return "/member/member";
  }

  @override
  PrivateMember fromJsonDetail(Map<String, dynamic>? parsedJson) {
    return PrivateMember.fromJson(parsedJson!);
  }

  @override
  PrivateMembers fromJsonList(Map<String, dynamic>? parsedJson) {
    return PrivateMembers.fromJson(parsedJson!);
  }

  Future<Map<String, dynamic>?> fetchSettings() async {
    final String response = await super.getListResponseBody(
        basePathAddition: 'get_my_settings/');

    return json.decode(response);
  }
}
