import '../models/job_model.dart';

class SampleData {
  static List<Job> jobs = [
    Job(
      title: 'Product Designer',
      company: 'Google',
      location: 'California, USA',
      salary: '\$150k - \$200k',
      logoUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Google_%22G%22_Logo.svg/1200px-Google_%22G%22_Logo.svg.png',
      tags: ['Design', 'Full-time', 'Senior'],
    ),
    Job(
      title: 'Flutter Developer',
      company: 'Airbnb',
      location: 'Remote',
      salary: '\$120k - \$160k',
      logoUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/69/Airbnb_Logo_Belo.svg/2560px-Airbnb_Logo_Belo.svg.png',
      tags: ['Mobile', 'Remote', 'Mid-level'],
    ),
    Job(
      title: 'UI/UX Researcher',
      company: 'Spotify',
      location: 'Stockholm, Sweden',
      salary: '\$90k - \$130k',
      logoUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/19/Spotify_logo_without_text.svg/2048px-Spotify_logo_without_text.svg.png',
      tags: ['Research', 'Full-time'],
    ),
    Job(
      title: 'Backend Engineer',
      company: 'Netflix',
      location: 'Los Gatos, CA',
      salary: '\$180k - \$250k',
      logoUrl: 'https://upload.wikimedia.org/wikipedia/commons/f/ff/Netflix-new-icon.png',
      tags: ['Java', 'Cloud', 'Senior'],
    ),
  ];
}
