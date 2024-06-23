import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:thred/constants/gaps.dart';
import 'package:thred/constants/sizes.dart';
import 'package:thred/main_navigation/widget/video_comments.dart';

class VideoRecordingScreen extends StatefulWidget {
  const VideoRecordingScreen({super.key});

  @override
  State<VideoRecordingScreen> createState() => _VideoRecordingScreenState();
}

class _VideoRecordingScreenState extends State<VideoRecordingScreen> {
  bool _hasPermission = false;

  bool _isSelfieMode = false;

  late FlashMode _flashMode;

  late CameraController _cameraController;

  Future<void> initCamera() async {
    final cameras = await availableCameras();

    if (cameras.isEmpty) {
      return;
    }

    _cameraController = CameraController(
      cameras[_isSelfieMode ? 0 : 1],
      ResolutionPreset.ultraHigh,
      enableAudio: false,
    );
    await _cameraController.initialize();
    await _cameraController.prepareForVideoRecording();

    _flashMode = _cameraController.value.flashMode;
  }

  Future<void> initPermissions() async {
    final cameraPermission = await Permission.camera.request();
    final micPermission = await Permission.microphone.request();

    final cameraDenied =
        cameraPermission.isDenied || cameraPermission.isPermanentlyDenied;

    final micDenied =
        micPermission.isDenied || micPermission.isPermanentlyDenied;

    if (!cameraDenied && !micDenied) {
      _hasPermission = true;
      await initCamera();
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    initPermissions();
  }

  Future<void> _toggleSelfieMode() async {
    _isSelfieMode = !_isSelfieMode;
    await initCamera();
    setState(() {});
  }

  Future<void> _setFlashMode(FlashMode newFlashMode) async {
    await _cameraController.setFlashMode(newFlashMode);
    _flashMode = newFlashMode;
    setState(() {});
  }

  Future<void> _takePicture() async {
    try {
      final image = await _cameraController.takePicture();
      final path = image.path;

      // 사진이 찍힌 후에 할 작업을 여기에 추가 (예: 갤러리에 저장, 서버에 업로드 등)
      print('Picture saved to $path');

      // 예: 사진을 저장하고 갤러리로 이동
      // await GallerySaver.saveImage(path);
      await GallerySaver.saveImage(path);
      // UI 갱신 (예: 사진을 보여주기 위해 새로운 화면으로 이동)
      setState(() {
        // 사진을 저장하고 갤러리로 이동하거나 UI를 업데이트할 수 있습니다.
      });
    } catch (e) {
      print('Error occurred while taking picture: $e');
    }
  }

  Future<void> _onPickPicturePressed() async {
    final image = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (image == null) return;
    if (!mounted) return;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => VideoComments(
          image: image,
          isPicked: true,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: Container(
        clipBehavior: Clip.hardEdge,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(
              Sizes.size14,
            ),
            bottomRight: Radius.circular(
              Sizes.size14,
            ),
          ),
        ),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: !_hasPermission || !_cameraController.value.isInitialized
            ? const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Initializing...",
                    style:
                        TextStyle(color: Colors.white, fontSize: Sizes.size20),
                  ),
                  Gaps.v20,
                  CircularProgressIndicator.adaptive()
                ],
              )
            : Stack(
                alignment: Alignment.center,
                children: [
                  CameraPreview(_cameraController),
                  Positioned(
                    bottom: Sizes.size32,
                    right: Sizes.size24,
                    child: Column(
                      children: [
                        IconButton(
                          color: Colors.white,
                          onPressed: _toggleSelfieMode,
                          icon: const Icon(
                            Icons.cameraswitch,
                            size: Sizes.size32,
                          ),
                        ),
                        Gaps.v14,
                        IconButton(
                          color: _flashMode == FlashMode.off
                              ? Colors.amber.shade200
                              : Colors.white,
                          onPressed: () => _setFlashMode(FlashMode.off),
                          icon: const Icon(
                            Icons.flash_off_rounded,
                            size: Sizes.size32,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: Sizes.size40,
                    child: GestureDetector(
                      onTap: _takePicture,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          CircularProgressIndicator(
                            color: Colors.red.shade400,
                            strokeWidth: Sizes.size6,
                          ),
                          Container(
                            width: Sizes.size80,
                            height: Sizes.size80,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.red.shade400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: Sizes.size24,
                    bottom: Sizes.size24,
                    child: IconButton(
                        onPressed: _onPickPicturePressed,
                        icon: const FaIcon(
                          FontAwesomeIcons.image,
                          color: Colors.white,
                        ),),
                  ),
                ],
              ),
      ),
    );
  }
}
