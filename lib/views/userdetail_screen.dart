import 'package:appscrip_users/models/user_model.dart';
import 'package:flutter/material.dart';

class UserDetailScreen extends StatelessWidget {
  final UserModel user;

  const UserDetailScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Details'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header Card
            Container(
              width: double.infinity,
              
              color: Colors.blue,
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  Hero(
                    tag: 'user_avatar_${user.id}',
                    child: CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.white,
                      child: Text(
                        user.name[0].toUpperCase(),
                        style: const TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2196F3),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    user.name,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '@${user.username}',
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),

            // Contact Information
            _buildSection(
              context,
              'Contact Information',
              Icons.contact_mail,
              [
                _buildInfoTile(
                  Icons.email,
                  'Email',
                  user.email,
                  Colors.red,
                ),
                _buildInfoTile(
                  Icons.phone,
                  'Phone',
                  user.phone,
                  Colors.green,
                ),
                _buildInfoTile(
                  Icons.language,
                  'Website',
                  user.website,
                  Colors.blue,
                ),
              ],
            ),

            // Address Information
            _buildSection(
              context,
              'Address',
              Icons.location_on,
              [
                _buildInfoTile(
                  Icons.home,
                  'Street',
                  user.address.street,
                  Colors.orange,
                ),
                _buildInfoTile(
                  Icons.apartment,
                  'Suite',
                  user.address.suite,
                  Colors.purple,
                ),
                _buildInfoTile(
                  Icons.location_city,
                  'City',
                  user.address.city,
                  Colors.teal,
                ),
                _buildInfoTile(
                  Icons.local_post_office,
                  'Zipcode',
                  user.address.zipcode,
                  Colors.indigo,
                ),
                _buildInfoTile(
                  Icons.map,
                  'Coordinates',
                  'Lat: ${user.address.geo.lat}, Lng: ${user.address.geo.lng}',
                  Colors.brown,
                ),
              ],
            ),

            // Company Information
            _buildSection(
              context,
              'Company',
              Icons.business,
              [
                _buildInfoTile(
                  Icons.business_center,
                  'Company Name',
                  user.company.name,
                  Colors.deepPurple,
                ),
                _buildInfoTile(
                  Icons.lightbulb,
                  'Catch Phrase',
                  user.company.catchPhrase,
                  Colors.amber,
                ),
                _buildInfoTile(
                  Icons.work,
                  'Business',
                  user.company.bs,
                  Colors.cyan,
                ),
              ],
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(
    BuildContext context,
    String title,
    IconData icon,
    List<Widget> children,
  ) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(icon, color: Theme.of(context).primaryColor),
                  const SizedBox(width: 8),
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              ...children,
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoTile(
    IconData icon,
    String label,
    String value,
    Color color,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              icon,
              size: 20,
              color: color,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[800],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}