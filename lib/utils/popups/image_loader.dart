// import 'dart:async';
// import 'dart:typed_data';
// import 'dart:ui' as ui;
//
// import 'package:cached_network_image_platform_interface/cached_network_image_platform_interface.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_cache_manager/flutter_cache_manager.dart';
//
// class ImageLoader implements ImageLoaderPlatform {
//   @override
//   Stream<ui.Codec> loadImageAsync(
//       String url,
//       String? cacheKey,
//       StreamController<ImageChunkEvent>? chunkEvents,
//       Future<ui.Codec> Function(ImmutableBuffer, {bool allowUpscaling, int? cacheHeight, int? cacheWidth}) decode,
//       BaseCacheManager cacheManager,
//       int? maxHeight,
//       int? maxWidth,
//       Map<String, String>? headers,
//       ImageRenderMethodForWeb imageRenderMethodForWeb,
//       VoidCallback? errorListener,
//       VoidCallback? evictImage,
//       ) {
//     throw UnimplementedError();
//   }
//
//   @override
//   Stream<ui.Codec> loadBufferAsync(
//       String url,
//       String? cacheKey,
//       StreamController<ImageChunkEvent>? chunkEvents,
//       Future<ui.Codec> Function(ImmutableBuffer, {bool allowUpscaling, int? cacheHeight, int? cacheWidth})? decode,
//       BaseCacheManager cacheManager,
//       int? maxHeight,
//       int? maxWidth,
//       Map<String, String> headers,
//       ImageRenderMethodForWeb imageRenderMethodForWeb,
//       VoidCallback? evictImage,
//       ) async* {
//     try {
//       final file = await cacheManager.getSingleFile(url, headers: headers);
//       final bytes = await file.readAsBytes();
//       final decoded = await decode!(Uint8List.fromList(bytes), allowUpscaling: true, cacheHeight: maxHeight, cacheWidth: maxWidth);
//
//       if (decoded != null) {
//         yield decoded;
//       }
//     } on Object catch (e) {
//       evictImage?.call();
//       errorListener?.call();
//       rethrow;
//     } finally {
//       await chunkEvents?.close();
//     }
//   }
// }
