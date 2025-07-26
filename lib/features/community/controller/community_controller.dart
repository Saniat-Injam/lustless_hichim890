import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:lustless_hichim890/core/common/styles/global_text_style.dart';
import 'package:lustless_hichim890/core/common/widgets/custom_button.dart';
import 'package:lustless_hichim890/core/common/widgets/custom_color.dart';
import 'package:lustless_hichim890/core/utils/constants/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CommunityController extends GetxController {
  TextEditingController commentController = TextEditingController();
  TextEditingController replyController = TextEditingController();
  var likeStatus = <String, bool>{}.obs;
  var selectedComment = {}.obs;
  var communityData = <Map<String, dynamic>>[].obs;
  var errorMessage = ''.obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchComments();
  }

  Future<void> fetchComments() async {
    try {
      isLoading.value = true;
      errorMessage.value = '';
      final prefs = await SharedPreferences.getInstance();
      final String? token = prefs.getString('access_token');
      if (token == null) {
        errorMessage.value = 'Please log in to view comments';
        await EasyLoading.showError('Please log in to view comments');
        Get.offNamed('/login');
        return;
      }

      final response = await http.get(
        Uri.parse('https://hachim-backend-1.onrender.com/comments'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);
        if (responseBody['success']) {
          communityData.value =
              (responseBody['data'] as List).map((comment) {
                final replies = (comment['reply'] as List? ?? []).map((reply) {
                  return {
                    'id': reply['id']?.toString() ?? '',
                    'name': reply['user']?['userName']?.toString() ?? 'Anonymous',
                    'time': _formatDateTime(reply['createdAt']?.toString() ?? DateTime.now().toString()),
                    'descriptionText': reply['content']?.toString() ?? '',
                    'likeCount': (reply['_count']?['likes'] as int?) ?? 0,
                  };
                }).toList();
                return {
                  'id': comment['id']?.toString() ?? '',
                  'name': comment['user']?['userName']?.toString() ?? 'Anonymous',
                  'time': _formatDateTime(comment['createdAt']?.toString() ?? DateTime.now().toString()),
                  'descriptionText': comment['content']?.toString() ?? '',
                  'likeCount': (comment['_count']?['likes'] as int?) ?? 0,
                  'replies': replies,
                  'isLiked': comment['isLiked'] ?? false,
                };
              }).toList();
          // Initialize likeStatus based on isLiked from API
          for (var comment in communityData) {
            likeStatus[comment['id']] = comment['isLiked'] ?? false;
          }
          update();
        } else {
          errorMessage.value =
              'Failed to fetch comments: ${responseBody['message'] ?? 'Unknown error'}';
          await EasyLoading.showError(errorMessage.value);
        }
      } else if (response.statusCode == 401) {
        errorMessage.value = 'Session expired. Please log in again.';
        await EasyLoading.showError(errorMessage.value);
        Get.offNamed('/login');
      } else {
        errorMessage.value =
            'Failed to fetch comments (Status: ${response.statusCode})';
        await EasyLoading.showError(errorMessage.value);
      }
    } catch (e) {
      errorMessage.value = 'Error fetching comments: $e';
      await EasyLoading.showError(errorMessage.value);
    } finally {
      isLoading.value = false;
    }
  }

  String _formatDateTime(String dateTime) {
    final date = DateTime.parse(dateTime);
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inDays > 0) {
      return '${difference.inDays} days ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} hours ago';
    } else {
      return '${difference.inMinutes} minutes ago';
    }
  }

  Future<void> toggleLike(int index) async {
    if (index < 0 || index >= communityData.length) return;

    final commentId = communityData[index]['id'];
    final prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('access_token');

    if (token == null) {
      await EasyLoading.showError('Please log in to like a comment');
      Get.offNamed('/login');
      return;
    }

    // Optimistically update UI
    final wasLiked = likeStatus[commentId] ?? false;
    likeStatus[commentId] = !wasLiked;
    communityData[index]['isLiked'] = !wasLiked;
    communityData[index]['likeCount'] = wasLiked
        ? (communityData[index]['likeCount'] > 0
            ? communityData[index]['likeCount'] - 1
            : 0)
        : communityData[index]['likeCount'] + 1;

    if (selectedComment['id'] == commentId) {
      selectedComment['likeCount'] = communityData[index]['likeCount'];
      selectedComment['isLiked'] = communityData[index]['isLiked'];
    }
    communityData.refresh();
    update();

    try {
      if (!wasLiked) {
        // Like the comment
        final response = await http.post(
          Uri.parse('https://hachim-backend-1.onrender.com/likes'),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          },
          body: jsonEncode({'commentId': commentId}),
        );

        if (response.statusCode != 201 && response.statusCode != 200) {
          // Revert UI changes on failure
          likeStatus[commentId] = wasLiked;
          communityData[index]['isLiked'] = wasLiked;
          communityData[index]['likeCount'] = wasLiked
              ? communityData[index]['likeCount'] + 1
              : (communityData[index]['likeCount'] > 0
                  ? communityData[index]['likeCount'] - 1
                  : 0);
          if (selectedComment['id'] == commentId) {
            selectedComment['likeCount'] = communityData[index]['likeCount'];
            selectedComment['isLiked'] = communityData[index]['isLiked'];
          }
          communityData.refresh();
          update();
          if (response.statusCode == 401) {
            await EasyLoading.showError('Session expired. Please log in again.');
            Get.offNamed('/login');
          } else {
            final responseBody = jsonDecode(response.body);
            await EasyLoading.showError(
              responseBody['message']?.toString() ??
                  'Failed to like comment (Status: ${response.statusCode})',
            );
          }
        }
      } else {
        // Unlike the comment
        final response = await http.delete(
          Uri.parse('https://hachim-backend-1.onrender.com/likes'),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          },
          body: jsonEncode({'commentId': commentId}),
        );

        if (response.statusCode != 200) {
          // Revert UI changes on failure
          likeStatus[commentId] = wasLiked;
          communityData[index]['isLiked'] = wasLiked;
          communityData[index]['likeCount'] = wasLiked
              ? communityData[index]['likeCount'] + 1
              : (communityData[index]['likeCount'] > 0
                  ? communityData[index]['likeCount'] - 1
                  : 0);
          if (selectedComment['id'] == commentId) {
            selectedComment['likeCount'] = communityData[index]['likeCount'];
            selectedComment['isLiked'] = communityData[index]['isLiked'];
          }
          communityData.refresh();
          update();
          if (response.statusCode == 401) {
            await EasyLoading.showError('Session expired. Please log in again.');
            Get.offNamed('/login');
          } else {
            final responseBody = jsonDecode(response.body);
            await EasyLoading.showError(
              responseBody['message']?.toString() ??
                  'Failed to unlike comment (Status: ${response.statusCode})',
            );
          }
        }
      }
    } catch (e) {
      // Revert UI changes on error
      likeStatus[commentId] = wasLiked;
      communityData[index]['isLiked'] = wasLiked;
      communityData[index]['likeCount'] = wasLiked
          ? communityData[index]['likeCount'] + 1
          : (communityData[index]['likeCount'] > 0
              ? communityData[index]['likeCount'] - 1
              : 0);
      if (selectedComment['id'] == commentId) {
        selectedComment['likeCount'] = communityData[index]['likeCount'];
        selectedComment['isLiked'] = communityData[index]['isLiked'];
      }
      communityData.refresh();
      update();
      await EasyLoading.showError('Error processing like: $e');
    }
  }

  void selectComment(int index) {
    if (index >= 0 && index < communityData.length) {
      selectedComment.value = Map<String, dynamic>.from(communityData[index]);
      update();
    }
  }

  Future<void> addReplyData(
    String name,
    String time,
    String replyText,
    int commentIndex,
  ) async {
    if (commentIndex < 0 || commentIndex >= communityData.length) {
      await EasyLoading.showError('Invalid comment selected');
      return;
    }

    try {
      final prefs = await SharedPreferences.getInstance();
      final String? token = prefs.getString('access_token');
      if (token == null) {
        await EasyLoading.showError('Please log in to post a reply');
        Get.offNamed('/login');
        return;
      }

      final response = await http.post(
        Uri.parse(
          'https://hachim-backend-1.onrender.com/replies',
        ),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode({
          'content': replyText,
          'commentId': communityData[commentIndex]['id'],
        }),
      );

      if (response.statusCode == 201) {
        await fetchComments();
        await EasyLoading.showSuccess('Reply posted successfully');
      } else if (response.statusCode == 401) {
        await EasyLoading.showError('Session expired. Please log in again.');
        Get.offNamed('/login');
      } else {
        final responseBody = jsonDecode(response.body);
        await EasyLoading.showError(
          responseBody['message']?.toString() ??
              'Failed to post reply (Status: ${response.statusCode})',
        );
      }
    } catch (e) {
      await EasyLoading.showError('Error posting reply: $e');
    }
  }

  Future<Map<String, dynamic>> postComment(String content, String token) async {
    try {
      final response = await http.post(
        Uri.parse('https://hachim-backend-1.onrender.com/comments'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode({"content": content}),
      );

      if (response.statusCode == 201) {
        final responseBody = jsonDecode(response.body);
        return {
          'success': true,
          'message':
              responseBody['message']?.toString() ??
              'Comment posted successfully',
          'data': responseBody['data'],
        };
      } else if (response.statusCode == 401) {
        return {
          'success': false,
          'message': 'Session expired. Please log in again.',
        };
      } else {
        final responseBody = jsonDecode(response.body);
        return {
          'success': false,
          'message':
              responseBody['message']?.toString() ??
              'Failed to post comment (Status: ${response.statusCode})',
        };
      }
    } catch (e) {
      return {'success': false, 'message': 'Error posting comment: $e'};
    }
  }

  void communityCommentBottomSheet(BuildContext context, int index) async {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        double keyboardHeight = MediaQuery.of(context).viewInsets.bottom;

        return Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: getContainerGradient(),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Comment',
                  style: getTextStylenunito(
                    fontSize: 28,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textWhite,
                  ),
                ),
                SizedBox(height: 27),
                TextFormField(
                  controller: commentController,
                  maxLines: 15,
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintText: 'Write down your thoughts........',
                    hintStyle: getTextStyle(
                      fontSize: 14,
                      color: AppColors.textWhite,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.secondary,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.secondary,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  style: getTextStyle(fontSize: 14, color: AppColors.textWhite),
                ),
                SizedBox(height: 27),
                CustomButton(
                  title: "Submit",
                  onPress: () async {
                    final commentContent = commentController.text.trim();
                    if (commentContent.isNotEmpty) {
                      await EasyLoading.show(status: 'Sending...');
                      final prefs = await SharedPreferences.getInstance();
                      final String? token = prefs.getString('access_token');
                      if (token == null) {
                        await EasyLoading.showError(
                          'Please log in to post a comment',
                        );
                        await EasyLoading.dismiss();
                        Get.offNamed('/login');
                        return;
                      }
                      final result = await postComment(commentContent, token);

                      await EasyLoading.dismiss();

                      if (result['success']) {
                        await fetchComments();
                        await EasyLoading.showSuccess(result['message']);
                        Navigator.pop(context);
                        commentController.clear();
                      } else {
                        await EasyLoading.showError(result['message']);
                        if (result['message'].contains('Please log in')) {
                          Get.offNamed('/login');
                        }
                      }
                    } else {
                      await EasyLoading.showError("Comment can't be empty.");
                    }
                  },
                ),
                SizedBox(height: keyboardHeight > 0 ? keyboardHeight : 27),
              ],
            ),
          ),
        );
      },
    );
  }

  void communityReplyBottomSheet(BuildContext context, int index) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        double keyboardHeight = MediaQuery.of(context).viewInsets.bottom;

        return Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: getContainerGradient(),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Reply',
                  style: getTextStylenunito(
                    fontSize: 28,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textWhite,
                  ),
                ),
                SizedBox(height: 27),
                TextFormField(
                  controller: replyController,
                  maxLines: 15,
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintText: 'Write down your reply........',
                    hintStyle: getTextStyle(
                      fontSize: 14,
                      color: AppColors.textWhite,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.secondary,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.secondary,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  style: getTextStyle(fontSize: 14, color: AppColors.textWhite),
                ),
                SizedBox(height: 27),
                CustomButton(
                  title: "Submit Reply",
                  onPress: () async {
                    final replyContent = replyController.text.trim();
                    if (replyContent.isNotEmpty) {
                      await EasyLoading.show(status: 'Sending...');
                      await addReplyData(
                        "User",
                        DateTime.now().toString(),
                        replyContent,
                        index,
                      );
                      await EasyLoading.dismiss();
                      Navigator.pop(context);
                      replyController.clear();
                    } else {
                      await EasyLoading.showError("Reply can't be empty.");
                    }
                  },
                ),
                SizedBox(height: keyboardHeight > 0 ? keyboardHeight : 27),
              ],
            ),
          ),
        );
      },
    );
  }
}