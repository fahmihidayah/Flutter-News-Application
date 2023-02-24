import 'dart:convert';
import 'dart:io';

import 'package:news_app/data/models/article.dart';
import 'package:news_app/data/models/base_response.dart';
import 'package:news_app/data/models/user.dart';
String fixture(String name) => File('test/fixtures/$name').readAsStringSync();