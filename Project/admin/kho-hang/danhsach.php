<?php
// Handle search and category filter
if (isset($_POST['search'])) {
    $keyword = $_POST['keyword'];
    $cate_id = $_POST['search_cate'];
} else {
    $keyword = '';
    $cate_id = 0;
}

// Handle product deletion
if (isset($_GET['xoa'])) {
    $id = $_GET['xoa'];
    try {
        $WarehousemModel->delete_warehouse($id);
    } catch (\Throwable $th) {
        // Handle error if needed
        throw $th;
    }
}

// Get all categories to display in the search filter
$list_categories = $CategoryModel->select_all_categories();

// Fetch the list of warehouse products
$list_warehouse = $WarehousemModel->select_all_warehouse($keyword, $cate_id);
?>

<!-- LIST PRODUCTS -->
<div class="container-fluid pt-4 px-4">
    <div class="bg-light text-center rounded p-4">
        <div class="d-flex align-items-center justify-content-between mb-4">
            <h6 class="mb-0">Kho hàng</h6>
            <a href="them-hoa-don" class="btn btn-custom"><i class="fa fa-plus"></i> Nhập hàng</a>
        </div>

        <!-- Search Form -->
        <!-- <form method="post" class="row align-items-center mb-4">
            <div class="col-lg-5">
                <input type="text" name="keyword" class="form-control" placeholder="Tìm kiếm sản phẩm" value="<?=$keyword?>">
            </div>
            <div class="col-lg-3">
                <select name="search_cate" class="form-select">
                    <option value="0">Chọn danh mục</option>
                    <?php foreach ($list_categories as $value) : ?>
                        <option value="<?=$value['category_id']?>" <?=$value['category_id'] == $cate_id ? 'selected' : ''?>><?=$value['name']?></option>
                    <?php endforeach ?>
                </select>
            </div>
            <div class="col-lg-2">
                <button type="submit" name="search" class="btn btn-custom">Tìm kiếm</button>
            </div>
        </form> -->

        <!-- Warehouse Products Table -->
        <div class="table-responsive">
            <table class="table text-start align-middle table-bordered table-hover mb-0" id="khohang-list">
            <thead>
                <tr class="text-dark">
                    <th scope="col">#</th>
                    <th scope="col">Mã danh mục</th>
                    <th scope="col">Tên sản phẩm</th>
                    <th scope="col">Ngày nhập</th>
                    <th scope="col">Tồn kho</th>
                    <th scope="col">Trạng thái</th>
                    <th scope="col">Giá mua vào</th>
                    <th scope="col">Thao tác</th>
                </tr>
            </thead>
            <tbody>
                <?php foreach ($list_warehouse as $value): ?>
                    <tr>
                        <td class="text-dark"><?=$value['warehouse_id']?></td>
                        <td class="text-dark"><?=$value['category_id']?></td>
                        <td class="text-dark"><?=$value['name']?></td>
                        <td class="text-dark"><?=$BaseModel->date_format($value['create_date'], '')?></td>
                        <td class="text-dark"><?=$value['quantity']?></td>
                        <td class="text-dark"><?=($value['quantity'] == 0 ? 'Hết hàng' : ($value['quantity'] < 10 ? 'Số lượng ít' : 'Còn hàng'))?></td>
                        <td class="text-dark"><?=number_format($value['o_price'])?>₫</td>
                        <td>
                            <a href="index.php?quanli=kho-hang&xoa=<?=$value['warehouse_id']?>" 
                            class="btn btn-danger" 
                            onclick="return confirmDelete();">Xóa</a>
                        </td>
                    </tr>
                <?php endforeach; ?>
            </tbody>
            </table>
        </div>
    </div>
</div>
<!-- LIST PRODUCTS END -->
<script type="text/javascript">
    function confirmDelete() {
        return confirm("Bạn có chắc chắn muốn xóa mục này?");
    }
</script>