import pandas as pd

data = {
    'date': ['2023-07-01', '2023-07-01', '2023-07-02'],
    'dish': ['Pasta', 'Salad', 'Burger'],
    'quantity': [2, 1, 3],
    'order_type': ['dine-in', 'takeout', 'dine-in']
}

orders = pd.DataFrame(data)

orders.iloc[1]
orders.iloc[1]['dish']

quantities = orders['quantity']

orders['quantity'].mean()
orders['quantity'].sum()

data2 = {
    'date': ["2025-11-08", "2025-11-09", "2025-11-10", "2025-11-11", "2025-11-12"],
    'activity': ["jumping jacks", "push ups", "sit ups", "sit ups", "running"],
    'duration': [30, 45, 45, 45, 60]
}
workout = pd.DataFrame(data2)

photos = pd.read_csv("https://pdi.run/f25-2000-photos.csv")

print(photos.iloc[0])
print(photos.iloc[1])
print(photos.iloc[2])
print(photos.iloc[3])
print(photos.iloc[4])

print(workout.iloc[1])

durations = workout['duration']

durations.mean()
durations.sum()
durations.max()
durations.min()

workout_range = durations.max() - durations.min()

print(pd.Series(workout['activity'], name='A').unique())

print(durations.iloc[2])

print(orders['quantity'].median())
