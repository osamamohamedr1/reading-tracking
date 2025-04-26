import 'package:flutter/material.dart';

extension Navigation on BuildContext {
  Future<dynamic> pushNamed(String routeName, {Object? arrguments}) {
    return Navigator.of(this).pushNamed(routeName, arguments: arrguments);
  }

  Future<dynamic> pushReplacementNamed(String routeName, {Object? arrguments}) {
    return Navigator.of(this)
        .pushReplacementNamed(routeName, arguments: arrguments);
  }

  Future<dynamic> pushNamedAndRemoveUntil(String routeName,
      {Object? arrguments, required RoutePredicate predicate}) {
    return Navigator.of(this)
        .pushNamedAndRemoveUntil(routeName, predicate, arguments: arrguments);
  }

  void pop() {
    return Navigator.of(this).pop();
  }
}
