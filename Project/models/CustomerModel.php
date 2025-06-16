<?php
    class CustomerModel {
        private $pdo;
        public function __construct() {
            $this->pdo = pdo_get_connection(); // Sử dụng hàm pdo_get_connection() đã khai báo
        }
        public function select_users() {
            $sql = "SELECT username, full_name, email, phone FROM users";
            return pdo_query($sql);
        }

        public function select_email_in_users($email) {
            $stmt = $this->pdo->prepare("SELECT * FROM users WHERE email = :email");
            $stmt->bindParam(':email', $email, PDO::PARAM_STR);
            $stmt->execute();
            return $stmt->fetch(PDO::FETCH_ASSOC);
        }
        

        public function user_insert($username, $password, $full_name, $image, $email, $phone, $address) {
            $sql = "INSERT INTO users(username, password, full_name, image, email, phone, address) VALUES(?,?,?,?,?,?,?)";
            pdo_execute($sql, $username, $password, $full_name, $image, $email, $phone, $address);
        }
    
        public function get_user_by_username($username) {
            $sql = "SELECT * FROM users WHERE username = ?";
            return pdo_query($sql, $username);
        }
    
        public function update_password($new_password, $user_id) {
            $sql = "UPDATE users SET password = ? WHERE user_id = ?";
            pdo_execute($sql, $new_password, $user_id);
        }
    
        public function reset_password($new_password, $email) {
            $sql = "UPDATE users SET password = ? WHERE email = ?";
            pdo_execute($sql, $new_password, $email);
        }
    
        public function update_user($full_name, $address, $phone, $image, $user_id) {
            $sql = "UPDATE users SET 
                full_name = '".$full_name."',";
    
            if ($image != '') {
                $sql .= " image = '".$image."',";
            }
    
            $sql .= " address = '".$address."', phone = '".$phone."'
                        WHERE user_id = ".$user_id;
    
            pdo_execute($sql);
        }
    
        public function update_recovery_token($email, $token) {
            $stmt = $this->pdo->prepare("
                UPDATE users 
                SET recovery_token = :token, 
                    token_expiry = NOW() + INTERVAL 30 MINUTE 
                WHERE email = :email
            ");
            $stmt->bindParam(':token', $token, PDO::PARAM_STR);
            $stmt->bindParam(':email', $email, PDO::PARAM_STR);
            return $stmt->execute();
        }

    }

    $CustomerModel = new CustomerModel();
?>