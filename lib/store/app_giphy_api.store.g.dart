// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_giphy_api.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AppGiphyApi on _AppGiphyApi, Store {
  final _$searchAtom = Atom(name: '_AppGiphyApi.search');

  @override
  String get search {
    _$searchAtom.reportRead();
    return super.search;
  }

  @override
  set search(String value) {
    _$searchAtom.reportWrite(value, super.search, () {
      super.search = value;
    });
  }

  final _$topicAtom = Atom(name: '_AppGiphyApi.topic');

  @override
  String get topic {
    _$topicAtom.reportRead();
    return super.topic;
  }

  @override
  set topic(String value) {
    _$topicAtom.reportWrite(value, super.topic, () {
      super.topic = value;
    });
  }

  final _$_AppGiphyApiActionController = ActionController(name: '_AppGiphyApi');

  @override
  void changeSearch(String search) {
    final _$actionInfo = _$_AppGiphyApiActionController.startAction(
        name: '_AppGiphyApi.changeSearch');
    try {
      return super.changeSearch(search);
    } finally {
      _$_AppGiphyApiActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeTopic(String topic) {
    final _$actionInfo = _$_AppGiphyApiActionController.startAction(
        name: '_AppGiphyApi.changeTopic');
    try {
      return super.changeTopic(topic);
    } finally {
      _$_AppGiphyApiActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
search: ${search},
topic: ${topic}
    ''';
  }
}
