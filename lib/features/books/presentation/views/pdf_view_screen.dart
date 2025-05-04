import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfViewScreen extends StatefulWidget {
  const PdfViewScreen({super.key, required this.path});
  final String path;

  @override
  State<PdfViewScreen> createState() => _PdfViewScreenState();
}

class _PdfViewScreenState extends State<PdfViewScreen>
    with AutomaticKeepAliveClientMixin {
  Uint8List? pdfBytes;
  bool showAppBar = false;

  // Future<void> loadPdf() async {
  //   pdfBytes = await compute(
  //       (String path) => File(path).readAsBytesSync(), widget.path);
  //   setState(() {});
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   loadPdf();
  // }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      appBar: showAppBar
          ? AppBar(
              backgroundColor: Colors.white,
              title: Text(widget.path.split("/").last),
            )
          : null,
      body: SafeArea(
        child:
            //  PDFView(
            //   filePath: widget.path,
            //   enableSwipe: true,
            //   swipeHorizontal: false,
            //   autoSpacing: false,
            //   fitPolicy: FitPolicy.WIDTH,
            //   pageSnap: false,
            //   fitEachPage: true,
            //   pageFling: false,
            //   backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            // ),
            SfPdfViewer.file(
          File(widget.path),
          canShowScrollHead: false,
          pageLayoutMode: PdfPageLayoutMode.continuous,
          canShowScrollStatus: false,
          enableDoubleTapZooming: false,
          canShowPageLoadingIndicator: false,
          enableTextSelection: true,
          onTap: (details) {
            setState(() {
              showAppBar = !showAppBar;
            });
          },
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
