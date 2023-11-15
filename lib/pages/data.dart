import 'package:flutter/material.dart';

class MyData extends StatefulWidget {
  const MyData({super.key});

  @override
  State<MyData> createState() => _MyDataState();
}

class _MyDataState extends State<MyData> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}


class ProductListPage extends StatefulWidget {
  @override
  _ProductListPageState createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  final List<Product> products = [
    Product(id: 1, name: 'Produk 1', price: 10000),
    Product(id: 2, name: 'Produk 2', price: 20000),
    Product(id: 3, name: 'Produk 3', price: 30000),
    Product(id: 4, name: 'Produk 4', price: 40000),
    Product(id: 5, name: 'Produk 5', price: 50000),
    Product(id: 6, name: 'Produk 6', price: 60000),
    Product(id: 7, name: 'Produk 7', price: 70000),
    Product(id: 8, name: 'Produk 8', price: 80000),
    Product(id: 9, name: 'Produk 9', price: 90000),
    Product(id: 10, name: 'Produk 10', price: 100000),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Produk'),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(products[index].name),
            subtitle: Text('Harga: Rp ${products[index].price}'),
            trailing: IconButton(
              icon: Icon(
                Icons.delete,
                color: Colors.red, // Ganti warna ikon sesuai keinginan
              ),
              onPressed: () {
                // Panggil fungsi untuk menghapus produk
                _showDeleteDialog(context, index);
              },
            ),
            onTap: () {
              // Tambahkan aksi atau navigasi ke halaman detail jika diperlukan
              // Misalnya: Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailPage(product: products[index])));
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Panggil fungsi untuk menambahkan produk baru
          _showAddProductDialog(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Future<void> _showDeleteDialog(BuildContext context, int index) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Konfirmasi Penghapusan'),
          content: Text('Apakah Anda yakin ingin menghapus produk ini?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Batal'),
            ),
            TextButton(
              onPressed: () {
                // Panggil fungsi untuk menghapus produk
                _deleteProduct(index);
                Navigator.pop(context);
              },
              child: Text('Hapus'),
            ),
          ],
        );
      },
    );
  }

  void _deleteProduct(int index) {
    setState(() {
      products.removeAt(index);
    });
  }

  Future<void> _showAddProductDialog(BuildContext context) async {
    TextEditingController nameController = TextEditingController();
    TextEditingController priceController = TextEditingController();

    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Tambah Produk Baru'),
          content: Column(
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Nama Produk'),
              ),
              TextField(
                controller: priceController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Harga'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Batal'),
            ),
            TextButton(
              onPressed: () {
                // Panggil fungsi untuk menambahkan produk baru
                _addProduct(nameController.text, priceController.text);
                Navigator.pop(context);
              },
              child: Text('Tambah'),
            ),
          ],
        );
      },
    );
  }

  void _addProduct(String name, String price) {
    double newPrice = double.tryParse(price) ?? 0.0;

    setState(() {
      products.add(Product(
        id: products.length + 1,
        name: name,
        price: newPrice,
      ));
    });
  }
}

class Product {
  final int id;
  final String name;
  final double price;

  Product({
    required this.id,
    required this.name,
    required this.price,
  });
}