import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';
import 'package:rxdart/rxdart.dart';

typedef PaginationRequestCallback<T> = Stream<T?> Function(
    RequestPagination request);

typedef PaginationRequestCallbackFuture<T> = Future<List<T>?> Function(
    RequestPagination request);

class PaginationListController<T> {
  final PaginationRequestCallback<T> requestCallback;
  final int pageSize;
  final Stream<dynamic>? refresher;
  final Stream<dynamic>? refresherDebounce;

  StreamSubscription? _sub;

  PaginationListController._({
    required this.requestCallback,
    this.pageSize = 10,
    this.refresher,
    this.refresherDebounce,
  }) {
    assert(T != dynamic,
        'T must be specify explicity, e.g PaginationListController<YourType>');
    final streamRefresher = refresher ?? const Stream.empty();
    final streamRefresherDebounce = refresherDebounce ?? const Stream.empty();

    _sub = MergeStream([
      _reset.map((_) => true),
      streamRefresher.map((_) => true),
      streamRefresherDebounce
          .debounceTime(const Duration(milliseconds: 350))
          .map((_) => true),
      _loadMore
          .throttleTime(const Duration(milliseconds: 80))
          .where((event) => items.length >= pageSize)
          .map((_) => false),
    ]).asyncExpand((event) async* {
      if (event) {
        runInAction(() => items.clear());
      }

      if (items.isEmpty) {
        runInAction(() => state.value = const StateValue.loading());
      } else {
        runInAction(() => loadMoreLoading.value = true);
      }

      final page = (items.length / pageSize).ceil();
      final request = RequestPagination()
        ..page = page
        ..take = pageSize;

      final resultStream = requestCallback(request);
      final result = await resultStream.toList();

      runInAction(() {
        items.addAll(result.whereType());
        state.value = items.isEmpty
            ? const StateValue.empty()
            : const StateValue.success();
        loadMoreLoading.value = false;
      });

      yield null;
    }).handleError((e) {
      runInAction(() {
        if (items.isEmpty) {
          state.value = StateValue.error(e.toString());
        }
        loadMoreLoading.value = false;
      });
      if (kDebugMode) {
        print(e);
      }
    }).listen(null);
  }

  void dispose() {
    _sub?.cancel();
  }

  static PaginationListController<T> fromFuture<T>({
    required PaginationRequestCallbackFuture<T> handler,
    Stream? refresher,
    Stream? refresherDebounce,
    int pageSize = 10,
  }) {
    return PaginationListController._(
      requestCallback: (r) async* {
        final result = await handler(r);
        if (result != null) {
          for (var element in result) {
            yield element;
          }
        }
      },
      pageSize: pageSize,
      refresher: refresher,
      refresherDebounce: refresherDebounce,
    );
  }

  static PaginationListController<T> fromStream<T>({
    required PaginationRequestCallback<T> handler,
    Stream? refresher,
    Stream? refresherDebounce,
    int pageSize = 10,
    int bufferLength = 0,
  }) {
    return PaginationListController._(
      requestCallback: handler,
      pageSize: pageSize,
      refresher: refresher,
      refresherDebounce: refresherDebounce,
    );
  }

  final state = Observable<StateValue>(const StateValue.none());
  late final isLoading =
      Computed(() => state.value is StateNone || state.value is StateLoading);

  final items = ObservableList<T>();

  final _reset = PublishSubject();
  final _loadMore = PublishSubject();

  void reset() {
    _reset.add(null);
  }

  void loadMore() {
    _loadMore.add(null);
  }

  final loadMoreLoading = Observable<bool>(false);
}

abstract class StateValue {
  const StateValue._();
  const factory StateValue.none() = StateNone;
  const factory StateValue.loading() = StateLoading;
  const factory StateValue.error(String? message) = StateError;
  const factory StateValue.empty() = StateEmpty;
  const factory StateValue.success() = StateSuccess;
}

class StateNone extends StateValue {
  const StateNone() : super._();
}

class StateLoading extends StateValue {
  const StateLoading() : super._();
}

class StateError extends StateValue {
  final String? message;
  const StateError(this.message) : super._();
}

class StateEmpty extends StateValue {
  const StateEmpty() : super._();
}

class StateSuccess extends StateValue {
  const StateSuccess() : super._();
}

class RequestPagination {
  late int page;
  late int take;
}
