import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front_shop/domain/models/order_pages.dart';
import 'package:front_shop/presentation/screens/Admin/menu/order_detail_screen.dart';
import 'package:front_shop/utils/constants/app_colors.dart';
import 'package:intl/intl.dart';

import '../../../../main.dart';

class ManageOrderScreen extends ConsumerStatefulWidget {
  static const String routeName = '/manage_orders';

  @override
  ConsumerState<ManageOrderScreen> createState() => _ManageOrderScreenState();
}

class _ManageOrderScreenState extends ConsumerState<ManageOrderScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<String> statuses = [
    'All',
    'Pending',
    'Processing',
    'Shipped',
    'Cancelled',
    'Completed',
  ];
  int currentPage = 0;
  final int pageSize = 5;

  String? startDate;
  String? endDate;
  String? fullName;
  String? phoneNumber;
  String? addressDetail;

  TextEditingController fullNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController addressDetailController = TextEditingController();
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: statuses.length, vsync: this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _fetchOrders();
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _fetchOrders() {
    final selectedStatus = statuses[_tabController.index];
    ref.read(orderPagesStateProvider.notifier).searchOrderPages(
          status: selectedStatus,
          startDate: startDate,
          endDate: endDate,
          fullName: fullName,
          phoneNumber: phoneNumber,
          addressDetail: addressDetail,
          page: currentPage,
          size: pageSize,
        );
  }

  @override
  Widget build(BuildContext context) {
    final orderState = ref.watch(orderPagesStateProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage Orders'),
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          onTap: (index) {
            setState(() {
              currentPage = 0;
            });
            _fetchOrders();
          },
          tabs: statuses
              .map((status) => Tab(
                    text: status,
                  ))
              .toList(),
        ),
      ),
      body: Column(
        children: [
          // Filter Section
          _buildFilterSection(),

          // Expanded Order List Section
          Expanded(
            child: orderState.when(
              data: (orderPages) => _buildOrderList(orderPages.content),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stackTrace) => Center(
                child: Text('Failed to load orders: $error'),
              ),
            ),
          ),

          // Pagination Section
          orderState.when(
            data: (orderPages) => _buildPagination(orderPages),
            loading: () => const SizedBox(),
            error: (error, stackTrace) => const SizedBox(),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterSection() {
    return Container(
      color: Colors.grey[200],
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildInputField('Full Name', fullNameController),
            _buildInputField('Phone Number', phoneNumberController),
            _buildInputField('Address Detail', addressDetailController),
            _buildDatePickerField('Start Date', startDateController, (date) {
              setState(() {
                startDate = date;
                startDateController.text = date;
              });
            }),
            const SizedBox(height: 8),
            _buildDatePickerField('End Date', endDateController, (date) {
              setState(() {
                endDate = date;
                endDateController.text = date;
              });
            }),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: _fetchOrders,
                    child: const Text('Search'),
                  ),
                  const SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        fullName = null;
                        phoneNumber = null;
                        addressDetail = null;
                        startDate = null;
                        endDate = null;

                        fullNameController.clear();
                        phoneNumberController.clear();
                        addressDetailController.clear();
                        startDateController.clear();
                        endDateController.clear();
                      });
                      _fetchOrders();
                    },
                    child: const Text('Clear Date'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputField(String label, TextEditingController controller) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(labelText: label),
    );
  }

  Widget _buildDatePickerField(String label, TextEditingController controller,
      ValueChanged<String> onChanged) {
    return GestureDetector(
      onTap: () async {
        DateTime? pickedDate = await _selectDate(context);
        if (pickedDate != null) {
          String formattedDate =
              DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSZ").format(pickedDate);
          onChanged(formattedDate);
        }
      },
      child: AbsorbPointer(
        child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
            labelText: label,
            suffixIcon: const Icon(Icons.calendar_today),
          ),
        ),
      ),
    );
  }

  Future<DateTime?> _selectDate(BuildContext context) async {
    DateTime today = DateTime.now();
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: today,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    return pickedDate;
  }

  Widget _buildOrderList(List<OrderContent> orders) {
    if (orders.isEmpty) {
      return const Center(
        child: Text('No orders found'),
      );
    }

    return ListView.builder(
      itemCount: orders.length,
      itemBuilder: (context, index) {
        final order = orders[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => OrderDetailScreen(orderContent: order),
              ),
            );
          },
          child: Card(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Order ID: #${order.orderId}',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: _getStatusColor(order.status),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          order.status,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Date: ${DateFormat('dd/MM/yyyy').format(DateTime.parse(order.createdAt))}',
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  const Divider(height: 20, thickness: 1),
                  ...order.products.map(
                    (product) => _buildProductItem(product),
                  ),
                  const Divider(height: 20, thickness: 1),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Total Amount:',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '${order.totalAmount} đ',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildProductItem(ProductPageOrder product) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              product.imageUrl,
              width: 60,
              height: 60,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.productName,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Quantity: ${product.quantity}',
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPagination(OrderPages orderPages) {
    final totalPages = (orderPages.totalElements / pageSize).ceil();

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: const Icon(Icons.chevron_left),
          onPressed: currentPage > 0
              ? () {
                  setState(() {
                    currentPage--;
                  });
                  _fetchOrders();
                }
              : null,
        ),
        Text('${currentPage + 1} of $totalPages'),
        IconButton(
          icon: const Icon(Icons.chevron_right),
          onPressed: currentPage < totalPages - 1
              ? () {
                  setState(() {
                    currentPage++;
                  });
                  _fetchOrders();
                }
              : null,
        ),
      ],
    );
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'pending':
        return Colors.orange;
      case 'processing':
        return Colors.blue;
      case 'shipped':
        return Colors.teal;
      case 'cancelled':
        return Colors.red;
      case 'completed':
        return Colors.green;
      default:
        return Colors.grey;
    }
  }
}
