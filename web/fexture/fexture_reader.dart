import 'dart:io';

String fexture(String name) => File('test/fexture/$name').readAsStringSync();
