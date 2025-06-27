import 'package:flutter/material.dart';
import 'details_page.dart';

class CategoryGridSection extends StatefulWidget {
  final String title;
  final List<Map<String, String>> data;

  const CategoryGridSection({
    super.key,
    required this.title,
    required this.data,
  });

  @override
  State<CategoryGridSection> createState() => _CategoryGridSectionState();
}

class _CategoryGridSectionState extends State<CategoryGridSection> {
  bool showAll = false;

  @override
  Widget build(BuildContext context) {
    final displayData = showAll ? widget.data : widget.data.take(8).toList();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          GridView.builder(
            itemCount: displayData.length,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: MediaQuery.of(context).size.width > 600 ? 6 : 4,
              crossAxisSpacing: 12,
              mainAxisSpacing: 18,
              childAspectRatio: 0.75, // slightly more space for text
            ),
            itemBuilder: (context, index) {
              final item = displayData[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => DetailsPage(
                        title: item['name']!,
                        image: "",
                      ),
                    ),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 28,
                        backgroundColor: Colors.blue.shade100,
                        child: _getIconForItem(widget.title, item['name']!),
                      ),
                      const SizedBox(height: 10),
                      Expanded(
                        child: Center(
                          child: Text(
                            item['name']!,
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 12),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          if (widget.data.length > 8)
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Center(
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      showAll = !showAll;
                    });
                  },
                  child: Text(showAll ? "View Less" : "View All"),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _getIconForItem(String category, String name) {
    switch (category) {
      case 'By Specialities':
        return Icon(Icons.medical_services, color: Colors.teal.shade700, size: 26);
      case 'By Hospitals':
        return Icon(Icons.local_hospital, color: Colors.red.shade700, size: 26);
      case 'By Symptoms':
        return Icon(Icons.sick, color: Colors.orange.shade800, size: 26);
      default:
        return const Icon(Icons.help_outline);
    }
  }
}
