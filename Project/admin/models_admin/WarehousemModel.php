<?php
    class WarehousemModel {

        public function select_all_warehouse() {
            $sql = "SELECT * FROM warehouse ORDER BY warehouse_id DESC";
            return pdo_query($sql);
        }
    
        public function insert_warehouse($category_id, $name, $o_price, $quantity) {
            // Kiểm tra nếu category_id là rỗng
            if (empty($category_id)) {
                return "Danh mục không được để trống!";
            }
        
            // Lấy ngày nhập kho hiện tại
            $import_date = date('Y-m-d H:i:s');
        
            // Thêm sản phẩm vào kho (bảng warehouse)
            $sql = "INSERT INTO warehouse (category_id, name, o_price, quantity, create_date)
                    VALUES (?, ?, ?, ?, ?)";
            try {
                // Chạy câu lệnh SQL để thêm sản phẩm vào kho
                pdo_execute($sql, $category_id, $name, $o_price, $quantity, $import_date);
        
                // Lấy warehouse_id vừa thêm
                $conn = pdo_get_connection(); // Assuming pdo_get_connection() gets the PDO connection object
                $warehouse_id = $conn->lastInsertId();  // Use lastInsertId() method
        
        
                header("Location: index.php?quanli=kho-hang");                
            } catch (PDOException $e) {
                return "Lỗi khi thêm sản phẩm vào kho: " . $e->getMessage();
            }
        }
        
        // public function update_product_quantity($warehouse_id, $quantity) {
        //     // Lấy thông tin sản phẩm từ bảng warehouse dựa trên warehouse_id
        //     $sql = "SELECT * FROM warehouse WHERE warehouse_id = ?";
        //     $warehouse_details = pdo_query_one($sql, $warehouse_id);
    
        //     if (!$warehouse_details) {
        //         return "Kho không tồn tại.";
        //     }
    
        //     $product_id = $warehouse_details['product_id']; // Giả sử bảng `warehouse` có `product_id` liên kết với bảng `products`
        //     $new_quantity_in_warehouse = $warehouse_details['quantity'] - $quantity;
    
        //     // Cập nhật số lượng trong bảng warehouse
        //     $sql = "UPDATE warehouse SET quantity = ? WHERE warehouse_id = ?";
        //     pdo_execute($sql, $new_quantity_in_warehouse, $warehouse_id);
    
        //     // Cập nhật số lượng sản phẩm trong bảng products
        //     $this->update_product_quantity_in_products($product_id, $quantity);
        // }
    
        // Hàm cập nhật số lượng sản phẩm trong bảng `products`
        private function update_product_quantity_in_products($product_id, $quantity) {
            $sql = "UPDATE products SET quantity = quantity - ? WHERE product_id = ?";
            pdo_execute($sql, $quantity, $product_id);
        }
     
        
    
        // Cập nhật số lượng sản phẩm trong bảng products khi có thay đổi trong kho
        private function update_product_quantity($product_id, $quantity) {
            // Cập nhật số lượng sản phẩm trong bảng products
            $sql = "UPDATE products SET quantity = quantity + ? WHERE product_id = ?";
            pdo_execute($sql, $quantity, $product_id);
        }
    
        public function delete_warehouse($id) {
            $sql = "DELETE FROM warehouse WHERE warehouse_id = ?";
            pdo_execute($sql, $id);
        }
        
        public function get_warehouse_details($warehouse_id) {
            $sql = "SELECT * FROM warehouse WHERE warehouse_id = ?";
            return pdo_query_one($sql, $warehouse_id);
        }


        
        public function update_linked_products($warehouse_id, $new_quantity) {
            // Cập nhật số lượng sản phẩm liên kết với warehouse
            $sql = "UPDATE products SET quantity = ? WHERE warehouse_id = ?";
            pdo_execute($sql, $new_quantity, $warehouse_id);
        }


        public function sync_product_and_warehouse_quantity($product_id, $quantity_change) {
            // Lấy thông tin sản phẩm từ bảng products
            $sql = "SELECT * FROM products WHERE product_id = ?";
            $product = pdo_query_one($sql, $product_id);
            
            if (!$product) {
                return "Sản phẩm không tồn tại.";
            }
    
            // Lấy warehouse_id từ bảng products
            $warehouse_id = $product['warehouse_id'];
    
            // Lấy thông tin kho từ bảng warehouse
            $sql = "SELECT * FROM warehouse WHERE warehouse_id = ?";
            $warehouse = pdo_query_one($sql, $warehouse_id);
            
            if (!$warehouse) {
                return "Kho không tồn tại.";
            }
    
            // Tính toán lại số lượng kho sau khi thay đổi
            $new_quantity_in_warehouse = $warehouse['quantity'] - $quantity_change;
    
            // Cập nhật số lượng kho
            $sql = "UPDATE warehouse SET quantity = ? WHERE warehouse_id = ?";
            pdo_execute($sql, $new_quantity_in_warehouse, $warehouse_id);
    
            // Cập nhật số lượng sản phẩm trong bảng products
            $sql = "UPDATE products SET quantity = quantity - ? WHERE product_id = ?";
            pdo_execute($sql, $quantity_change, $product_id);
    
            return "Cập nhật số lượng thành công!";
        }
        public function count_total_items() {
            $sql = "SELECT COUNT(*) as total FROM warehouse";
            $result = pdo_query_one($sql);
            return $result['total'];
        }
        
        
        
    }
    
    
    $WarehousemModel = new WarehousemModel();
    
?>