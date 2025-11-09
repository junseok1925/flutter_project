// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(DetailViewModel)
const detailViewModelProvider = DetailViewModelFamily._();

final class DetailViewModelProvider
    extends $NotifierProvider<DetailViewModel, Post?> {
  const DetailViewModelProvider._({
    required DetailViewModelFamily super.from,
    required Post super.argument,
  }) : super(
         retry: null,
         name: r'detailViewModelProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$detailViewModelHash();

  @override
  String toString() {
    return r'detailViewModelProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  DetailViewModel create() => DetailViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Post? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Post?>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is DetailViewModelProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$detailViewModelHash() => r'0cb77bb124c85aaa63c1a01e5a3c7fe809aa330c';

final class DetailViewModelFamily extends $Family
    with $ClassFamilyOverride<DetailViewModel, Post?, Post?, Post?, Post> {
  const DetailViewModelFamily._()
    : super(
        retry: null,
        name: r'detailViewModelProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  DetailViewModelProvider call(Post post) =>
      DetailViewModelProvider._(argument: post, from: this);

  @override
  String toString() => r'detailViewModelProvider';
}

abstract class _$DetailViewModel extends $Notifier<Post?> {
  late final _$args = ref.$arg as Post;
  Post get post => _$args;

  Post? build(Post post);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref = this.ref as $Ref<Post?, Post?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Post?, Post?>,
              Post?,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
