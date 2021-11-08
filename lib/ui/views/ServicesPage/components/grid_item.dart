import 'package:flutter/material.dart';
import 'package:service_creed/models/service_category.dart';
import 'package:service_creed/ui/views/services_list_view/services_list_view.dart';

class GridItem extends StatelessWidget {
  final ServiceCategory category;

  const GridItem({
    @required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (BuildContext context) =>
              ServicesListWidget(category: category),
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              elevation: 5,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: NetworkImage(category.url),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            '${category.id} ${category.label}',
          ),
        ],
      ),
    );
  }
}
