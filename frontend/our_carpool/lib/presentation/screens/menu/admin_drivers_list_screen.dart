import 'package:flutter/material.dart';
import 'package:our_carpool/data/model/driver_request.dart';
import 'package:our_carpool/domain/driver_request_domain.dart';
import '../../../utils/colors.dart';
import '../../widgets/driver_list_item.dart';

class AdminDriversListScreen extends StatefulWidget {
  const AdminDriversListScreen({Key? key}) : super(key: key);

  @override
  State<AdminDriversListScreen> createState() => _AdminDriversListScreenState();
}

class _AdminDriversListScreenState extends State<AdminDriversListScreen> {
  // late UserManager _userManager;
  List<DriverRequest> _drivers = List.empty();

  _getDriversRequests() {
    DriverRequestDomain driverRequestDomain = DriverRequestDomain();
    driverRequestDomain.getAllPending().then((value) {
      setState(() {
        _drivers = value;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    // _userManager = context.read<UserManager>();
    _getDriversRequests();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const Divider(height: 5, color: AppColors.dividerColor),
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton.icon(
                  onPressed: () {
                    // TODO: lógica para ordenar los conductores
                  },
                  label: const Text(
                    'Oldest',
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.grayColor,
                    ),
                  ),
                  icon: const Icon(
                    Icons.arrow_downward,
                    color: AppColors.grayColor,
                  ),
                ),
              ),
              const Divider(height: 5, color: AppColors.dividerColor),
              ListView.builder(
                shrinkWrap: true,
                itemCount: _drivers.length,
                itemBuilder: (context, index) {
                  final driver = _drivers[index];
                  return DriverListItem(driverRequest: driver);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
