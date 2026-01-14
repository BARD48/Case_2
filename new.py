import pandas as pd
from datetime import datetime, timedelta
import random

# Base data loading
base = pd.read_csv('requests.csv')

# English configurations
services = ["Turkcell Mobile", "Superonline", "Paycell", "TV+", "BiP", "Fizy"]

request_types = {
    "Turkcell Mobile": ["PACKAGE_ISSUE", "COVERAGE_PROBLEM", "BILLING_DISPUTE"],
    "Superonline": ["CONNECTION_ISSUE", "SPEED_COMPLAINT", "MODEM_FAULT"],
    "Paycell": ["PAYMENT_PROBLEM", "BALANCE_ERROR"],
    "TV+": ["STREAMING_ISSUE", "LOGIN_PROBLEM"],
    "BiP": ["MESSAGE_DELIVERY", "NOTIFICATION_ISSUE"],
    "Fizy": ["PLAYBACK_ERROR", "SUBSCRIPTION_PROBLEM"]
}

urgencies = ["LOW", "MEDIUM", "HIGH"]
channels = ["Mobile App", "Call Center", "Web", "Social Media"]

rows = []
start_time = datetime(2026, 3, 12, 9, 0)

# Generating 50 rows of data
for i in range(1, 51):
    service = random.choice(services)
    rtype = random.choice(request_types[service])
    # Spreading requests every 5 minutes
    created = start_time + timedelta(minutes=5*i)
    
    rows.append({
        "request_id": f"REQ-TC-{i}",
        "user_id": f"U{random.randint(10, 200)}",
        "service": service,
        "request_type": rtype,
        "urgency": random.choice(urgencies),
        "channel": random.choice(channels),
        "created_at": created.isoformat() + "Z",
    })

# Create DataFrame
augmented_df = pd.DataFrame(rows)

# Save to new path
out_path = "turkcell_augmented_requests_en.csv"
augmented_df.to_csv(out_path, index=False)

print(f"File saved to: {out_path}")
print(augmented_df.head())
