// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'write_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(WriteViewModel)
const writeViewModelProvider = WriteViewModelFamily._();

final class WriteViewModelProvider
    extends $NotifierProvider<WriteViewModel, WritePageState> {
  const WriteViewModelProvider._({
    required WriteViewModelFamily super.from,
    required Post? super.argument,
  }) : super(
         retry: null,
         name: r'writeViewModelProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$writeViewModelHash();

  @override
  String toString() {
    return r'writeViewModelProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  WriteViewModel create() => WriteViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(WritePageState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<WritePageState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is WriteViewModelProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$writeViewModelHash() => r'd9dd5a1e276c4bc0975ea906a8988dae1719aea5';

final class WriteViewModelFamily extends $Family
    with
        $ClassFamilyOverride<
          WriteViewModel,
          WritePageState,
          WritePageState,
          WritePageState,
          Post?
        > {
  const WriteViewModelFamily._()
    : super(
        retry: null,
        name: r'writeViewModelProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  WriteViewModelProvider call(Post? post) =>
      WriteViewModelProvider._(argument: post, from: this);

  @override
  String toString() => r'writeViewModelProvider';
}

abstract class _$WriteViewModel extends $Notifier<WritePageState> {
  late final _$args = ref.$arg as Post?;
  Post? get post => _$args;

  WritePageState build(Post? post);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref = this.ref as $Ref<WritePageState, WritePageState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<WritePageState, WritePageState>,
              WritePageState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
