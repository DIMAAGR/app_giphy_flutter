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

  final _$languageAtom = Atom(name: '_AppGiphyApi.language');

  @override
  String get language {
    _$languageAtom.reportRead();
    return super.language;
  }

  @override
  set language(String value) {
    _$languageAtom.reportWrite(value, super.language, () {
      super.language = value;
    });
  }

  final _$searchHistoryAtom = Atom(name: '_AppGiphyApi.searchHistory');

  @override
  List<String> get searchHistory {
    _$searchHistoryAtom.reportRead();
    return super.searchHistory;
  }

  @override
  set searchHistory(List<String> value) {
    _$searchHistoryAtom.reportWrite(value, super.searchHistory, () {
      super.searchHistory = value;
    });
  }

  final _$gifPropertyAtom = Atom(name: '_AppGiphyApi.gifProperty');

  @override
  GifProperty get gifProperty {
    _$gifPropertyAtom.reportRead();
    return super.gifProperty;
  }

  @override
  set gifProperty(GifProperty value) {
    _$gifPropertyAtom.reportWrite(value, super.gifProperty, () {
      super.gifProperty = value;
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
  void changeGif(GifProperty gif) {
    final _$actionInfo = _$_AppGiphyApiActionController.startAction(
        name: '_AppGiphyApi.changeGif');
    try {
      return super.changeGif(gif);
    } finally {
      _$_AppGiphyApiActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addHistory(String search) {
    final _$actionInfo = _$_AppGiphyApiActionController.startAction(
        name: '_AppGiphyApi.addHistory');
    try {
      return super.addHistory(search);
    } finally {
      _$_AppGiphyApiActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeHistory(String search) {
    final _$actionInfo = _$_AppGiphyApiActionController.startAction(
        name: '_AppGiphyApi.removeHistory');
    try {
      return super.removeHistory(search);
    } finally {
      _$_AppGiphyApiActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearHistory() {
    final _$actionInfo = _$_AppGiphyApiActionController.startAction(
        name: '_AppGiphyApi.clearHistory');
    try {
      return super.clearHistory();
    } finally {
      _$_AppGiphyApiActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeLanguage(String language) {
    final _$actionInfo = _$_AppGiphyApiActionController.startAction(
        name: '_AppGiphyApi.changeLanguage');
    try {
      return super.changeLanguage(language);
    } finally {
      _$_AppGiphyApiActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
search: ${search},
topic: ${topic},
language: ${language},
searchHistory: ${searchHistory},
gifProperty: ${gifProperty}
    ''';
  }
}
