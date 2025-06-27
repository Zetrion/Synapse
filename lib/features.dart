import 'package:flutter/material.dart';

class FeaturesPage extends StatefulWidget {
  const FeaturesPage({Key? key}) : super(key: key);

  @override
  State<FeaturesPage> createState() => _FeaturesPageState();
}

class _FeatureItem {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color iconColor;

  _FeatureItem({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.iconColor,
  });
}

class _FeaturesPageState extends State<FeaturesPage> {
  bool showAll = false;

  final List<_FeatureItem> features = [
    _FeatureItem(
      icon: Icons.history,
      title: 'Treatment History',
      subtitle: '',
      iconColor: Colors.blue,
    ),
    _FeatureItem(
      icon: Icons.receipt_long,
      title: 'Prescriptions',
      subtitle: '',
      iconColor: Colors.blue,
    ),
    _FeatureItem(
      icon: Icons.monitor_heart,
      title: 'Oral Health',
      subtitle: 'Tracker',
      iconColor: Colors.blue,
    ),
    _FeatureItem(
      icon: Icons.alarm,
      title: 'Remainder',
      subtitle: '',
      iconColor: Colors.blue,
    ),
    _FeatureItem(
      icon: Icons.queue,
      title: 'Virtual Queue',
      subtitle: '',
      iconColor: Colors.blue,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final visibleFeatures = showAll ? features : features.take(4).toList();

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'FEATURES OFFERED',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
              ),
            ),
            const SizedBox(height: 24),
            GridView.builder(
              shrinkWrap: true,
              primary: false,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: visibleFeatures.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                mainAxisSpacing: 32,
                crossAxisSpacing: 8,
                childAspectRatio: 0.7,
              ),
              itemBuilder: (context, index) {
                final feature = visibleFeatures[index];
                return _FeatureCard(feature: feature);
              },
            ),
            if (features.length > 4)
              Center(
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      showAll = !showAll;
                    });
                  },
                  child: Text(showAll ? 'View Less' : 'View More'),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _FeatureCard extends StatelessWidget {
  final _FeatureItem feature;
  final VoidCallback? onTap;

  const _FeatureCard({required this.feature, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap ?? () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Tapped: ${feature.title}')),
        );
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 28,
            backgroundColor: Colors.grey[200],
            child: Icon(
              feature.icon,
              size: 28,
              color: feature.iconColor,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            feature.title,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 13,
            ),
          ),
          if (feature.subtitle.isNotEmpty)
            Text(
              feature.subtitle,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 11,
                color: Colors.black87,
              ),
            ),
        ],
      ),
    );
  }
}