import 'package:belajar_flutter/tugas14/api/get_post.dart';
import 'package:belajar_flutter/tugas14/models/post_model.dart';
//import 'package:belajar_flutter/tugas14/screens/post_detail_page.dart'; // Import your detail page
import 'package:flutter/material.dart';
//import 'package:belajar_flutter/tugas14/api/get_post.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  List<PostUsersModel> posts = [];
  List<PostUsersModel> filteredPosts = [];
  bool isLoading = true;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    _getPosts();
  }

  Future<void> _getPosts() async {
    try {
      posts = await getUsers();
      setState(() {
        filteredPosts = posts;
        isLoading = false;
      });
    } catch (error) {
      print('Error fetching posts: $error');
      setState(() {
        isLoading = false;
        errorMessage =
            'Failed to load posts. Please try again later.'; // Set error message
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Daftar Post"),
        centerTitle: true,
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
      ),
      body:
          isLoading
              ? const Center(child: CircularProgressIndicator())
              : errorMessage != null
              ? Center(child: Text(errorMessage!))
              : filteredPosts.isEmpty
              ? const Center(child: Text('No posts found.'))
              : ListView.builder(
                shrinkWrap: true,
                itemCount: filteredPosts.length,
                itemBuilder: (BuildContext context, int index) {
                  final post = filteredPosts[index];
                  return Card(
                    elevation: 4,
                    margin: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(16),
                      leading: Hero(
                        tag: post.id,
                        child: CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.blue,
                          child: Text(
                            post.userId.toString(),
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      title: Text(
                        'ID: ${post.id}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 4),
                          Text('Title: ${post.title}'),
                          Text('Body: ${post.body}'),
                        ],
                      ),
                      // onTap: () {
                      //
                      //   Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (context) => PostDetailPage(post: post),
                      //     ),
                      //   );
                      // },
                    ),
                  );
                },
              ),
    );
  }
}

// import 'package:belajar_flutter/tugas14/api/get_post.dart';
// import 'package:belajar_flutter/tugas14/models/post_model.dart';
// import 'package:flutter/material.dart';

// class PostScreen extends StatefulWidget {
//   const PostScreen({super.key});

//   @override
//   State<PostScreen> createState() => _PostScreenState();
// }

// class _PostScreenState extends State<PostScreen> {
//   List<PostUsersModel> posts = [];
//   List<PostUsersModel> filteredPosts = [];
//   bool isLoading = true;

//   @override
//   void initState() {
//     super.initState();
//     _getUsers();
//   }

//   Future<void> _getUsers() async {
//     try {
//       posts = await getUsers();
//       setState(() {
//         filteredPosts = posts;
//         isLoading = false;
//       });
//     } catch (error) {
//       print(error);
//       setState(() {
//         isLoading = false;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Daftar Post"), backgroundColor: Colors.blue),
//       body: FutureBuilder(
//         future: getUsers(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else if (snapshot.hasData) {
//             final posts = snapshot.data!;
//             return ListView.builder(
//               shrinkWrap: true,
//               itemCount: posts.length,
//               itemBuilder: (BuildContext context, int index) {
//                 final post = posts[index];
//                 return Card(
//                   elevation: 4,
//                   margin: const EdgeInsets.symmetric(
//                     horizontal: 16,
//                     vertical: 8,
//                   ),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   child: ListTile(
//                     contentPadding: const EdgeInsets.all(16),
//                     // leading:
//                     // Hero(
//                     //   tag: post.id,
//                     //   child: CircleAvatar(
//                     //     radius: 30,
//                     //     backgroundImage: NetworkImage(post.url),
//                     //     onBackgroundImageError: (exception, stackTrace) {
//                     //       print(
//                     //         'Error loading image for ID ${post.id}: $exception',
//                     //       );
//                     //     },
//                     //   ),
//                     // ),
//                     title: Text(
//                       'ID: ${post.id}',
//                       style: TextStyle(fontWeight: FontWeight.bold),
//                     ),
//                     subtitle: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         const SizedBox(height: 4),
//                         Text(post.title),
//                         Text(post.body),
//                       ],
//                     ),
//                     // onTap: () {
//                     //   Navigator.push(
//                     //     context,
//                     //     MaterialPageRoute(
//                     //       builder: (context) => PostDetailScreen(post: post),
//                     //     ),
//                     //   );
//                     // },
//                   ),
//                 );
//               },
//             );
//           }
//         },
//       ),
//     );
//   }
// }
