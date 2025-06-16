<?php
include "PHPMailer/send-mail.php";
define('URL_RECOVERY', 'http://localhost/DUAN1_BOOKSTORE/');

$success = '';
$error = '';
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST["forgot_password"])) {
    $email = trim($_POST["email_forgot"]);

    if (empty($email)) {
        $error = 'Email không được để trống';
    } else {
        // Kiểm tra email có tồn tại không
        $result = $CustomerModel->select_email_in_users($email);
        if ($result === false) {
            $error = 'Email không tồn tại';
        } else {
            // Tạo token ngẫu nhiên
            $token = bin2hex(random_bytes(50));

            // Cập nhật token vào cơ sở dữ liệu
            $updateResult = $CustomerModel->update_recovery_token($email, $token);
            if (!$updateResult) {
                $error = 'Không thể tạo token khôi phục mật khẩu.';
            } else {
                // Chuẩn bị gửi email
                $title = 'Khôi phục mật khẩu NPK';
                $recoveryLink = URL_RECOVERY . 'khoi-phuc-mat-khau&email=' . $email . '&token=' . $token;

                // Nội dung email được tạo trong thems-email.php
                include "views/user/thems-email.php";

                $result = sendEmail($email, $title, $html_forgot_password);

                if ($result) {
                    $success = 'Chúng tôi vừa gửi 1 email khôi phục mật khẩu cho bạn. Vui lòng kiểm tra email.';
                    setcookie('token', $token, time() + 1800, '/');
                } else {
                    $error = 'Không thể gửi email. Vui lòng thử lại sau.';
                }
            }
        }
    }
}

$html_alert = $BaseModel->alert_error_success($error, $success);
?>

<style>

label {
    margin-top: 5px;
}
</style>
<div class="container my-5">
    <div class="row d-flex justify-content-center align-items-center m-0">
        <div class="login_oueter">

            <form action="" method="post" id="login" autocomplete="off" class="p-3">
                <h4 class="my-3 text-center">Quên mật khẩu</h4>
                <?=$html_alert?>
                <div class="form-row">
                    <div class="col-12">
                        <div class="input-group my-0">
                            <label class="w-100 text-dark" for="email_forgot">Email đăng ký</label>
                            <div class="input-group-prepend">
                                <span class="input-group-text" id="basic-addon1"><i class="fas fa-envelope"></i></span>
                            </div>
                            <input name="email_forgot" type="email" value="" class="input form-control" id="email_forgot" placeholder="Email" required="true" />
                            <span class="w-100 text-danger"><?=$error?></span>
                        </div>
                    </div>
                    

                    <div class="col-12 mt-4">
                        <button class="btn btn-primary w-100" type="submit" name="forgot_password">Lấy lại mật khẩu</button>
                    </div>
                </div>
                <div class="col-12 line"></div>
                <div class="col-12 text-center">
                    <a href="index.php?url=dang-ky" class="btn btn-success w-50">Tạo tài khoản</a>
                </div>
            </form>
        </div>
    </div>

</div>
