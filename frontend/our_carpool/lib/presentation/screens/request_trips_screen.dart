import 'package:flutter/material.dart';
import 'package:our_carpool/business/user_manager.dart';
import 'package:our_carpool/data/model/trip-service/request.dart';
import 'package:our_carpool/domain/trip-service/request_domain.dart';
import 'package:our_carpool/domain/user_domain.dart';
import 'package:our_carpool/presentation/widgets/request_trips_item.dart';
import 'package:our_carpool/utils/colors.dart';
import 'package:provider/provider.dart';

class RequestTripsScreen extends StatefulWidget {
  const RequestTripsScreen({Key? key}) : super(key: key);

  @override
  State<RequestTripsScreen> createState() => _RequestTripsScreenState();
}

class _RequestTripsScreenState extends State<RequestTripsScreen> {
  List<Request> requestsOfDriver = List.empty();
  final UserDomain userDomain = UserDomain();

  _getRequestsDriver() {
    RequestDomain requestDomain = RequestDomain();
    int idDri = context.read<UserManager>().user.id;
    requestDomain.getByIdDri(idDri).then((value) {
      setState(() {
        requestsOfDriver = value;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    // _userManager = context.read<UserManager>();
    _getRequestsDriver();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back),
              ),
              const Center(
                child: Text(
                  'Request',
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
              ),
              const SizedBox(height: 8.0),
              const Divider(height: 5, color: AppColors.dividerColor),
              ListView.builder(
                shrinkWrap: true,
                itemCount: requestsOfDriver.length,
                itemBuilder: (context, index) {
                  final request = requestsOfDriver[index];
                  return RequestTripsItem(request: request);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
