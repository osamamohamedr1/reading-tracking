import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:external_path/external_path.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:reading_tracker/core/helpers/failure.dart';

class BooksRepo {
  List<String> pdfFiles = [];
  Future<Either<Failure, List<String>>> getAllPdfFiles() async {
    pdfFiles.clear();
    DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    AndroidDeviceInfo androidDeviceInfo = await deviceInfoPlugin.androidInfo;
    if (androidDeviceInfo.version.sdkInt < 30) {
      PermissionStatus permissionStatus = await Permission.storage.request();
      if (permissionStatus.isGranted) {
        var downloadsPath = await ExternalPath.getExternalStorageDirectories();
        var documentsPath =
            await ExternalPath.getExternalStoragePublicDirectory(
                ExternalPath.DIRECTORY_DOCUMENTS);

        await scanFiles(downloadsPath!.first);
        // await scanFiles(documentsPath);
        return right(pdfFiles);
      } else {
        return left(Failure(errorMessage: 'no permission'));
      }
    } else {
      PermissionStatus permissionStatus =
          await Permission.manageExternalStorage.request();
      if (permissionStatus.isGranted) {
        var downloadsPath = await ExternalPath.getExternalStorageDirectories();
        var documentsPath =
            await ExternalPath.getExternalStoragePublicDirectory(
                ExternalPath.DIRECTORY_DOCUMENTS);

        await scanFiles(downloadsPath!.first);
        // await scanFiles(documentsPath);
        return right(pdfFiles);
      } else {
        return left(Failure(errorMessage: 'no permission'));
      }
    }
  }

  ////
  Future<void> scanFiles(String directoryPath) async {
    try {
      var rootDirectory = Directory(directoryPath);
      var directories = rootDirectory.listSync(recursive: false);
      for (var element in directories) {
        if (element is File) {
          if (element.path.split(".").last == "pdf") {
            pdfFiles.add(element.path);
          }
        } else {
          await scanFiles(element.path);
        }
      }
    } catch (e) {}
  }
}
