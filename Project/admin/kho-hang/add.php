<?php
$list_categories = $CategoryModel->select_all_categories();
$error = array(
    'category_id' => '',
    'name' => '',
    'o_price' => '',
    'quantity' => '',
);
$temp = array(
    'category_id' => '',
    'name' => '',
    'o_price' => '',
    'quantity' => '',
);
$success = '';

// Kiểm tra nếu form được submit
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST["add_user"])) {
    $category_id = trim($_POST["category_id"]);
    $name = trim($_POST["name"]);
    $o_price = trim($_POST["o_price"]);
    $quantity = trim($_POST["quantity"]);

    if (empty($category_id) || !is_numeric($category_id)) {
        $error['category_id'] = 'Mã danh mục không hợp lệ';
    }

    if (strlen($name) > 255) {
        $error['name'] = 'Tên sản phẩm không được quá 255 ký tự';
    }

    if ($o_price <= 0) {
        $error['o_price'] = 'Giá phải là số dương';
    }

    if ($quantity <= 0) {
        $error['quantity'] = 'Số lượng phải là số dương';
    }

    if (empty(array_filter($error))) {
        $WarehousemModel = new WarehousemModel();
        $success = $WarehousemModel->insert_warehouse($category_id, $name, $o_price, $quantity);
    }
}

$html_alert = $BaseModel->alert_error_success('', $success);
?>

<div class="container-fluid pt-4" style="margin-bottom: 110px;">
<form class="row g-4" action="" method="post" enctype="multipart/form-data">
    <div class="col-sm-12 col-xl-12">
        <div class="bg-light rounded h-100 p-4">
            <h6 class="mb-4">Thêm sản phẩm vào kho</h6>
            <?=$html_alert?>

            <label for="category_id">Danh mục sản phẩm</label>
            <div class="form-floating mb-3">
                <select name="category_id" class="form-select" id="floatingSelect" required>
                    <?php foreach ($list_categories as $value) : ?>
                        <option value="<?=$value['category_id']?>"><?=$value['name']?></option>
                    <?php endforeach ?>
                </select>
                <label for="floatingSelect">Chọn danh mục</label>
            </div>

            <label for="name">Tên sản phẩm</label>
            <div class="mb-1">
                <input name="name" type="text" class="form-control" value="<?=$temp['name']?>" required>
                <span class="text-danger err"><?=$error['name']?></span>
            </div>

            <label for="o_price">Giá mua vào</label>
            <div class="mb-1">
                <input name="o_price" type="number" value="<?=$temp['o_price']?>" class="form-control" required>
                <span class="text-danger err"><?=$error['o_price']?></span>
            </div>

            <label for="quantity">Số lượng nhập</label>
            <div class="mb-1">
                <input name="quantity" type="number" value="<?=$temp['quantity']?>" class="form-control" required>
                <span class="text-danger err"><?=$error['quantity']?></span>
            </div>

            <h6 class="mb-4">
                <input type="submit" name="add_user" value="Nhập sản phẩm" class="btn btn-custom">
            </h6>
        </div>
    </div>
</form>

</div>

<!-- Form End -->
<style>
.err {
    display: inline-block;
    height: 22px;
}
</style>
