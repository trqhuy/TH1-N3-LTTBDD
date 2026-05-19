import 'package:flutter/material.dart';
import '../models/api_model.dart';
import '../constants/app_colors.dart';

class ApiCard extends StatelessWidget {
  final ApiModel apiData;

  const ApiCard({Key? key, required this.apiData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Colors for badges based on status
    Color authColor = apiData.authType == "No authorization" ? AppColors.emerald : AppColors.skyBlue;
    Color httpsColor = apiData.isHttps ? AppColors.emerald : AppColors.sunsetRed;
    Color corsColor = apiData.isCors ? AppColors.emerald : AppColors.sunsetRed;

    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // API Title
          Text(
            apiData.title,
            style: const TextStyle(
              fontSize: 20, 
              fontWeight: FontWeight.bold, 
              color: AppColors.textDark,
            ),
          ),
          const SizedBox(height: 6),
          // API Description (Italic)
          Text(
            apiData.description,
            style: const TextStyle(
              fontSize: 14, 
              fontStyle: FontStyle.italic, 
              color: AppColors.textGray,
            ),
          ),
          const Spacer(),
          
          // Status information rows
          _buildStatusRow(apiData.authType, authColor),
          const SizedBox(height: 10),
          _buildStatusRow("HTTPS available", httpsColor),
          const SizedBox(height: 10),
          _buildStatusRow(apiData.isCors ? "CORS available" : "CORS unavailable", corsColor),
        ],
      ),
    );
  }

  Widget _buildStatusRow(String label, Color badgeColor) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Text(
            label, 
            style: const TextStyle(fontSize: 14, color: Color(0xFF333333)),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const SizedBox(width: 8),
        Container(
          width: 35,
          height: 20,
          decoration: BoxDecoration(
            color: badgeColor,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ],
    );
  }
}
