<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�˾� �׽�Ʈ</title>
<style>
/* �˾� â ��Ÿ�� ���� */
.popup {
	width: 400px;
	height: 600px;
	background-color: white;
	border: 1px solid #ccc;
	box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.5);
	text-align: center;
	padding: 20px;
}

.btn {
	position: fixed;
	bottom: 0;
	right: 0;
}

body {
	overflow: hidden;
}
</style>
</head>
<body>

	<!-- �˾� ������ ��Ÿ���� div ��� �߰� -->
	<div class="popup">
		<a href="productAllPage.do" target="_blank"><img src="/resources/user/img/popup.jpg" alt="�˾� �̹���"></a>
	</div>

	<div class="btn">
		<button onclick="closePopupAndSetCookie()">�Ϸ絿�� �Ⱥ���</button>
	</div>

		<script>
			function closePopupAndSetCookie() {
				var cookieName = "popupShown";
				var cookieValue = "false";
				var expires = new Date();
				expires.setDate(expires.getDate() + 1); // �Ϸ� �ڿ� ����

				document.cookie = cookieName + "=" + cookieValue + "; expires="
						+ expires.toUTCString() + "; path=/";

				// �˾� â �ݱ�
				window.close();
			}
		</script>

	

</body>
</html>
