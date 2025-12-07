<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Payment Form</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h2>Payment Form</h2>
        <form action="AdminPatient " method="post" onsubmit="calculateTotal()">
            <div class="mb-3">
                <label for="packageName" class="form-label">Package Name</label>
                <select class="form-select" id="packageName" name="packageName" required>
                    <option value="">Select a package</option>
                    <option value="Basic">Basic</option>
                    <option value="Premium">Premium</option>
                    <option value="Enterprise">Enterprise</option>
                </select>
            </div>
            <div class="mb-3">
                <label for="price" class="form-label">Price</label>
                <input type="number" step="0.01" class="form-control" id="price" name="price" required oninput="calculateTotal()">
            </div>
            <div class="mb-3">
                <label for="total" class="form-label">Total</label>
                <input type="number" step="0.01" class="form-control" id="total" name="total" readonly>
            </div>
            <button type="submit" class="btn btn-primary">Submit Payment</button>
        </form>
        <a href="admin" class="btn btn-secondary mt-3">View All Payments (Admin)</a>
    </div>
    <script>
        function calculateTotal() {
            const price = document.getElementById('price').value;
            const totalField = document.getElementById('total');
            totalField.value = price ? parseFloat(price).toFixed(2) : 0;
        }
    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>