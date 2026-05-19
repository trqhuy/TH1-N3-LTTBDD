import 'package:flutter/material.dart';
import 'models/api_model.dart';
import 'widgets/api_card.dart';
import 'constants/app_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'API Directory Clone',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.background,
        fontFamily: 'Roboto',
      ),
      home: const ApiDirectoryScreen(),
    );
  }
}

class ApiDirectoryScreen extends StatefulWidget {
  const ApiDirectoryScreen({Key? key}) : super(key: key);

  @override
  State<ApiDirectoryScreen> createState() => _ApiDirectoryScreenState();
}

class _ApiDirectoryScreenState extends State<ApiDirectoryScreen> {
  // Original mock data
  final List<ApiModel> _allApis = [
    ApiModel(title: "Cat Facts", description: "Daily cat facts", authType: "No authorization", isHttps: true, isCors: false),
    ApiModel(title: "Cataas", description: "Cat as a service (cats pictures and gifs)", authType: "No authorization", isHttps: true, isCors: false),
    ApiModel(title: "Cats", description: "Pictures of cats from Tumblr", authType: "API key authorization", isHttps: true, isCors: false),
    ApiModel(title: "Dog Pics", description: "Pictures of dogs based on the Stanford Dogs Dataset", authType: "No authorization", isHttps: true, isCors: true),
    ApiModel(title: "Dogs", description: "Random facts and breed information about dogs", authType: "No authorization", isHttps: true, isCors: true),
    ApiModel(title: "eBird", description: "Retrieve recent or notable birding observations within a region", authType: "API key authorization", isHttps: true, isCors: false),
    ApiModel(title: "HTTP Cat", description: "Cat for every HTTP Status", authType: "No authorization", isHttps: true, isCors: true),
    ApiModel(title: "HTTP Dog", description: "Dogs for every HTTP response status code", authType: "No authorization", isHttps: true, isCors: true),
    ApiModel(title: "IUCN", description: "IUCN Red List of Threatened Species", authType: "API key authorization", isHttps: true, isCors: false),
    ApiModel(title: "MeowFacts", description: "Get random cat facts", authType: "No authorization", isHttps: true, isCors: true),
    ApiModel(title: "Movebank", description: "Animal tracking data from Movebank", authType: "No authorization", isHttps: true, isCors: true),
    ApiModel(title: "Petfinder", description: "Pet adoption", authType: "API key authorization", isHttps: true, isCors: true),
  ];

  late List<ApiModel> _filteredApis;
  final TextEditingController _searchController = TextEditingController();
  String _currentSort = 'Default';

  @override
  void initState() {
    super.initState();
    _filteredApis = List.from(_allApis);
  }

  void _filterApis(String query) {
    setState(() {
      _filteredApis = _allApis
          .where((api) =>
              api.title.toLowerCase().contains(query.toLowerCase()) ||
              api.description.toLowerCase().contains(query.toLowerCase()))
          .toList();
      _applySort(_currentSort);
    });
  }

  void _shuffleApis() {
    setState(() {
      _filteredApis.shuffle();
    });
  }

  void _resetApis() {
    setState(() {
      _searchController.clear();
      _currentSort = 'Default';
      _filteredApis = List.from(_allApis);
    });
  }

  void _applySort(String? value) {
    if (value == null) return;
    setState(() {
      _currentSort = value;
      if (_currentSort == 'A-Z') {
        _filteredApis.sort((a, b) => a.title.compareTo(b.title));
      } else if (_currentSort == 'Z-A') {
        _filteredApis.sort((a, b) => b.title.compareTo(a.title));
      } else if (_currentSort == 'Default') {
        // Simple way to reset order based on original list filtered by search
        String query = _searchController.text;
        _filteredApis = _allApis
            .where((api) =>
                api.title.toLowerCase().contains(query.toLowerCase()) ||
                api.description.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 1. Top Navigation Bar
            Container(
              height: 70,
              padding: const EdgeInsets.symmetric(horizontal: 40),
              color: AppColors.primaryDark,
              child: Row(
                children: [
                  const Icon(Icons.flash_on, color: AppColors.emerald),
                  const SizedBox(width: 8),
                  const Text("Home", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
                  const Spacer(),
                  const Text("Browse APIs", style: TextStyle(color: Colors.white, fontSize: 16)),
                  const Spacer(),
                  const Icon(Icons.code, color: Colors.white),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // 2. Search & Filter Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                children: [
                  Wrap(
                    spacing: 20,
                    runSpacing: 10,
                    alignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      // Search TextField
                      SizedBox(
                        width: 250,
                        height: 45,
                        child: TextField(
                          controller: _searchController,
                          onChanged: _filterApis,
                          decoration: InputDecoration(
                            hintText: "Search APIs",
                            fillColor: Colors.white,
                            filled: true,
                            contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide.none,
                            ),
                            suffixIcon: _searchController.text.isNotEmpty 
                              ? IconButton(
                                  icon: const Icon(Icons.clear, size: 20),
                                  onPressed: _resetApis,
                                )
                              : null,
                          ),
                        ),
                      ),
                      
                      // Sort Dropdown
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: _currentSort,
                            icon: const Icon(Icons.arrow_drop_down),
                            style: const TextStyle(color: AppColors.textDark, fontSize: 14),
                            onChanged: _applySort,
                            items: <String>['Default', 'A-Z', 'Z-A']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value == 'Default' ? "Sort by:" : value),
                              );
                            }).toList(),
                          ),
                        ),
                      ),

                      // Shuffle Button
                      InkWell(
                        onTap: _shuffleApis,
                        child: _buildActionButton("Shuffle", Icons.shuffle),
                      ),

                      // Reset Button
                      InkWell(
                        onTap: _resetApis,
                        child: _buildActionButton("Reset", Icons.refresh),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Text(
                    "${_filteredApis.length} results found – click to refresh",
                    style: const TextStyle(color: AppColors.textGray, fontSize: 14),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // 3. Category Header
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
              decoration: BoxDecoration(
                color: AppColors.secondaryDark,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                "Animals",
                style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),

            const SizedBox(height: 40),

            // 4. Responsive Content Grid
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  int crossAxisCount = 4;
                  if (constraints.maxWidth < 600) {
                    crossAxisCount = 1;
                  } else if (constraints.maxWidth < 1000) {
                    crossAxisCount = 2;
                  } else if (constraints.maxWidth < 1400) {
                    crossAxisCount = 3;
                  }

                  if (_filteredApis.isEmpty) {
                    return const Center(
                      child: Padding(
                        padding: EdgeInsets.all(40.0),
                        child: Text("No APIs found matching your search."),
                      ),
                    );
                  }

                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      crossAxisSpacing: 25,
                      mainAxisSpacing: 25,
                      childAspectRatio: 1.1,
                    ),
                    itemCount: _filteredApis.length,
                    itemBuilder: (context, index) {
                      return ApiCard(apiData: _filteredApis[index]);
                    },
                  );
                },
              ),
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppColors.secondaryDark,
        child: const Icon(Icons.question_mark, color: Colors.white),
      ),
    );
  }

  Widget _buildActionButton(String label, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(label, style: const TextStyle(fontSize: 14)),
          const SizedBox(width: 4),
          Icon(icon, size: 18),
        ],
      ),
    );
  }
}
