import 'dart:convert';

import 'package:logging/logging.dart';
import 'package:my24_flutter_core/api/base_crud.dart';
import 'package:my24_flutter_core/i18n.dart';

import 'models.dart';

final log = Logger('member_models.public_api');

class MemberListPublicApi extends BaseCrud<Member, Members> {
  @override
  get basePath {
    return "/member/list-public";
  }

  @override
  Member fromJsonDetail(Map<String, dynamic>? parsedJson) {
    return Member.fromJson(parsedJson!);
  }

  @override
  Members fromJsonList(Map<String, dynamic>? parsedJson) {
    return Members.fromJson(parsedJson!);
  }
}

class MemberListPublicBranchesApi extends BaseCrud<Member, Members> {
  @override
  get basePath {
    return "/member/list-public-branches";
  }

  Future<List<Member>> search(String query) async {
    Members result = await list(filters: {'q': query}, needsAuth: false);
    return result.results!;
  }

  @override
  Member fromJsonDetail(Map<String, dynamic>? parsedJson) {
    return Member.fromJson(parsedJson!);
  }

  @override
  Members fromJsonList(Map<String, dynamic>? parsedJson) {
    return Members.fromJson(parsedJson!);
  }
}

class MemberDetailPublicApi extends BaseCrud<Member, Members> {
  @override
  get basePath {
    return "/member/detail-public"; //current-detail-public
  }

  @override
  Member fromJsonDetail(Map<String, dynamic>? parsedJson) {
    return Member.fromJson(parsedJson!);
  }

  @override
  Members fromJsonList(Map<String, dynamic>? parsedJson) {
    return Members.fromJson(parsedJson!);
  }
}

class MemberByCompanycodePublicApi extends BaseCrud<Member, Members> {
  @override
  get basePath {
    return "/member/detail-public-companycode";
  }

  @override
  Member fromJsonDetail(Map<String, dynamic>? parsedJson) {
  return Member.fromJson(parsedJson!);
  }

  @override
  Members fromJsonList(Map<String, dynamic>? parsedJson) {
  return Members.fromJson(parsedJson!);
  }
}
