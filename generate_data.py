import csv
import random
from datetime import date, timedelta

customers = [
    ("C001", "Budi Santoso", "Jakarta", "Indonesia", "Consumer"),
    ("C002", "Siti Nurhaliza", "Bandung", "Indonesia", "Corporate"),
    ("C003", "Ahmad Dahlan", "Surabaya", "Indonesia", "Home Office"),
    ("C004", "Dewi Lestari", "Jakarta", "Indonesia", "Consumer"),
    ("C005", "Eko Prasetyo", "Medan", "Indonesia", "Corporate"),
    ("C006", "Fitri Handayani", "Bali", "Indonesia", "Consumer"),
    ("C007", "Gunawan Wibowo", "Semarang", "Indonesia", "Home Office"),
    ("C008", "Hana Permata", "Yogyakarta", "Indonesia", "Consumer"),
]

products = [
    ("P001", "Ergonomic Chair", "Furniture", "Chairs", 250.00),
    ("P002", "Standing Desk", "Furniture", "Tables", 450.00),
    ("P003", "LED Monitor 24\"", "Technology", "Displays", 180.00),
    ("P004", "Wireless Mouse", "Technology", "Accessories", 35.00),
    ("P005", "USB-C Hub", "Technology", "Accessories", 55.00),
    ("P006", "Notebook A5", "Office Supplies", "Paper", 8.00),
    ("P007", "Stapler", "Office Supplies", "Binders", 15.00),
    ("P008", "Desk Lamp", "Furniture", "Furnishings", 42.00),
    ("P009", "Headphones", "Technology", "Audio", 120.00),
    ("P010", "Whiteboard", "Office Supplies", "Supplies", 65.00),
]

start_date = date(2023, 1, 1)
end_date = date(2025, 12, 31)
days_range = (end_date - start_date).days

with open("sales_data.csv", "w", newline="") as f:
    writer = csv.writer(f)
    writer.writerow(["order_id", "order_date", "customer_id", "customer_name",
                      "city", "country", "segment", "product_id", "product_name",
                      "category", "sub_category", "unit_price", "quantity", "discount"])

    for i in range(1, 1001):
        order_id = f"ORD-{i:04d}"
        order_date = start_date + timedelta(days=random.randint(0, days_range))
        customer = random.choice(customers)
        product = random.choice(products)
        quantity = random.randint(1, 5)
        discount = random.choice([0.0, 0.0, 0.0, 0.1, 0.2])

        writer.writerow([
            order_id, order_date,
            customer[0], customer[1], customer[2], customer[3], customer[4],
            product[0], product[1], product[2], product[3],
            product[4], quantity, discount
        ])

print("Done! 1000 rows written to sales_data.csv")