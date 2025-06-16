<?php
$list_categories = $CategoryModel->select_all_categories();
$list_warehouse = $WarehousemModel->select_all_warehouse(); // Lấy danh sách sản phẩm từ kho

$success = '';
$error = '';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $warehouse_id = $_POST['warehouse_id'];
    $price = $_POST['price'];
    $sale_price = $_POST['sale_price'];
    $details = $_POST['details'];
    $short_description = $_POST['short_description'];

    // Kiểm tra dữ liệu nhập
    if (empty($warehouse_id)) {
        $error = "Vui lòng chọn sản phẩm từ kho.";
    } else {
        // Lấy thông tin warehouse
        $warehouse_details = $WarehousemModel->get_warehouse_details($warehouse_id);
        if (!$warehouse_details) {
            $error = "Sản phẩm trong kho không tồn tại.";
        } else {
            $image = null; // Khởi tạo giá trị hình ảnh

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $warehouse_id = $_POST['warehouse_id'];
    $price = $_POST['price'];
    $sale_price = $_POST['sale_price'];
    $details = $_POST['details'];
    $short_description = $_POST['short_description'];

    // Kiểm tra dữ liệu nhập
    if (empty($warehouse_id)) {
        $error = "Vui lòng chọn sản phẩm từ kho.";
    } else {
        // Lấy thông tin warehouse
        $warehouse_details = $WarehousemModel->get_warehouse_details($warehouse_id);
        if (!$warehouse_details) {
            $error = "Sản phẩm trong kho không tồn tại.";
        } else {
            // Xử lý hình ảnh
           // Xử lý hình ảnh
        if (!empty($_FILES['image']['name'])) {
            // Đường dẫn đầy đủ tới thư mục upload
            $target_dir = dirname(__DIR__, 2) . "/upload/"; // Lấy 2 cấp trên của thư mục hiện tại
            $file_name = basename($_FILES['image']['name']); // Tên file gốc
            $target_file = $target_dir . $file_name; // Đường dẫn đầy đủ tới file lưu trữ
            $file_type = strtolower(pathinfo($target_file, PATHINFO_EXTENSION)); // Lấy phần mở rộng file

            // Kiểm tra định dạng file
            $allowed_types = ['jpg', 'jpeg', 'png'];
            if (!in_array($file_type, $allowed_types)) {
                $error = "Chỉ cho phép các định dạng hình ảnh: JPG, JPEG, PNG.";
            } else {
                // Tạo thư mục nếu chưa tồn tại
                if (!is_dir($target_dir)) {
                    mkdir($target_dir, 0777, true);
                }

                // Di chuyển file tải lên vào thư mục
                if (move_uploaded_file($_FILES['image']['tmp_name'], $target_file)) {
                    $image = $file_name; // Chỉ lưu tên file (không lưu đường dẫn đầy đủ)
                } else {
                    $error = "Không thể tải lên hình ảnh.";
                }
            }
        }


            // Thêm sản phẩm nếu không có lỗi
            if (!$error) {
                try {
                    $result = $ProductModel->add_linked_product_from_warehouse(
                        $warehouse_details, 
                        $price, 
                        $sale_price, 
                        $details, 
                        $short_description, 
                        $image
                    );

                    if ($result) {
                        $success = "Sản phẩm đã được thêm thành công.";
                        header("Location: index.php?quanli=danh-sach-san-pham");                        exit();
                    } else {
                        $error = "Lỗi khi thêm sản phẩm.";
                    }
                } catch (Exception $e) {
                    $error = "Lỗi: " . $e->getMessage();
                }
            }
        }
    }
}

        }
    }
}

$html_alert = $BaseModel->alert_error_success($error, $success);
?>


<!-- Form Start -->
<div class="container-fluid pt-4">
    <form class="row g-4" action="" method="post" enctype="multipart/form-data">
        <div class="col-sm-12 col-xl-9">
            <div class="bg-light rounded h-100 p-4">
                <h6 class="mb-4">
                    <a href="index.php?quanli=danh-sach-san-pham" class="link-not-hover">Sản phẩm</a>
                    / Thêm sản phẩm
                </h6>
                <?= $html_alert ?>

                <!-- Chọn sản phẩm từ kho -->
                <label for="warehouse_id">Chọn sản phẩm từ kho</label>
                <div class="col-sm-12 col-xl-3 w-100">
                    <select name="warehouse_id" class="form-control" id="warehouse_id" required>
                        <option value="">Chọn sản phẩm</option>
                        <?php foreach ($list_warehouse as $product): ?>
                            <option value="<?= $product['warehouse_id'] ?>"><?= $product['name'] ?></option>
                        <?php endforeach; ?>
                    </select>
                </div>
                <br>

                <!-- Giá bán -->
                <label for="price">Giá bán</label>
                <input type="number" name="price" class="form-control" required>
                <br>

                <!-- Giá khuyến mãi -->
                <label for="sale_price">Giá khuyến mãi</label>
                <input type="number" name="sale_price" class="form-control">
                <br>

                <!-- Mô tả ngắn -->
                <label for="short_description">Mô tả ngắn</label>
                <textarea name="short_description" class="form-control"></textarea>
                <br>

                <!-- Chi tiết -->
                <label for="details">Chi tiết</label>
                <textarea name="details" class="form-control"></textarea>
                <br>

                <div class="mb-3">
                    <label for="formFileSm" class="form-label">Hình ảnh (JPG, PNG, )</label>
                    <input style="background-color: #fff" class="form-control form-control-sm" name="image" id="formFileSm" type="file">
                    <div class="my-2">
                    <img src="../../upload/<?= $image ?>" style="width: 100%;" class="img-fluid" alt="">
                    </div>
                </div>

                <br>

                <div class="col-sm-12 col-xl-3">
                    <button type="submit" name="themsanpham" class="btn btn-primary w-100">Thêm sản phẩm</button>
                </div>
            </div>
        </div>
    </form>
</div>
<!-- Form End -->

<style>
    .col-sm-12.col-xl-3 {
        width: 100%;
        margin: 0 auto;
    }
</style>
