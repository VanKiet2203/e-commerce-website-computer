<?php
    class ProductModel {
        public function insert_product($category_id, $name, $image, $quantity, $price, $sale_price, $details, $short_description) {
           
           $sql = "INSERT INTO products 
           (category_id, name, image, quantity, price, sale_price, details, short_description)
            VALUES (?,?,?,?,?,?,?,?)";

            pdo_execute($sql, $category_id, $name, $image, $quantity, $price, $sale_price, $details, $short_description);
        }

        public function select_products() {
            $sql = "SELECT name FROM products WHERE status = 1";

            return pdo_query($sql);
        }

        public function update_product_not_active($product_id) {
            $sql = "UPDATE products SET status = 0 WHERE product_id = ?";

            pdo_execute($sql, $product_id);
        }

        public function update_product_active($product_id) {
            $sql = "UPDATE products SET status = 1 WHERE product_id = ?";

            pdo_execute($sql, $product_id);
        }

        function select_list_products($keyword, $id_danhmuc, $page, $perPage) {
            // Tính toán vị trí bắt đầu của kết quả trên trang hiện tại
            $start = ($page - 1) * $perPage;
        
            // Bắt đầu câu truy vấn SQL
            $sql = "SELECT * FROM products WHERE 1";
            
            // Thêm điều kiện tìm kiếm theo keyword
            if($keyword != '') {
                $sql .= " AND name LIKE '%" . $keyword . "%'";
            }
        
            // Thêm điều kiện tìm kiếm theo id_danhmuc
            if($id_danhmuc > 0) {
                $sql .= " AND category_id ='" . $id_danhmuc . "'";
            }
        
            // Sắp xếp theo id giảm dần
            $sql .= " AND status = 1 ORDER BY product_id DESC";
        
            // Thêm phần phân trang
            $sql .= " LIMIT " . $start . ", " . $perPage;
        
            return pdo_query($sql);
        }

        public function select_recycle_products() {
            $sql = "SELECT * FROM products WHERE status = 0 ORDER BY product_id DESC";

            return pdo_query($sql);
        }

        public function select_product_by_id($product_id) {
            $sql = "SELECT * FROM products WHERE product_id =?";

            return pdo_query_one($sql, $product_id);
        }

        public function discount_percentage($price, $sale_price) {
            $discount_percentage = ($price - $sale_price) / $price * 100;

            $round__percentage = round($discount_percentage, 0)."%";
            return $round__percentage;
        }

        public function formatted_price($price) {
            $format = number_format($price, 0, ',', '.') . 'đ';
            return $format;
        }

        // Delete
        public function delete_product($product_id) {
            $sql = "DELETE FROM products WHERE product_id = ?";
            pdo_execute($sql, $product_id);
        }

        public function update_product($category_id, $name, $image, $quantity, $price, $sale_price, $details, $short_description, $product_id) {
            $sql = "UPDATE products SET 
            category_id = '".$category_id."', 
            name = '".$name."',";
    
            if ($image != '') {
                $sql .= " image = '".$image."',";
            }

            $sql .= " quantity = '".$quantity."', 
                    price = '".$price."', 
                    sale_price = '".$sale_price."', 
                    details = '".$details."', 
                    short_description = '".$short_description."' 
                    WHERE product_id = ".$product_id;
            
            
            pdo_execute($sql);
        }

        public function create_product_from_warehouse($warehouse_id, $image, $price, $sale_price, $details, $short_description) {
            // Lấy thông tin warehouse
            global $WarehousemModel;
            $warehouse_details = $WarehousemModel->get_warehouse_details($warehouse_id);
        
            if (!$warehouse_details) {
                return "Warehouse không tồn tại.";
            }
        
            $category_id = $warehouse_details['category_id'];
            $name = $warehouse_details['name'];
            $quantity = $warehouse_details['quantity'];
        
            // Lưu dữ liệu sản phẩm
            $sql = "INSERT INTO products (category_id, name, image, quantity, price, sale_price, details, short_description)
                    VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        
            pdo_execute($sql, $category_id, $name, $image, $quantity, $price, $sale_price, $details, $short_description);
        
            return "Sản phẩm đã được thêm thành công.";
        }
        public function add_linked_product_from_warehouse($warehouse_details, $price, $sale_price, $details, $short_description, $image)
{
    // Kiểm tra nếu warehouse_id đã tồn tại trong bảng products
    $sql = "SELECT * FROM products WHERE warehouse_id = ?";
    $existing_product = pdo_query_one($sql, $warehouse_details['warehouse_id']);

    // Nếu sản phẩm đã tồn tại, không thêm lại
    if ($existing_product) {
        throw new Exception("Sản phẩm đã tồn tại trong danh sách.");
    }

    // Thêm sản phẩm vào bảng products
    $sql = "INSERT INTO products (warehouse_id, category_id, name, quantity, price, sale_price, details, short_description, image)
            VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

    try {
        pdo_execute($sql, 
                    $warehouse_details['warehouse_id'], 
                    $warehouse_details['category_id'], 
                    $warehouse_details['name'], 
                    $warehouse_details['quantity'], 
                    $price, 
                    $sale_price, 
                    $details, 
                    $short_description, 
                    $image
        );
        return true;
    } catch (PDOException $e) {
        throw new Exception("Lỗi SQL: " . $e->getMessage());
    }
}

public function update_product_quantity_and_warehouse($product_id, $new_quantity) {
    // Lấy thông tin sản phẩm từ bảng products
    $sql = "SELECT * FROM products WHERE product_id = ?";
    $product = pdo_query_one($sql, $product_id);

    if (!$product) {
        return "Sản phẩm không tồn tại.";
    }

    // Lấy warehouse_id từ bảng products
    $warehouse_id = $product['warehouse_id'];

    // Cập nhật số lượng trong bảng products
    $sql = "UPDATE products SET quantity = ? WHERE product_id = ?";
    pdo_execute($sql, $new_quantity, $product_id);

    // Cập nhật số lượng trong bảng warehouse (số lượng kho phải phản ánh số lượng sản phẩm)
    $sql = "UPDATE warehouse SET quantity = ? WHERE warehouse_id = ?";
    pdo_execute($sql, $new_quantity, $warehouse_id);

    return "Cập nhật số lượng thành công!";
}

        
    }

    $ProductModel = new ProductModel();
?>