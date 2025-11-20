import pandas as pd

data2 = {
    'date': ["2025-11-08", "2025-11-09", "2025-11-10", "2025-11-11", "2025-11-12"],
    'activity': ["jumping jacks", "push ups", "sit ups", "sit ups", "running"],
    'duration': [30, 45, 45, 45, 60]
}
workout = pd.DataFrame(data2)

photos = pd.read_csv("https://pdi.run/f25-2000-photos.csv")
print(photos)

data = {
    'date': ['2023-07-01', '2023-07-01', '2023-07-02'],
    'dish': ['Pasta', 'Salad', 'Burger'],
    'quantity': [2, 1, 3],
    'order_type': ['dine-in', 'takeout', 'dine-in']
}

orders = pd.DataFrame(data)

def duration_to_category(duration: int) -> str:
    if duration >= 60:
        return "long"
    elif duration >= 30:
        return "medium"
    else:
        return "short"

workout['workout_category'] = workout.apply(lambda row: duration_to_category(row['duration']), axis=1)

workout['calories_burned'] = workout.apply(lambda row: row['duration'] * 8, axis=1)

photos['is_landscape'] = photos.apply(lambda row: row['Location'].contains('Park') or row['Location'].contains('Garden'), axis=1)

long_workout = workout[workout['duration'] >= 45]

forest_photos = photos[photos['Subject'] == 'Forest']

workout['duration'] = workout['duration'].apply(lambda f: f / 60)

photos['Subject'] = photos['Subject'].apply(lambda f: f.upper())
